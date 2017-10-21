From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 10:01:59 +0200
Subject: [Buildroot] [git commit] libuv: bump to version 1.15.0
Message-ID: <20171021080214.6FC5180286@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dadc24c0ac8b34ffff9d0840e9c4e40278db1e5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index ff10f70..5b29640 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 82fbbb0eaab4adcf8ed513d3b777c8e02ed2e77aae265baf6bd2d68cb84bc9e3  libuv-v1.14.1.tar.gz
+sha256  17afc94ec307be28fe8d4316679171219770df4f993905a79643c7583e106489  libuv-v1.15.0.tar.gz
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 563d010..504f621 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.14.1
+LIBUV_VERSION = v1.15.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
