From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:24 +0100
Subject: [Buildroot] [RFC v3 19/30] erlang-p1-iconv: bump to a version that
	use TARGET_CFLAGS
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-20-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is in order to support the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-iconv/erlang-p1-iconv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.mk b/package/erlang-p1-iconv/erlang-p1-iconv.mk
index 2189f01..6d1d992 100644
--- a/package/erlang-p1-iconv/erlang-p1-iconv.mk
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ICONV_VERSION = dff5ee5
+ERLANG_P1_ICONV_VERSION = a16ac9b918626665e066534878eab7a878eea275
 ERLANG_P1_ICONV_SITE = $(call github,processone,eiconv,$(ERLANG_P1_ICONV_VERSION))
 ERLANG_P1_ICONV_LICENSE = GPLv2+
 ERLANG_P1_ICONV_LICENSE_FILES = COPYING
-- 
2.3.1
