From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 20:04:29 +0200
Subject: [Buildroot] [git commit] atk: bump to version 2.16
Message-ID: <20150401181231.090EA81916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1f47535a3e4af48b80db8c33a80ec45cbb495dfe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also update hash file.

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/atk/atk.hash |    4 ++--
 package/atk/atk.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atk/atk.hash b/package/atk/atk.hash
index fe35585..4f905f2 100644
--- a/package/atk/atk.hash
+++ b/package/atk/atk.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.14/atk-2.14.0.sha256sum
-sha256	2875cc0b32bfb173c066c22a337f79793e0c99d2cc5e81c4dac0d5a523b8fbad	atk-2.14.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atk/2.16/atk-2.16.0.sha256sum
+sha256 095f986060a6a0b22eb15eef84ae9f14a1cf8082488faa6886d94c37438ae562 atk-2.16.0.tar.xz
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 2cea550..53365e0 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.14
+ATK_VERSION_MAJOR = 2.16
 ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
