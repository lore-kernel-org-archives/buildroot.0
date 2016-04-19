From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 Apr 2016 11:44:01 -0300
Subject: [Buildroot] [PATCH v2 0/7] linux-firmware bumps and additions
Message-ID: <1461077048-16189-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series drops revision handling from the iwlwifi firmware files,
enables wildcard firmware files to cover for lots-of-versions scenarios,
and adds new intel iwlwifi chipset support.

Changes for v2:
* Enable wildcard firmware file specification
* Switch to wildcard instead of preset firmware versions for iwlwifi
* Add more intel iwlwifi chipsets

Gustavo Zacarias (7):
  linux-firmware: drop revision handling for iwlwifi
  linux-firmware: add support for intel iwlwifi 7265D
  linux-firmware: bump version
  linux-firmware: add support for intel iwlwifi 8000C
  linux-firmware: add support for intel iwlwifi 8265
  linux-firmware: add support for intel iwlwifi 3168
  linux-firmware: add support for intel iwlwifi 6000g2b

 package/linux-firmware/Config.in         | 60 +++++++++++++-------------------
 package/linux-firmware/linux-firmware.mk | 36 ++++++++++++++++---
 2 files changed, 56 insertions(+), 40 deletions(-)

-- 
2.7.3
