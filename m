From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 28 Aug 2019 18:49:36 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/vdr: bump version to 2.4.1
Message-ID: <20190828164936.16960-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vdr/vdr.hash | 6 +++---
 package/vdr/vdr.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/vdr/vdr.hash b/package/vdr/vdr.hash
index e9cee9a5b5..99f6ba822d 100644
--- a/package/vdr/vdr.hash
+++ b/package/vdr/vdr.hash
@@ -1,5 +1,5 @@
-# From https://www.linuxtv.org/pipermail/vdr/2018-April/029407.html
-md5 12c6a3abeadfa915fcfe736bb047a3ab  vdr-2.4.0.tar.bz2
+# From https://www.linuxtv.org/pipermail/vdr/2019-June/029497.html
+md5 b2897fe6b6e6711d512a69642b1b8ec1  vdr-2.4.1.tar.bz2
 # Locally computed
-sha256 93af49fe87048073dc38ef5e6c71e9704344d730f21c261afac69e3c937f8cce  vdr-2.4.0.tar.bz2
+sha256 25c3f835c4f3ff92cd2db10c004439ef22c2e895193c77fbe8cc7eac4858a1dc  vdr-2.4.1.tar.bz2
 sha256 ddb9db7630752f8fdc6898f7c99a99eaeeac5213627ecb093df9c82f56175dc7  COPYING
diff --git a/package/vdr/vdr.mk b/package/vdr/vdr.mk
index 67e160c8f0..83cdede307 100644
--- a/package/vdr/vdr.mk
+++ b/package/vdr/vdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VDR_VERSION = 2.4.0
+VDR_VERSION = 2.4.1
 VDR_SOURCE = vdr-$(VDR_VERSION).tar.bz2
 VDR_SITE = ftp://ftp.tvdr.de/vdr
 VDR_LICENSE = GPL-2.0+
-- 
2.20.1
