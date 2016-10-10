From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 10 Oct 2016 07:48:21 +0200
Subject: [Buildroot] [PATCH] mxml: bump to version 2.10
Message-ID: <1476078501-7620-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/mxml/mxml.hash | 4 ++--
 package/mxml/mxml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mxml/mxml.hash b/package/mxml/mxml.hash
index 310e2ca..9039275 100644
--- a/package/mxml/mxml.hash
+++ b/package/mxml/mxml.hash
@@ -1,4 +1,4 @@
 # From http://www.msweet.org/downloads.php?L+Z3
-md5 e21cad0f7aacd18f942aa0568a8dee19 mxml-2.9.tar.gz
+md5 8804c961a24500a95690ef287d150abe mxml-2.10.tar.gz
 # Locally computed
-sha256 cded54653c584b24c4a78a7fa1b3b4377d49ac4f451ddf170ebbc8161d85ff92 mxml-2.9.tar.gz
+sha256 267ff58b64ddc767170d71dab0c729c06f45e1df9a9b6f75180b564f09767891 mxml-2.10.tar.gz
diff --git a/package/mxml/mxml.mk b/package/mxml/mxml.mk
index 7e9b4d6..f36c75c 100644
--- a/package/mxml/mxml.mk
+++ b/package/mxml/mxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MXML_VERSION = 2.9
+MXML_VERSION = 2.10
 MXML_SITE = http://www.msweet.org/files/project3
 MXML_LICENSE = LGPLv2+ with exceptions
 MXML_LICENSE_FILES = COPYING
-- 
2.1.4
