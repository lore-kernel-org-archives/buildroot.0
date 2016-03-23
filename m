From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 23 Mar 2016 18:55:19 -0300
Subject: [Buildroot] [PATCH 1/4] atk: bump to version 2.20.0
Message-ID: <1458770122-8852-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.7.3
