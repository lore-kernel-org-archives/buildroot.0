From: arved at arved.at <arved@arved.at>
Date: Tue, 26 Mar 2013 15:41:05 +0100
Subject: [Buildroot] [PATCH 5/5] Update libarchive to 3.0.4
Message-ID: <1364308865-18786-1-git-send-email-arved@arved.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tilman Keskin?z <arved@rise-world.com>


Signed-off-by: Tilman Keskin?z <arved@arved.at>
---
 package/libarchive/libarchive.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index d25f7f8..a571138 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -3,8 +3,8 @@
 # libarchive (reusable C library for archive formats)
 #
 #############################################################
-LIBARCHIVE_VERSION = 2.8.5
-LIBARCHIVE_SITE = http://libarchive.googlecode.com/files/
+LIBARCHIVE_VERSION = 3.0.4
+LIBARCHIVE_SITE = https://github.com/downloads/libarchive/libarchive
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.gz
 LIBARCHIVE_INSTALL_STAGING = YES
 
-- 
1.7.10.4
