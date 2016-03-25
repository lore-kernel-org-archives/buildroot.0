From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Mar 2016 11:30:46 -0300
Subject: [Buildroot] [PATCH] gcr: bump to version 3.20.0
Message-ID: <1458916246-19707-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcr/gcr.hash | 4 ++--
 package/gcr/gcr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gcr/gcr.hash b/package/gcr/gcr.hash
index 8f1f931..8b8b748 100644
--- a/package/gcr/gcr.hash
+++ b/package/gcr/gcr.hash
@@ -1,2 +1,2 @@
-# From http://ftp.acc.umu.se/pub/gnome/sources/gcr/3.18/gcr-3.18.0.sha256sum
-sha256	d4d16da5af55148a694055835ccd07ad34daf0ad03bdad929bf7cad15637ce00	gcr-3.18.0.tar.xz
+# From http://ftp.acc.umu.se/pub/gnome/sources/gcr/3.20/gcr-3.20.0.sha256sum
+sha256	90572c626d8a708225560c42b4421f7941315247fa1679d4ef569bde7f4bb379	gcr-3.20.0.tar.xz
diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
index a89f874..d8cb667 100644
--- a/package/gcr/gcr.mk
+++ b/package/gcr/gcr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GCR_VERSION_MAJOR = 3.18
+GCR_VERSION_MAJOR = 3.20
 GCR_VERSION = $(GCR_VERSION_MAJOR).0
 GCR_SITE = http://ftp.acc.umu.se/pub/gnome/sources/gcr/$(GCR_VERSION_MAJOR)
 GCR_SOURCE = gcr-$(GCR_VERSION).tar.xz
-- 
2.7.3
