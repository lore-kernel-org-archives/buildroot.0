From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:25 +0100
Subject: [Buildroot] [RFC v3 20/30] erlang-p1-zlib: bump to a version that
	use TARGET_CFLAGS
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-21-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is in order to support the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-zlib/erlang-p1-zlib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
index 4ba3332..7744f5a 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.mk
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ZLIB_VERSION = 52e82bb
+ERLANG_P1_ZLIB_VERSION = 513c7e52a01616e7af74c67ac246dc09a3c071e4
 ERLANG_P1_ZLIB_SITE = $(call github,processone,zlib,$(ERLANG_P1_ZLIB_VERSION))
 ERLANG_P1_ZLIB_LICENSE = GPLv2+
 ERLANG_P1_ZLIB_LICENSE_FILES = COPYING
-- 
2.3.1
