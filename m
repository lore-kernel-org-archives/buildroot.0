From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 26 Oct 2020 23:51:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/xl2tp: bump to version 1.3.16
Message-ID: <20201026225142.76852-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/xelerance/xl2tpd/releases/tag/v1.3.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xl2tp/xl2tp.hash | 2 +-
 package/xl2tp/xl2tp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xl2tp/xl2tp.hash b/package/xl2tp/xl2tp.hash
index 8cf6522833..471657f0f2 100644
--- a/package/xl2tp/xl2tp.hash
+++ b/package/xl2tp/xl2tp.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  0d149bf9d2f7d838806e6a36fd7a676d03bf246d2b7869e16c945330e13b922e  xl2tp-1.3.15.tar.gz
+sha256  c28608b315adb25c8bf9579c1d6ab52ab47c4c43b68a5ab63c5d039196fd180f  xl2tp-1.3.16.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index b40eb2fd18..89ca65a7e4 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XL2TP_VERSION = 1.3.15
+XL2TP_VERSION = 1.3.16
 XL2TP_SITE = $(call github,xelerance,xl2tpd,v$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
 XL2TP_LICENSE = GPL-2.0
-- 
2.28.0
