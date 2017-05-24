From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 24 May 2017 17:36:32 +0200
Subject: [Buildroot] [PATCH/next] package/libdrm: bump version to 2.4.81
Message-ID: <20170524153632.21763-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libdrm/libdrm.hash | 10 +++++-----
 package/libdrm/libdrm.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index f322ba147..247e63181 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2017-April/139263.html
-md5 4867866477f228973a64e68051ca9c66  libdrm-2.4.80.tar.bz2
-sha1 eabfc3e04d0737834ccb49fe34fc369f0e0588f9  libdrm-2.4.80.tar.bz2
-sha256 a82a519601e9cdfad795e760807eb07ac8913b225e25fc8fe9bc03e3be6549f1 libdrm-2.4.80.tar.bz2
-sha512 478f64bcc6f4815368ae86d023f11ba6b37595bb9d8baa588b466c6c0e2aae48a50a489137750ed21fbabef5afabf183c78c152eb770bfe316fa7401b191a30b libdrm-2.4.80.tar.bz2
+# From https://lists.freedesktop.org/archives/dri-devel/2017-May/142708.html
+md5 d04f3567f0a812188d06f860fded5ab7  libdrm-2.4.81.tar.bz2
+sha1 40f0994b5fb9992e6f55d3a14537def21719d896  libdrm-2.4.81.tar.bz2
+sha256 8cc05c195ac8708199979a94c4e4d1a928c14ec338ecbcb38ead09f54dae11ae  libdrm-2.4.81.tar.bz2
+sha512 5f7a1524acad59890d3f890bed90a660a424e18a88d587ca356223bde4a7446d1c540f97ec11cb10d2e7ed1b4ae86127957634354a1be6d04199295ab24782e5  libdrm-2.4.81.tar.bz2
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 01b1aed76..54187f3cb 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.80
+LIBDRM_VERSION = 2.4.81
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.bz2
 LIBDRM_SITE = http://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.11.0
