From: Chih-Min Chao <cmchao@gmail.com>
Date: Mon, 13 Sep 2010 23:12:12 +0800
Subject: [Buildroot] [PATCH 2/5] tiff : bump to 3.9.4
In-Reply-To: <1284390735-2261-1-git-send-email-cmchao@gmail.com>
References: <1284390735-2261-1-git-send-email-cmchao@gmail.com>
Message-ID: <1284390735-2261-3-git-send-email-cmchao@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
---
 package/tiff/tiff.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 8db215e..62bf5cb 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -3,7 +3,7 @@
 # tiff
 #
 #############################################################
-TIFF_VERSION:=3.8.2
+TIFF_VERSION:=3.9.4
 TIFF_SITE:=ftp://ftp.remotesensing.org/pub/libtiff
 TIFF_SOURCE:=tiff-$(TIFF_VERSION).tar.gz
 TIFF_LIBTOOL_PATCH = NO
-- 
1.7.0.4
