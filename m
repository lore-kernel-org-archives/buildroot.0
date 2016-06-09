From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jun 2016 11:37:27 +0200
Subject: [Buildroot] [git commit] package/libuv: bump to version 1.9.1
Message-ID: <20160609093839.94C7C820F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5c982cd23cf6845671b91765008c622c024fe95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 9758d76..75c7ffe 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  f8b8272a0d80138b709d38fad2baf771899eed61e7f9578d17898b07a1a2a5eb  libuv-v1.9.0.tar.gz
+sha256  a6ca9f0648973d1463f46b495ce546ddcbe7cce2f04b32e802a15539e46c57ad  libuv-v1.9.1.tar.gz
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 45b301f..11d51dd 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.9.0
+LIBUV_VERSION = v1.9.1
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
