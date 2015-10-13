From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 13 Oct 2015 23:29:37 +0200
Subject: [Buildroot] [PATCH 1/1] atk: bump to version 2.18
Message-ID: <1444771777-25065-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/atk/atk.hash | 4 ++--
 package/atk/atk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atk/atk.hash b/package/atk/atk.hash
index 4f905f2..986497c 100644
--- a/package/atk/atk.hash
+++ b/package/atk/atk.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.16/atk-2.16.0.sha256sum
-sha256 095f986060a6a0b22eb15eef84ae9f14a1cf8082488faa6886d94c37438ae562 atk-2.16.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atk/2.18/atk-2.18.0.sha256sum
+sha256 ce6c48d77bf951083029d5a396dd552d836fff3c1715d3a7022e917e46d0c92b atk-2.18.0.tar.xz
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 53365e0..579e330 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.16
+ATK_VERSION_MAJOR = 2.18
 ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
-- 
1.9.1
