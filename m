From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Apr 2021 20:15:37 +0200
Subject: [Buildroot] [git commit] package/snort: bump version to 2.9.17.1
Message-ID: <20210411180008.AC3668167A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8453641c8cc934dad189fcd08cd8f4974da89b5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a bug fix release:

https://www.snort.org/downloads/snort/release_notes_2.9.17.1.txt

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/snort/snort.hash | 4 ++--
 package/snort/snort.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index 1103152ead..115a8398dd 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,8 +1,8 @@
 # From https://www.snort.org/downloads/snort/md5s
-md5  3fe89f22def4e9ffda01f07f816e666d  snort-2.9.17.tar.gz
+md5  006d6b0d71c6c7bd23eac74670f5b4e6  snort-2.9.17.1.tar.gz
 
 # Locally computed:
-sha256  c3b234c3922a09b0368b847ddb8d1fa371b741f032f42aa9ab53d67b428dc648  snort-2.9.17.tar.gz
+sha256  303d3d5dc5affecfeaad3a331d3163f901d48d960fdd6598cb55c6d1591eed82  snort-2.9.17.1.tar.gz
 
 # Hash for license files:
 sha256  f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 412c69f838..3df2941179 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.17
+SNORT_VERSION = 2.9.17.1
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
