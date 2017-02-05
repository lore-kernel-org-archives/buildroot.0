From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Feb 2017 15:16:40 +0100
Subject: [Buildroot] [git commit] package/libuv: bump to version 0.11.0
Message-ID: <20170205141704.A740681916@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f60f3e610a6100672d7323afaf590f9f63c3eccf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 412479f..9ad1c8a 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  4b5f71939dd4272ebcfb8e04833e9a273a08b1bf1277d37d14085d7b04b19832  libuv-v1.10.1.tar.gz
+sha256  6ec7eec6ecc24b1a8ffedebedb2fe9313fffb5410de89aaf784dd01080411c7a  libuv-v1.11.0.tar.gz
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 745c077..6f6a1cc 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.10.1
+LIBUV_VERSION = v1.11.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
