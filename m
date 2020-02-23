From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2020 21:44:16 +0100
Subject: [Buildroot] [git commit branch/next] package/sispmctl: bump to
 version 4.2
Message-ID: <20200223203228.BF9B28E840@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d71bae7af73ead6209ede8b8dc608be304132f6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sispmctl/sispmctl.hash | 2 +-
 package/sispmctl/sispmctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sispmctl/sispmctl.hash b/package/sispmctl/sispmctl.hash
index f1090c4b8a..941eb3dfda 100644
--- a/package/sispmctl/sispmctl.hash
+++ b/package/sispmctl/sispmctl.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  bf5177e085cb0168e18e4cfb69645c3095da149ed46f5659d6e757bde3548e40  sispmctl-4.1.tar.gz
+sha256  300adc32ab35a4f9260705f8f57ccd83c3c6601fc493dbe7d259335938819aaf  sispmctl-4.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sispmctl/sispmctl.mk b/package/sispmctl/sispmctl.mk
index 93e7de7694..ed0c8c2958 100644
--- a/package/sispmctl/sispmctl.mk
+++ b/package/sispmctl/sispmctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SISPMCTL_VERSION = 4.1
+SISPMCTL_VERSION = 4.2
 SISPMCTL_SITE = http://downloads.sourceforge.net/project/sispmctl/sispmctl/sispmctl-$(SISPMCTL_VERSION)
 SISPMCTL_LICENSE = GPL-2.0+
 SISPMCTL_LICENSE_FILES = COPYING
