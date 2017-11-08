From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 Nov 2017 19:45:45 +0100
Subject: [Buildroot] [git commit] package/libuv: bump version to 1.16.0
Message-ID: <20171108183850.51A5D8019F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0521285e6703eb3408139e5c6e6ee04ef3f59bb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://github.com/libuv/libuv/releases/tag/v1.16.0

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 5b29640..748e1d2 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  17afc94ec307be28fe8d4316679171219770df4f993905a79643c7583e106489  libuv-v1.15.0.tar.gz
+sha256  fe53b53eee3b15db8ae1b25cbfb8740944273e02f5ccd731b176800e2807d832  libuv-v1.16.0.tar.gz
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 504f621..bbb4282 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUV_VERSION = v1.15.0
+LIBUV_VERSION = v1.16.0
 LIBUV_SITE = $(call github,libuv,libuv,$(LIBUV_VERSION))
 LIBUV_DEPENDENCIES = host-pkgconf
 LIBUV_INSTALL_STAGING = YES
