From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:53:28 +0100
Subject: [Buildroot] [git commit] atk: bump to version 2.20.0
Message-ID: <20160324215334.8DCC580409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37fdfdc2ee0bf1d26f0ae7f326c8b968c5b14402
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/atk/atk.hash | 4 ++--
 package/atk/atk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atk/atk.hash b/package/atk/atk.hash
index 986497c..7178ccc 100644
--- a/package/atk/atk.hash
+++ b/package/atk/atk.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.18/atk-2.18.0.sha256sum
-sha256 ce6c48d77bf951083029d5a396dd552d836fff3c1715d3a7022e917e46d0c92b atk-2.18.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atk/2.20/atk-2.20.0.sha256sum
+sha256 493a50f6c4a025f588d380a551ec277e070b28a82e63ef8e3c06b3ee7c1238f0 atk-2.20.0.tar.xz
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 1c5b90c..663d13a 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.18
+ATK_VERSION_MAJOR = 2.20
 ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
