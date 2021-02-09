From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  9 Feb 2021 21:39:13 +0100
Subject: [Buildroot] [PATCH 2/2] package/ngircd: bump to version 26.1
In-Reply-To: <20210209203913.1227258-1-fontaine.fabrice@gmail.com>
References: <20210209203913.1227258-1-fontaine.fabrice@gmail.com>
Message-ID: <20210209203913.1227258-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/ngircd/ngircd/releases/tag/rel-26.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ngircd/ngircd.hash | 2 +-
 package/ngircd/ngircd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ngircd/ngircd.hash b/package/ngircd/ngircd.hash
index 72874c8d49..e46e8e6669 100644
--- a/package/ngircd/ngircd.hash
+++ b/package/ngircd/ngircd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  56dcc6483058699fcdd8e54f5010eecee09824b93bad7ed5f18818e550d855c6  ngircd-26.tar.xz
+sha256  55c16fd26009f6fc6a007df4efac87a02e122f680612cda1ce26e17a18d86254  ngircd-26.1.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index ed15ded9d0..47d8ef2265 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGIRCD_VERSION = 26
+NGIRCD_VERSION = 26.1
 NGIRCD_SOURCE = ngircd-$(NGIRCD_VERSION).tar.xz
 NGIRCD_SITE = https://arthur.barton.de/pub/ngircd
 NGIRCD_LICENSE = GPL-2.0+
-- 
2.29.2
