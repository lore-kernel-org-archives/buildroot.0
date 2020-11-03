From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  3 Nov 2020 23:54:10 +0100
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.16.3
Message-ID: <20201103225410.27494-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-November/041644.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 0c8084a8c4..79bfc5d98b 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-October/041640.html
-md5  7c0aca7bba3e8559a869ed15b2173b2e  libinput-1.16.2.tar.xz
-sha1  bff5e91ea0ea45509532aaa3e1a876d476e3e82e  libinput-1.16.2.tar.xz
-sha256  fc3d8c50fe7abc4dc4406bc01262a3f8149864557f87279adcf300e523c160a9  libinput-1.16.2.tar.xz
-sha512  3394faeb0cdb0a543624e150f04a98f3bce8d67438e47455808bde8eec8ea9cdafb86056e5f8d3431352ae33714e490c55edeb51e0af1972c68fca07c1ef1daa  libinput-1.16.2.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-November/041644.html
+md5  562614e91c10c75ab1c2b71e5d27f076  libinput-1.16.3.tar.xz
+sha1  ee1e93ee647bdd4598a5910eb654592563657d66  libinput-1.16.3.tar.xz
+sha256  dc5e1ae51ec1cc635ca96f61118b0f07dfea783cab0747a60f3555068bb077e4  libinput-1.16.3.tar.xz
+sha512  cdf87988b24dc0a44b7b6ed3e15e70c7702bf65f1cfe257924967677c7a1f1485011a9e30254ba8962c83885de78f824e7955cedb07322676332d42532ec4a39  libinput-1.16.3.tar.xz
 
 # License files
 sha256  70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index f8a58a0fcf..e5578a3921 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.16.2
+LIBINPUT_VERSION = 1.16.3
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.29.1
