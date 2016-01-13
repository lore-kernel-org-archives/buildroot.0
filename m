From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2016 09:33:38 +0100
Subject: [Buildroot] [git commit] opus: bump to version 1.1.2
Message-ID: <20160113083422.2ABBA826D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=87d813f69a044982e29cbd948b39d17170fc0de8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opus/opus.hash | 2 +-
 package/opus/opus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index b3aea0d..1d48398 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,2 +1,2 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256	9b84ff56bd7720d5554103c557664efac2b8b18acc4bbcc234cb881ab9a3371e	opus-1.1.1.tar.gz
+sha256	0e290078e31211baa7b5886bcc8ab6bc048b9fc83882532da4a1a45e58e907fd	opus-1.1.2.tar.gz
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index c4fef3a..eb082e3 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.1.1
+OPUS_VERSION = 1.1.2
 OPUS_SITE = http://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3c
 OPUS_LICENSE_FILES = COPYING
