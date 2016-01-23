From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 22 Jan 2016 20:11:01 -0500
Subject: [Buildroot] [PATCH 08/18] erlang-p1-iconv: bump to version 0.9.0
In-Reply-To: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
References: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1453511471-28519-9-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/erlang-p1-iconv/erlang-p1-iconv.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.mk b/package/erlang-p1-iconv/erlang-p1-iconv.mk
index 2189f01..d2d2626 100644
--- a/package/erlang-p1-iconv/erlang-p1-iconv.mk
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ICONV_VERSION = dff5ee5
+ERLANG_P1_ICONV_VERSION = 0.9.0
 ERLANG_P1_ICONV_SITE = $(call github,processone,eiconv,$(ERLANG_P1_ICONV_VERSION))
 ERLANG_P1_ICONV_LICENSE = GPLv2+
 ERLANG_P1_ICONV_LICENSE_FILES = COPYING
-- 
2.5.0
