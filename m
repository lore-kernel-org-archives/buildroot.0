From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 20:07:59 +0200
Subject: [Buildroot] [git commit] atk: bump to version 2.22.0
Message-ID: <20160920181525.A67108183B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6f349980d407340e1f66bf9f11fb28e4ff4b4515
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/atk/atk.hash | 4 ++--
 package/atk/atk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atk/atk.hash b/package/atk/atk.hash
index 7178ccc..12c9870 100644
--- a/package/atk/atk.hash
+++ b/package/atk/atk.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.20/atk-2.20.0.sha256sum
-sha256 493a50f6c4a025f588d380a551ec277e070b28a82e63ef8e3c06b3ee7c1238f0 atk-2.20.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atk/2.22/atk-2.22.0.sha256sum
+sha256 d349f5ca4974c9c76a4963e5b254720523b0c78672cbc0e1a3475dbd9b3d44b6 atk-2.22.0.tar.xz
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 663d13a..90d329a 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.20
+ATK_VERSION_MAJOR = 2.22
 ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
