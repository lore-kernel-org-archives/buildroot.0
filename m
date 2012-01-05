From: Alexandre Belloni <abelloni@adeneo-embedded.com>
Date: Thu,  5 Jan 2012 12:03:47 +0100
Subject: [Buildroot] [PATCH v4 0/3] Add defconfigs for LPC3250 boards
Message-ID: <1325761430-3942-1-git-send-email-abelloni@adeneo-embedded.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v4 now reordering boot/Config.in entries and useful comments

Alexandre Belloni (3):
  Reorder entries alphabetically
  lpc32xx: Add CDL to the available bootloaders
  Add defconfigs for LPC3250 boards

 boot/Config.in                                     |    5 +-
 boot/lpc32xxcdl/Config.in                          |   10 +
 .../lpc32xxcdl/lpc32xxcdl-2.11-compiler_name.patch |   52 ++
 .../lpc32xxcdl-2.11-delete_redundant_files.patch   |  969 ++++++++++++++++++++
 boot/lpc32xxcdl/lpc32xxcdl-2.11-libnosys_gnu.patch |  188 ++++
 boot/lpc32xxcdl/lpc32xxcdl-2.11-slashes.patch      |  521 +++++++++++
 boot/lpc32xxcdl/lpc32xxcdl.mk                      |   60 ++
 configs/ea3250_defconfig                           |   39 +
 configs/fdi3250_defconfig                          |   39 +
 configs/phy3250_defconfig                          |   39 +
 10 files changed, 1920 insertions(+), 2 deletions(-)
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
