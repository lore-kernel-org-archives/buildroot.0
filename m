From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 21 Feb 2020 09:08:55 +0100
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.15.2
Message-ID: <20200221080855.3159-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-February/041227.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 235025768b..18cc257b72 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2020-February/041186.html
-md5 93850756b6c07aafb49d5226e88fdc81 libinput-1.15.1.tar.xz
-sha1 1b311c407c21210ad9d13b059e9eab4b85f19fb5 libinput-1.15.1.tar.xz
-sha256 6b2f57495c6f173ecf49ee19d3e10087d9916a52711e1b5eb01e0d9635950c16 libinput-1.15.1.tar.xz
-sha512 634810359bc4d86f2c4c75f472bee5eaed04ed93af3c91c4bc46a596402323941f9cc90173e278bfa7e5cbda6b7a20adc59bd09520dd4152fc961302b7e57904 libinput-1.15.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2020-February/041227.html
+md5 eb6bd2907ad33d53954d70dfb881a643 libinput-1.15.2.tar.xz
+sha1 2a0c4ce80ee43a9a1b274bfe40ca638037716584 libinput-1.15.2.tar.xz
+sha256 971c3fbfb624f95c911adeb2803c372e4e3647d1b98f278f660051f834597747 libinput-1.15.2.tar.xz
+sha512 f6b50dbdf6ee6b65f88e020c4292c94c3178125d58629f27c2e52f92b658ccd67e0c5604fbf0b303621ff0386637ce1e291daaa991761d4145e8bcda4dd128a2 libinput-1.15.2.tar.xz
 
 # License files
 sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index ac7fbb3b2e..1d5446e444 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.15.1
+LIBINPUT_VERSION = 1.15.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
-- 
2.25.0
