From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Sep 2018 10:34:30 +0200
Subject: [Buildroot] [git commit] leptonica: bump to version 1.76.0
Message-ID: <20180930084530.C233780FF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fa0c70a1ca5c6f66af455f08ce626dc1a0cb5c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also added license hash

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/leptonica/leptonica.hash | 3 ++-
 package/leptonica/leptonica.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index f67f2b88fd..54fe8785dc 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,2 +1,3 @@
 # locally computed hash
-sha256 29c35426a416bf454413c6fec24c24a0b633e26144a17e98351b6dffaa4a833b  leptonica-1.74.4.tar.gz
+sha256 5e9a33b7ce33ab39fb03cee5a7ec353b044670176303265d7c64d51539616857  leptonica-1.76.0.tar.gz
+sha256 ca0ac11c7c0acad9599d54990942cc11c9f6d9b569f1a360d774a628819c3518  leptonica-license.txt
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 6a958a3564..5e37f939b9 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEPTONICA_VERSION = 1.74.4
+LEPTONICA_VERSION = 1.76.0
 LEPTONICA_SITE = http://www.leptonica.org/source
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
