From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 13:23:33 +0200
Subject: [Buildroot] [git commit] package/snort: bump to version 2.9.16.1
Message-ID: <20201013112035.BB7C58F825@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8b0f4a3ae1765b2816eae563ede17879581dc45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Added md5 hash provided by upstream.
- Update indentation in hash file (two spaces)
- Fix build failure with gcc 10

Fixes:
 - http://autobuild.buildroot.org/results/16e1fa98a80182d96e62365491d5a71ed269aa47

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snort/snort.hash | 9 ++++++---
 package/snort/snort.mk   | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index 7364df1330..733cf605ad 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,6 +1,9 @@
+# From https://www.snort.org/downloads/snort/md5s
+md5  ec148a494cde9095fb590a51efa306de  snort-2.9.16.1.tar.gz
+
 # Locally computed:
-sha256 2cccfc1d1a706586cd47ae9f085a7d5e4e36390b8e9c28cd2020b4b5b587f6c3  snort-2.9.15.1.tar.gz
+sha256  e3ac45a1a3cc2c997d52d19cd92f1adf5641c3a919387adab47a4d13a9dc9f8e  snort-2.9.16.1.tar.gz
 
 # Hash for license files:
-sha256 f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
-sha256 3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
+sha256  f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
+sha256  3f1cbfb20bb2c608e1a474421880d08b8cba6abb00ab7736d22c481d71656a6d  COPYING
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 0f1d6b13de..794bd1f670 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.15.1
+SNORT_VERSION = 2.9.16.1
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
