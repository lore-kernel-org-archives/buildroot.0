From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 23:39:54 +0200
Subject: [Buildroot] [git commit] package/x11r7/libxcb: bump version to
 1.13.1
Message-ID: <20190828213619.5E466881B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53e1150671d80eb6ec32117ba6edfd5e7bff5c2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream does not provide a sha512 hash anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/libxcb/libxcb.hash | 9 ++++-----
 package/x11r7/libxcb/libxcb.mk   | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/libxcb/libxcb.hash b/package/x11r7/libxcb/libxcb.hash
index d2b5da6b52..9158b6bb24 100644
--- a/package/x11r7/libxcb/libxcb.hash
+++ b/package/x11r7/libxcb/libxcb.hash
@@ -1,7 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2018-March/002851.html
-md5 c2b6cf928afa16b0047c974e7aaa783f  libxcb-1.13.tar.bz2
-sha1 212ad5f1f80def80536d78e3d20354a0370e7fe9  libxcb-1.13.tar.bz2
-sha256 188c8752193c50ff2dbe89db4554c63df2e26a2e47b0fa415a70918b5b851daa  libxcb-1.13.tar.bz2
-sha512 d99bbe386a65f60fcc0cc2935e4a365bc0577b5e90433e18778a665a5aee8ebc8e9e8cb0aedac0ac4a276147c0507e759a716874ea4f80792b2fc18eefbc128c  libxcb-1.13.tar.bz2
+# From https://lists.x.org/archives/xorg/2018-September/059469.html
+md5 f33cdfc67346f7217a9326c0d8679975  libxcb-1.13.1.tar.bz2
+sha1 2ab17a1bb2a44e0a9cb0b26bcf899689ba1bbb3b  libxcb-1.13.1.tar.bz2
+sha256 a89fb7af7a11f43d2ce84a844a4b38df688c092bf4b67683aef179cdf2a647c4  libxcb-1.13.1.tar.bz2
 # Locally computed
 sha256 c5ffbfeaa501071ceeb97b7de2c0d703fdaa35de01c0fb6cbac1c28453a3e9fd  COPYING
diff --git a/package/x11r7/libxcb/libxcb.mk b/package/x11r7/libxcb/libxcb.mk
index 7e467aca3f..fdc65cefc0 100644
--- a/package/x11r7/libxcb/libxcb.mk
+++ b/package/x11r7/libxcb/libxcb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXCB_VERSION = 1.13
+LIBXCB_VERSION = 1.13.1
 LIBXCB_SOURCE = libxcb-$(LIBXCB_VERSION).tar.bz2
 LIBXCB_SITE = http://xcb.freedesktop.org/dist
 LIBXCB_LICENSE = MIT
