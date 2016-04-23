From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Apr 2016 11:40:00 +0200
Subject: [Buildroot] [git commit] uclibc/defconfig: enable XSI math
Message-ID: <20160423094021.1A68A8191F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de56d58e5d26d78161ca3b7a1a2a4decfe4e89db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ARM926 size delta +12 KB.
It's required for the upcoming mpv package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uClibc-ng.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uClibc-ng.config b/package/uclibc/uClibc-ng.config
index 66de5a9..2671e06 100644
--- a/package/uclibc/uClibc-ng.config
+++ b/package/uclibc/uClibc-ng.config
@@ -1,4 +1,5 @@
 DO_C99_MATH=y
+DO_XSI_MATH=y
 KERNEL_HEADERS="/usr/src/linux/include"
 # LDSO_CACHE_SUPPORT is not set
 # UCLIBC_STATIC_LDCONFIG is not set
