From: David Barbion <davidb@230ruedubac.fr>
Date: Sun, 22 Nov 2020 22:43:01 +0100
Subject: [Buildroot] [PATCH 0/3] Support for Raspberry PI-400
Message-ID: <20201122214304.266821-1-davidb@230ruedubac.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset contains 3 bumps for rpi-firmware packages.
It brings support for the new Raspberry PI-400.

David Barbion (3):
  package/rpi-bt-firmware: bump version to 9c0ffe9a7f
  package/rpi-firmware: bump version to bff705f
  package/rpi-wifi-firmware: bump version to 9c0ffe9a

 package/rpi-bt-firmware/rpi-bt-firmware.hash     | 2 +-
 package/rpi-bt-firmware/rpi-bt-firmware.mk       | 2 +-
 package/rpi-firmware/rpi-firmware.hash           | 2 +-
 package/rpi-firmware/rpi-firmware.mk             | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.hash | 2 +-
 package/rpi-wifi-firmware/rpi-wifi-firmware.mk   | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.27.0
