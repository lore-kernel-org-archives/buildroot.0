From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 29 Oct 2019 22:47:53 +0100
Subject: [Buildroot] [PATCH v1] package/libinput: bump version to 1.14.3
Message-ID: <20191029214753.14774-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2019-October/040967.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libinput/libinput.hash | 10 +++++-----
 package/libinput/libinput.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 97a36978a7..8c6d0396a8 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,8 +1,8 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2019-October/040936.html
-md5 c282990973140e3fa2dd274c69ab3a57 libinput-1.14.2.tar.xz
-sha1 fe3d33ec7d180df43987b23212d4bf1f69690580 libinput-1.14.2.tar.xz
-sha256 6b094669141f26c4df0d62147bbd0f76df1044333e19e6f6dc9413217c51a2c6 libinput-1.14.2.tar.xz
-sha512 932949a78bf95a7a05f50170cfc7dc109c99e1e3e70e63797566c0c3a3003632cad56e9b9ca2a180880f5e2ec1060613066d068b384096f37785fe70ac30c1eb libinput-1.14.2.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-October/040967.html
+md5 d052faa64eb6d2e649e582cc0fcf6e32 libinput-1.14.3.tar.xz
+sha1 af23a4359202c24b592033f54347719a8f44d872 libinput-1.14.3.tar.xz
+sha256 0feb3a0589709cc1032893bfaf4c49150d5360bd9782bec888f9e4dd9044c5b7 libinput-1.14.3.tar.xz
+sha512 f01d1bd1b25b8060519575644597d35f0c89de5386d298441f440128ceee3e57549921a058adec31adc8b33dbdedf4c0bd12c76905a69f752859d3136e26336d libinput-1.14.3.tar.xz

 # License files
 sha256 70d5b1dfe5a9c50a1f2ea91b1c2b1c85d876c5c92339585edbb85cf69e945e14 COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 21afc04122..e6e190bc47 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-LIBINPUT_VERSION = 1.14.2
+LIBINPUT_VERSION = 1.14.3
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
--
2.23.0
