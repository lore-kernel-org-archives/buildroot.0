From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Oct 2020 15:52:27 +0100
Subject: [Buildroot] [git commit] package/sispmctl: bump to version 4.8
Message-ID: <20201025144240.4274982D9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de126703d1401458db78241a910b5d4c40309b05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sourceforge.net/p/sispmctl/git/ci/release-4.8/tree/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sispmctl/sispmctl.hash | 2 +-
 package/sispmctl/sispmctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sispmctl/sispmctl.hash b/package/sispmctl/sispmctl.hash
index 941eb3dfda..95129cec03 100644
--- a/package/sispmctl/sispmctl.hash
+++ b/package/sispmctl/sispmctl.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  300adc32ab35a4f9260705f8f57ccd83c3c6601fc493dbe7d259335938819aaf  sispmctl-4.2.tar.gz
+sha256  0f8391f7e95cbf1fb96a68686a1dcf1e16747b050ae1b8ff90653c99976068db  sispmctl-4.8.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sispmctl/sispmctl.mk b/package/sispmctl/sispmctl.mk
index ed0c8c2958..3e4252a8d8 100644
--- a/package/sispmctl/sispmctl.mk
+++ b/package/sispmctl/sispmctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SISPMCTL_VERSION = 4.2
+SISPMCTL_VERSION = 4.8
 SISPMCTL_SITE = http://downloads.sourceforge.net/project/sispmctl/sispmctl/sispmctl-$(SISPMCTL_VERSION)
 SISPMCTL_LICENSE = GPL-2.0+
 SISPMCTL_LICENSE_FILES = COPYING
