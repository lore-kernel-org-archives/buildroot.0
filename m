From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Nov 2015 00:26:41 +0100
Subject: [Buildroot] [PATCH/next 11/13] package/uclibc: Enable O_CLOEXEC in
	fopen()
In-Reply-To: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
References: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1447457203-27816-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for package/x11r7/xdriver_xf86-video-ati version bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/uclibc/uClibc-0.9.33.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/uClibc-0.9.33.config b/package/uclibc/uClibc-0.9.33.config
index 104eb5c..c3263d1 100644
--- a/package/uclibc/uClibc-0.9.33.config
+++ b/package/uclibc/uClibc-0.9.33.config
@@ -209,7 +209,7 @@ UCLIBC_HAS_STDIO_PUTC_MACRO=y
 UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
 # UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
 UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
-# UCLIBC_HAS_FOPEN_CLOSEEXEC_MODE is not set
+UCLIBC_HAS_FOPEN_CLOSEEXEC_MODE=y
 UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
 UCLIBC_HAS_PRINTF_M_SPEC=y
 UCLIBC_HAS_ERRNO_MESSAGES=y
-- 
2.6.2
