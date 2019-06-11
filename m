From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Tue, 11 Jun 2019 19:33:58 +0200
Subject: [Buildroot] [PATCH 2/2] package/rauc: update legal info
In-Reply-To: <1560274438-22422-1-git-send-email-pjtexier@koncepto.io>
References: <1560274438-22422-1-git-send-email-pjtexier@koncepto.io>
Message-ID: <1560274438-22422-2-git-send-email-pjtexier@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 package/rauc/rauc.hash | 1 +
 package/rauc/rauc.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index c7b73f7..ad4f744 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,4 @@
 # Locally calculated, after verifying against
 # https://github.com/rauc/rauc/releases/download/v1.1/rauc-1.1.tar.xz.asc
 sha256 e49086da3a72564806963d2309e8e2b255492fb314db61f84c9b4cebece98e3f rauc-1.1.tar.xz
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index fa324e6..47ce242 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -8,6 +8,7 @@ RAUC_VERSION = 1.1
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
+RAUC_LICENSE_FILES = COPYING
 RAUC_DEPENDENCIES = host-pkgconf openssl libglib2
 
 ifeq ($(BR2_PACKAGE_RAUC_NETWORK),y)
-- 
2.7.4
