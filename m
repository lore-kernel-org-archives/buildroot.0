From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 8 Aug 2019 16:12:29 +0200
Subject: [Buildroot] [git commit] package/yad: bump to version 0.40.0
Message-ID: <20190808140958.1714D801B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39343e199d0a494656e873520f6312ad0212737a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/yad/yad.hash | 7 +++++--
 package/yad/yad.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/yad/yad.hash b/package/yad/yad.hash
index 18392829e8..1eee499c73 100644
--- a/package/yad/yad.hash
+++ b/package/yad/yad.hash
@@ -1,3 +1,6 @@
 # From http://sourceforge.net/projects/yad-dialog/files/
-md5	4e24888712be1e95fd3cea815f19c6cb	yad-0.33.1.tar.xz
-sha1	b39977128678ca67bf4649929510f729c9cf1e67	yad-0.33.1.tar.xz
+md5	82d458a2e1695dd0709f71ad26109812	yad-0.40.0.tar.xz
+sha1	4376eb42f8e38972124dc81e534cbdc9088109fb	yad-0.40.0.tar.xz
+
+# Hash for license file
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/yad/yad.mk b/package/yad/yad.mk
index 01bf334a75..15788efac0 100644
--- a/package/yad/yad.mk
+++ b/package/yad/yad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-YAD_VERSION = 0.33.1
+YAD_VERSION = 0.40.0
 YAD_SOURCE = yad-$(YAD_VERSION).tar.xz
 YAD_SITE = http://sourceforge.net/projects/yad-dialog/files
 YAD_LICENSE = GPL-3.0
