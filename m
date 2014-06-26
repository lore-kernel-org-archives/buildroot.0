From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:58 -0300
Subject: [Buildroot] [PATCH 30/53] libiconv: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-30-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libiconv/libiconv.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index d2209bc..98f7e68 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -7,6 +7,8 @@
 LIBICONV_VERSION = 1.14
 LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
 LIBICONV_INSTALL_STAGING = YES
+LIBICONV_LICENSE = GPLv3+ (iconv program), LGPLv2+ (library)
+LIBICONV_LICENSE_FILES = COPYING COPYING.LIB
 
 # Preloadable libiconv is for dynamic targets only
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
-- 
1.8.5.5
