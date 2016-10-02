From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  2 Oct 2016 09:07:52 -0300
Subject: [Buildroot] [PATCH] neon: bump to version 0.30.2
Message-ID: <1475410072-30499-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/neon/neon.hash | 2 +-
 package/neon/neon.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/neon/neon.hash b/package/neon/neon.hash
index 9db5f82..d66b6fd 100644
--- a/package/neon/neon.hash
+++ b/package/neon/neon.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	2962cfcb5d30f3272e3d2fa0e473434419770a3801afe3d46e5d1650787990c2	neon-0.30.0.tar.gz
+sha256	db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b153718d1b15d3d967fbca	neon-0.30.2.tar.gz
diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index 13d8084..ca1a6bd 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NEON_VERSION = 0.30.0
+NEON_VERSION = 0.30.2
 NEON_SITE = http://www.webdav.org/neon
 NEON_LICENSE = LGPLv2+ (library), GPLv2+ (manual and tests)
 NEON_LICENSE_FILES = src/COPYING.LIB test/COPYING README
-- 
2.7.3
