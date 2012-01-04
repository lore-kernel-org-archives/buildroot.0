From: Alexandre Belloni <abelloni@adeneo-embedded.com>
Date: Wed,  4 Jan 2012 18:13:33 +0100
Subject: [Buildroot] [PATCH v3 0/2] Add defconfigs for LPC3250 boards
Message-ID: <1325697215-29906-1-git-send-email-abelloni@adeneo-embedded.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

V3 using feedback from Thomas.

Alexandre Belloni (2):
  lpc32xx: Add CDL to the available bootloaders
  Add defconfigs for LPC3250 boards

 boot/Config.in                                     |    1 +
 boot/lpc32xxcdl/Config.in                          |   10 +
 .../lpc32xxcdl/lpc32xxcdl-2.11-compiler_name.patch |   52 ++
 .../lpc32xxcdl-2.11-delete_redundant_files.patch   |  964 ++++++++++++++++++++
 boot/lpc32xxcdl/lpc32xxcdl-2.11-libnosys_gnu.patch |  183 ++++
 boot/lpc32xxcdl/lpc32xxcdl-2.11-slashes.patch      |  521 +++++++++++
 boot/lpc32xxcdl/lpc32xxcdl.mk                      |   60 ++
 configs/ea3250_defconfig                           |   39 +
 configs/fdi3250_defconfig                          |   39 +
 configs/phy3250_defconfig                          |   39 +
 10 files changed, 1908 insertions(+), 0 deletions(-)
 create mode 100644 boot/lpc32xxcdl/Config.in
 create mode 100644 boot/lpc32xxcdl/lpc32xxcdl-2.11-compiler_name.patch
 create mode 100644 boot/lpc32xxcdl/lpc32xxcdl-2.11-delete_redundant_files.patch
 create mode 100644 boot/lpc32xxcdl/lpc32xxcdl-2.11-libnosys_gnu.patch
 create mode 100644 boot/lpc32xxcdl/lpc32xxcdl-2.11-slashes.patch
 create mode 100644 boot/lpc32xxcdl/lpc32xxcdl.mk
 create mode 100644 configs/ea3250_defconfig
 create mode 100644 configs/fdi3250_defconfig
 create mode 100644 configs/phy3250_defconfig

-- 
1.7.8.2
