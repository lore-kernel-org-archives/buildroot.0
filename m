From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 29 Nov 2010 21:15:53 +0100
Subject: [Buildroot] [git commit master 1/1] uclibc: snapshot config fix,
	yet another stalling point
Message-ID: <20101129201621.127008D43D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cdd861ea4650ef787d111c5bdac84d23a6460348
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uClibc-snapshot.config |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/toolchain/uClibc/uClibc-snapshot.config b/toolchain/uClibc/uClibc-snapshot.config
index bc3074e..e5d2bea 100644
--- a/toolchain/uClibc/uClibc-snapshot.config
+++ b/toolchain/uClibc/uClibc-snapshot.config
@@ -183,6 +183,7 @@ UCLIBC_HAS_XLOCALE=y
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
 # UCLIBC_HAS_GLIBC_DIGIT_GROUPING is not set
 UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
+# USE_OLD_VFPRINTF is not set
 UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
 UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
 # UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
-- 
1.7.2.2
