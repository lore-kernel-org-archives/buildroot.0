From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 31 Aug 2019 13:36:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/libinput: bump version to 1.14.1
Message-ID: <20190831113630.7436-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes of this bugfix release:
https://lists.freedesktop.org/archives/wayland-devel/2019-August/040814.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index a54e72f438..faa27b2b92 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-August/040790.html
-md5 1c33d49fc7985926eab877e3de9c17eb libinput-1.14.0.tar.xz
-sha1 3a8f1ea7ba8a23868b2a7d48286924547ba6d108 libinput-1.14.0.tar.xz
-sha256 7cb85c24f8920b81bc5360220107e267ab4e0e718704c7690a8c7b03fa14fc67 libinput-1.14.0.tar.xz
-sha512 e501c5b8a58bb287c175692af0e59ff766a8613eb576aaa0700686dfbb6c6ab63b7a5d3f148fce75397c8170bc49871068861d93c352355ab5d0d9e7f1b059ec libinput-1.14.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-August/040814.html
+md5 da29a704dc6f7ea2d5aac754db046340  libinput-1.14.1.tar.xz
+sha1 116438b914342a0b45dcea1804aab751c9d335df  libinput-1.14.1.tar.xz
+sha256 e333a3242835c019ca37d2cef8b51a87d3138eb47444119c0153dc7a8656ee70  libinput-1.14.1.tar.xz
+sha512 8416bab51ba1aab924fa1b41360bc2ad101fb60d3a82c73584bb1e2454554524716673e3eac7f08c18bd6a1ecdfa52ea3cfe09c7a866c59fcd47d75960e82d4c  libinput-1.14.1.tar.xz
 
 # License files
 sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index d75b042f14..3b9b54a4dd 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.14.0
+LIBINPUT_VERSION = 1.14.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.20.1
