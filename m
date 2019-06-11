From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 11 Jun 2019 19:33:57 +0200
Subject: [Buildroot] [PATCH 1/2] package/rauc: bump to version 1.1
Message-ID: <1560274438-22422-1-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See: https://github.com/rauc/rauc/releases/tag/v1.1

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
Tested on WaRP7:
	Welcome to Buildroot
	buildroot login: root
	# rauc --version
	rauc 1.1
	
 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 54c6c93..c7b73f7 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated, after verifying against
-# https://github.com/rauc/rauc/releases/download/v0.4/rauc-0.4.tar.xz.asc
-sha256 8875ab0d02b4cb38a211b236855361c18b874b385e6f18dde394ac699f2cf2aa rauc-1.0.tar.xz
+# https://github.com/rauc/rauc/releases/download/v1.1/rauc-1.1.tar.xz.asc
+sha256 e49086da3a72564806963d2309e8e2b255492fb314db61f84c9b4cebece98e3f rauc-1.1.tar.xz
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 3848a01..fa324e6 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.0
+RAUC_VERSION = 1.1
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.7.4
