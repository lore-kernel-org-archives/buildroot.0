From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 21 Nov 2020 13:20:11 +0100
Subject: [Buildroot] [PATCH/next 2/5] package/libsoundtouch: bump version to
 2.2
In-Reply-To: <20201121122014.1508936-1-bernd.kuhls@t-online.de>
References: <20201121122014.1508936-1-bernd.kuhls@t-online.de>
Message-ID: <20201121122014.1508936-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes: https://gitlab.com/soundtouch/soundtouch/-/releases

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libsoundtouch/libsoundtouch.hash | 2 +-
 package/libsoundtouch/libsoundtouch.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsoundtouch/libsoundtouch.hash b/package/libsoundtouch/libsoundtouch.hash
index aa33bb8a7e..fe6a108e33 100644
--- a/package/libsoundtouch/libsoundtouch.hash
+++ b/package/libsoundtouch/libsoundtouch.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3a431facf019f37cc2da112156226d686e941b15d6327f3a41d7ca21dfaf8e94  libsoundtouch-2.1.2.tar.gz
+sha256  f1ce96bac35779d3b752f4cc8696975b3d58f3deb9db47ffc45862767c2a2bdd  libsoundtouch-2.2.tar.gz
 sha256  6b73f6327136a924821ec044bbd9f17cf8677faf2f2a2b1366a9fff6188c9688  COPYING.TXT
diff --git a/package/libsoundtouch/libsoundtouch.mk b/package/libsoundtouch/libsoundtouch.mk
index 9b040e391c..98b5cc75b3 100644
--- a/package/libsoundtouch/libsoundtouch.mk
+++ b/package/libsoundtouch/libsoundtouch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSOUNDTOUCH_VERSION = 2.1.2
+LIBSOUNDTOUCH_VERSION = 2.2
 LIBSOUNDTOUCH_SITE = https://gitlab.com/soundtouch/soundtouch/-/archive/$(LIBSOUNDTOUCH_VERSION)
 LIBSOUNDTOUCH_LICENSE = LGPL-2.1+
 LIBSOUNDTOUCH_LICENSE_FILES = COPYING.TXT
-- 
2.27.0
