From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 6 Sep 2015 11:33:53 +0200
Subject: [Buildroot] [git commit] uclibc: fix coreutils cut bug,
	enable needed config symbols in uclibc-ng config
Message-ID: <20150906093845.6FCF2800FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e07cc92491080289188b3618d687b06bb9aa6041
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://bugs.buildroot.org/show_bug.cgi?id=4099

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uClibc-ng.config |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index 6523585..c17603d 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -24,8 +24,8 @@ UCLIBC_HAS_LIBNSL_STUB=y
 UCLIBC_HAS_CTYPE_CHECKED=y
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
 UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
-# UCLIBC_HAS_STDIO_GETC_MACRO is not set
-# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
+UCLIBC_HAS_STDIO_GETC_MACRO=y
+UCLIBC_HAS_STDIO_PUTC_MACRO=y
 UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
 UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
 UCLIBC_HAS_PRINTF_M_SPEC=y
