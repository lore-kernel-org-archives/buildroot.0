From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 03 Sep 2019 13:40:42 -0000
Subject: [Buildroot] [git commit] package/linuxconsoletools: bump version to
 1.6.1
Message-ID: <20190903133619.B61C18A52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0fb35230b7819c3c19fbe4233354df945ad10b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:

Version 1.6.1
-------------

* inputattach supports the RainShadow HDMI CEC dongle (this requires
  kernel 4.12 or later; thanks to Hans Verkuil).

* The jscal store and restore tools use udevadm on the path, instead
  of hard-coding /sbin.

Signed-off-by: Koen Martens <gmc@sonologic.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linuxconsoletools/linuxconsoletools.hash | 2 +-
 package/linuxconsoletools/linuxconsoletools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linuxconsoletools/linuxconsoletools.hash b/package/linuxconsoletools/linuxconsoletools.hash
index 756c9f434e..3eead201df 100644
--- a/package/linuxconsoletools/linuxconsoletools.hash
+++ b/package/linuxconsoletools/linuxconsoletools.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	ced2efed00b67b45f82eddc69be07385835d558f658016315ac621fe2eaa8146	linuxconsoletools-1.6.0.tar.bz2
+sha256	e9d6b05a6c57c7eb3ec7f9f017f46b20e4b55d5a02f930eff1823a13921c5934	linuxconsoletools-1.6.1.tar.bz2
diff --git a/package/linuxconsoletools/linuxconsoletools.mk b/package/linuxconsoletools/linuxconsoletools.mk
index 82ff4c3133..b22e136d33 100644
--- a/package/linuxconsoletools/linuxconsoletools.mk
+++ b/package/linuxconsoletools/linuxconsoletools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUXCONSOLETOOLS_VERSION = 1.6.0
+LINUXCONSOLETOOLS_VERSION = 1.6.1
 LINUXCONSOLETOOLS_SOURCE = linuxconsoletools-$(LINUXCONSOLETOOLS_VERSION).tar.bz2
 LINUXCONSOLETOOLS_SITE = https://downloads.sourceforge.net/project/linuxconsole
 LINUXCONSOLETOOLS_LICENSE = GPL-2.0+
