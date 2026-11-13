---
layout: page
title: MIMORPH
description: General-purpose experimentation platform for sub-6 GHz and mmWave MIMO
img: assets/img/platforms/mimorph.png
importance: 2
category: platform
github: https://github.com/IMDEANetworksWNG/MIMORPH
related_publications: true
---

MIMORPH is a highly configurable wireless experimentation platform that runs on a single FPGA board. It can be reconfigured from a 4x4 mm-wave MIMO system (2 GHz channels) to an 8x8 sub-6 GHz MIMO system (160 MHz channels), including mixed mm-wave/sub-6 GHz operation, with real-time closed-loop MIMO beam training implemented via hardware/software accelerators. The repository includes five FPGA designs, an IP-block library, and IEEE 802.11ad/ay decoders. Dual-licensed under GPLv3, with a proprietary license available on request.

<div class="caption">
A MIMORPH multiband node (Fig. 3 of the ACM GetMobile piece below).
</div>

Introduced at ACM MobiSys 2021 and later summarized in ACM GetMobile: {% cite lacruz2021real %} {% cite lacruz2022mimorph %}.
