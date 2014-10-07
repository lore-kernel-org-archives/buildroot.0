From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Oct 2014 12:31:31 +0200
Subject: [Buildroot] [git commit] libassuan: bump to version 2.1.2
Message-ID: <20141007103613.24F02B0E22@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4146d44599f7e599bf5415b74e984772da738b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libassuan/libassuan.hash |    2 ++
 package/libassuan/libassuan.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libassuan/libassuan.hash b/package/libassuan/libassuan.hash
new file mode 100644
index 0000000..d875389
--- /dev/null
+++ b/package/libassuan/libassuan.hash
@@ -0,0 +1,2 @@
+# Locally calculated after checking pgp signature
+sha256	39f8a7c9349aaaf7ccd937b90660153ec4d2d4df2465018754e5bcae5b1db77b	libassuan-2.1.2.tar.bz2
diff --git a/package/libassuan/libassuan.mk b/package/libassuan/libassuan.mk
index 178e6b1..1c2a4f2 100644
--- a/package/libassuan/libassuan.mk
+++ b/package/libassuan/libassuan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASSUAN_VERSION = 2.1.1
+LIBASSUAN_VERSION = 2.1.2
 LIBASSUAN_SITE = ftp://ftp.gnupg.org/gcrypt/libassuan
 LIBASSUAN_SOURCE = libassuan-$(LIBASSUAN_VERSION).tar.bz2
 LIBASSUAN_LICENSE = LGPLv2.1+ (library), GPLv3 (tests, doc)
