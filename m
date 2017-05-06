From: Martin Bark <martin@barkynet.com>
Date: Sat,  6 May 2017 14:19:14 +0100
Subject: [Buildroot] [PATCH 3/3] package/nodejs: bump version to 7.10.0
In-Reply-To: <1494076754-3224-1-git-send-email-martin@barkynet.com>
References: <1494076754-3224-1-git-send-email-martin@barkynet.com>
Message-ID: <1494076754-3224-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://nodejs.org/en/blog/release/v7.10.0/

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/nodejs/nodejs.hash | 4 ++--
 package/nodejs/nodejs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index e54b5e3..73869e9 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,2 +1,2 @@
-# From upstream URL: http://nodejs.org/dist/v7.9.0/SHASUMS256.txt
-sha256  a569764b884929f31a0772600a5cf36048ad42aa8c54ba4cabea6c067ef96a29  node-v7.9.0.tar.xz
+# From upstream URL: http://nodejs.org/dist/v7.10.0/SHASUMS256.txt
+sha256  dc34dd15524ba821ffcae7b245eabe8631e2614d5e3cb8ff08fbfdadf5919f21  node-v7.10.0.tar.xz
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 84f0e2e..05c42ab 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NODEJS_VERSION = 7.9.0
+NODEJS_VERSION = 7.10.0
 NODEJS_SOURCE = node-v$(NODEJS_VERSION).tar.xz
 NODEJS_SITE = http://nodejs.org/dist/v$(NODEJS_VERSION)
 NODEJS_DEPENDENCIES = host-python host-nodejs zlib \
-- 
2.7.4
