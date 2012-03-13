From: Eric Jarrige <eric.jarrige@armadeus.org>
Date: Tue, 13 Mar 2012 13:52:09 +0100
Subject: [Buildroot] [PATCH 0/2] add u-boot.sb file format and elftosb tools
Message-ID: <1331643131-31435-1-git-send-email-eric.jarrige@armadeus.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These patches add support for the Freescale "Safe Boot" file format:
- add elftosb host tools to package the .sb binary files 
- add u-boot.sb binary format in BR menuconfig

Eric Jarrige (2):
  Add (Freescale) elftosb host package
  u-boot: add support for u-boot.sb file format

 boot/uboot/Config.in                               |    3 ++
 boot/uboot/uboot.mk                                |    4 +++
 package/elftosb/elftosb.mk                         |   28 ++++++++++++++++++++
 .../elftosb/elftosb10.12.01-fixes_includes.patch   |   19 +++++++++++++
 4 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 package/elftosb/elftosb.mk
 create mode 100644 package/elftosb/elftosb10.12.01-fixes_includes.patch

-- 
1.7.2.5
