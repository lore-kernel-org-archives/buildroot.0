From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 27 Sep 2018 20:19:07 +0200
Subject: [Buildroot] [PATCH 1/1] xl2tp: bump to version 1.3.12
Message-ID: <20180927181907.2150-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xl2tp/xl2tp.hash | 3 ++-
 package/xl2tp/xl2tp.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/xl2tp/xl2tp.hash b/package/xl2tp/xl2tp.hash
index 152d615a2e..9cc76e9d25 100644
--- a/package/xl2tp/xl2tp.hash
+++ b/package/xl2tp/xl2tp.hash
@@ -1,2 +1,3 @@
 # locally computed
-sha256  1164b574e93a44c2a2e76c0c68d8d60437bd884a6c964d9c68be1556278e3d2d  xl2tp-v1.3.8.tar.gz
+sha256  6f0ac50a76500d5cc56a67451b61e5f561b3309357176b39deabb1705e8745fd  xl2tp-v1.3.12.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index eee5c04de8..63c798d886 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XL2TP_VERSION = v1.3.8
+XL2TP_VERSION = v1.3.12
 XL2TP_SITE = $(call github,xelerance,xl2tpd,$(XL2TP_VERSION))
 XL2TP_DEPENDENCIES = libpcap
 XL2TP_LICENSE = GPL-2.0
-- 
2.17.1
