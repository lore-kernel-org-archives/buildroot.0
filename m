From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 08:06:42 +0200
Subject: [Buildroot] [git commit] mxml: bump to version 2.10
Message-ID: <20161013060802.784FF822B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0dcdf20683a3c8adf7774e7ad6409c00179578cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
