From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2013 21:51:17 +0200
Subject: [Buildroot] [git commit] webp: bump to version 0.3.1
Message-ID: <20131001195950.EE8309B902@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a932f959dc5be2036995d02742d45d154ebbecb3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webp/webp.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index 9f2acf9..15acd8a 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBP_VERSION = 0.3.0
+WEBP_VERSION = 0.3.1
 WEBP_SOURCE = libwebp-$(WEBP_VERSION).tar.gz
 WEBP_SITE = https://webp.googlecode.com/files
 WEBP_LICENSE = BSD-3c
