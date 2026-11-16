import { highlightSearchTerm } from "./highlight-search-term.js";

document.addEventListener("DOMContentLoaded", function () {
  // actual bibsearch logic

  // LOCAL OVERRIDE (see docs/ARCHITECTURE.md "Local overrides: your site vs. this repo" and
  // .al-folio-overrides.yml): adds a Journal/Conference type filter on top of upstream's text
  // search, driven by the `pub_type` badge that `_includes/hook/bib.liquid` renders for every
  // entry. Clicking a [data-pub-filter] button narrows the same `.unloaded` class that the text
  // search already uses, so both filters combine (AND) and the existing year-grouping logic
  // below still works unmodified.
  let currentTypeFilter = "all"; // "all" | "journal" | "conference"
  const typeFilterGroups = {
    journal: ["journal", "magazine"],
    conference: ["conference", "demo"],
  };

  const matchesTypeFilter = (element) => {
    if (currentTypeFilter === "all") {
      return true;
    }
    const badge = element.querySelector(".periodical .badge");
    const pubType = badge ? badge.textContent.trim().toLowerCase() : "";
    return (typeFilterGroups[currentTypeFilter] || []).includes(pubType);
  };

  const filterItems = (searchTerm) => {
    document.querySelectorAll(".bibliography, .unloaded").forEach((element) => element.classList.remove("unloaded"));

    // highlight-search-term
    if (CSS.highlights) {
      const nonMatchingElements = highlightSearchTerm({ search: searchTerm, selector: ".bibliography > li" }) || [];
      nonMatchingElements.forEach((element) => {
        element.classList.add("unloaded");
      });
    } else {
      // Simply add unloaded class to all non-matching items if Browser does not support CSS highlights
      document.querySelectorAll(".bibliography > li").forEach((element, index) => {
        const text = element.innerText.toLowerCase();
        if (text.indexOf(searchTerm) == -1) {
          element.classList.add("unloaded");
        }
      });
    }

    // LOCAL OVERRIDE: narrow further by the active Journal/Conference type filter.
    document.querySelectorAll(".bibliography > li").forEach((element) => {
      if (!matchesTypeFilter(element)) {
        element.classList.add("unloaded");
      }
    });

    document.querySelectorAll("h2.bibliography").forEach(function (element) {
      let iterator = element.nextElementSibling; // get next sibling element after h2, which can be h3 or ol
      let hideFirstGroupingElement = true;
      // iterate until next group element (h2), which is already selected by the querySelectorAll(-).forEach(-)
      while (iterator && iterator.tagName !== "H2") {
        if (iterator.tagName === "OL") {
          const ol = iterator;
          const unloadedSiblings = ol.querySelectorAll(":scope > li.unloaded");
          const totalSiblings = ol.querySelectorAll(":scope > li");

          if (unloadedSiblings.length === totalSiblings.length) {
            ol.previousElementSibling.classList.add("unloaded"); // Add the '.unloaded' class to the previous grouping element (e.g. year)
            ol.classList.add("unloaded"); // Add the '.unloaded' class to the OL itself
          } else {
            hideFirstGroupingElement = false; // there is at least some visible entry, don't hide the first grouping element
          }
        }
        iterator = iterator.nextElementSibling;
      }
      // Add unloaded class to first grouping element (e.g. year) if no item left in this group
      if (hideFirstGroupingElement) {
        element.classList.add("unloaded");
      }
    });
  };

  const updateInputField = () => {
    const hashValue = decodeURIComponent(window.location.hash.substring(1)); // Remove the '#' character
    document.getElementById("bibsearch").value = hashValue;
    filterItems(hashValue);
  };

  // Sensitive search. Only start searching if there's been no input for 300 ms
  let timeoutId;
  document.getElementById("bibsearch").addEventListener("input", function () {
    clearTimeout(timeoutId); // Clear the previous timeout
    const searchTerm = this.value.toLowerCase();
    timeoutId = setTimeout(filterItems(searchTerm), 300);
  });

  window.addEventListener("hashchange", updateInputField); // Update the filter when the hash changes

  // LOCAL OVERRIDE: Journal/Conference type filter buttons (see _pages/publications.md).
  const typeFilterButtons = document.querySelectorAll("[data-pub-filter]");
  typeFilterButtons.forEach((button) => {
    button.addEventListener("click", () => {
      currentTypeFilter = button.dataset.pubFilter;
      typeFilterButtons.forEach((btn) => btn.classList.toggle("active", btn === button));
      filterItems(document.getElementById("bibsearch").value.toLowerCase());
    });
  });

  updateInputField(); // Update filter when page loads
});
