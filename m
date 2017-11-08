From: Martin Bark <martin@barkynet.com>
Date: Wed,  8 Nov 2017 11:25:42 +0000
Subject: [Buildroot] [PATCH 2/2] package/libuv: bump version to 1.16.0
In-Reply-To: <20171108112542.8163-1-martin@barkynet.com>
References: <20171108112542.8163-1-martin@barkynet.com>
Message-ID: <20171108112542.8163-2-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://github.com/libuv/libuv/releases/tag/v1.16.0

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/libuv/libuv.hash | 2 +-
 package/libuv/libuv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuv/libuv.hash b/package/libuv/libuv.hash
index 5b29640d2c..748e1d2f0f 100644
--- a/package/libuv/libuv.hash
+++ b/package/libuv/libuv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  17afc94ec307be28fe8d4316679171219770df4f993905a79643c7583e106489  libuv-v1.15.0.tar.gz
+sha256  fe53b53eee3b15db8ae1b25cbfb8740944273e02f5ccd731b176800e2807d832  libuv-v1.16.0.tar.gz
diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 504f621c85..bbb42823b4 100644
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
-- 
2.15.0
