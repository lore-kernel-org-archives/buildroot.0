From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 20 Aug 2016 11:53:02 -0300
Subject: [Buildroot] [PATCH] opus: bump to version 1.1.3
Message-ID: <1471704782-22712-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/opus/opus.hash | 2 +-
 package/opus/opus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index 1d48398..2aac69b 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,2 +1,2 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256	0e290078e31211baa7b5886bcc8ab6bc048b9fc83882532da4a1a45e58e907fd	opus-1.1.2.tar.gz
+sha256	58b6fe802e7e30182e95d0cde890c0ace40b6f125cffc50635f0ad2eef69b633	opus-1.1.3.tar.gz
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index 71fdcb3..5cd727f 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.1.2
+OPUS_VERSION = 1.1.3
 OPUS_SITE = http://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3c
 OPUS_LICENSE_FILES = COPYING
-- 
2.7.3
