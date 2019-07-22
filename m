From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 22 Jul 2019 18:12:12 +0200
Subject: [Buildroot] [PATCH 1/2] package/heimdal: bump version to 7.7.0
Message-ID: <20190722161213.1538-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added upstream hashes and license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Although version 7.6.0 fixes CVE-2018-16860 this bump is sent with a
normal subject because the package is only used as a host package.

 package/heimdal/heimdal.hash | 7 +++++--
 package/heimdal/heimdal.mk   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
index ac26aa60e5..0750233858 100644
--- a/package/heimdal/heimdal.hash
+++ b/package/heimdal/heimdal.hash
@@ -1,2 +1,5 @@
-# Locally calculated
-sha256 c5a2a0030fcc728022fa2332bad85569084d1c3b9a59587b7ebe141b0532acad  heimdal-7.5.0.tar.gz
+# From https://github.com/heimdal/heimdal/releases
+sha1 5dd16703be7255f66a4d65440f0c622aeeca60d9  heimdal-7.7.0.tar.gz
+sha256 f02d3314d634cc55eb9cf04a1eae0d96b293e45a1f837de9d894e800161b7d1b  heimdal-7.7.0.tar.gz
+# Locally computed
+sha256 0c4b07bf5b98f7a1d01f8e60722d6c6747ef052c2aa6d2043daf690d4e1b0a7f  LICENSE
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 5f7b6c6853..5c0570fdd1 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HEIMDAL_VERSION = 7.5.0
+HEIMDAL_VERSION = 7.7.0
 HEIMDAL_SITE = https://github.com/heimdal/heimdal/releases/download/heimdal-$(HEIMDAL_VERSION)
 HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
-- 
2.20.1
