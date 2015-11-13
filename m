From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 14 Nov 2015 00:26:42 +0100
Subject: [Buildroot] [PATCH/next 12/13] package/uclibc-ng: Enable O_CLOEXEC
	in fopen()
In-Reply-To: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
References: <1447457203-27816-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1447457203-27816-12-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed for package/x11r7/xdriver_xf86-video-ati version bump.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/uclibc/uClibc-ng.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index c17603d..cf67182 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -26,6 +26,7 @@ UCLIBC_HAS_HEXADECIMAL_FLOATS=y
 UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
 UCLIBC_HAS_STDIO_GETC_MACRO=y
 UCLIBC_HAS_STDIO_PUTC_MACRO=y
+UCLIBC_HAS_FOPEN_CLOSEEXEC_MODE=y
 UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
 UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
 UCLIBC_HAS_PRINTF_M_SPEC=y
-- 
2.6.2
