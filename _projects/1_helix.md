---
layout: page
title: HELIX
description: High-speed real-time experimentation platform for 6G wireless networks
img: assets/img/platforms/helix.png
importance: 1
category: platform
github: https://github.com/IMDEANetworksWNG/HELIX
related_publications: true
---

HELIX combines an FPGA-based PHY subsystem with a C++ software control library to support real-time, 6G-oriented wireless experimentation. It allows on-the-fly reconfiguration of functional splits and numerologies, and gives access to ISAC side information, targeting the Xilinx ZCU208 RFSoC with sub-6 GHz / mm-wave front ends. The repository contains the C++ library, the Vivado FPGA project, an ARM baremetal application, example scripts, and MATLAB validation code.

Presented at ACM MobiSys 2025: {% cite ruiz2025helix %}.
