From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue,  2 Feb 2016 14:57:42 -0500
Subject: [Buildroot] [PATCH v2 16/18] erlang-p1-zlib: bump to version 1.0.0
In-Reply-To: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1454443064-14269-17-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang-p1-zlib/erlang-p1-zlib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
index 4ba3332..1f8ae00 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.mk
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ZLIB_VERSION = 52e82bb
+ERLANG_P1_ZLIB_VERSION = 1.0.0
 ERLANG_P1_ZLIB_SITE = $(call github,processone,zlib,$(ERLANG_P1_ZLIB_VERSION))
 ERLANG_P1_ZLIB_LICENSE = GPLv2+
 ERLANG_P1_ZLIB_LICENSE_FILES = COPYING
-- 
2.5.0
