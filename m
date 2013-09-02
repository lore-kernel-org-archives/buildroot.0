From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 12:44:41 +0200
Subject: [Buildroot] [git commit] atk: bump to version 2.9.4
Message-ID: <20130902104447.589799B5D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6f2f8ed5c3ca58d43555ab1d38adbe794e95790
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/atk/atk.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index ecfec54..433e1e3 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ATK_VERSION_MAJOR = 2.9
-ATK_VERSION = $(ATK_VERSION_MAJOR).3
+ATK_VERSION = $(ATK_VERSION_MAJOR).4
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)/
 ATK_LICENSE = LGPLv2+
