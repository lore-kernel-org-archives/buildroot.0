From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Thu, 9 Feb 2017 14:33:23 +0100
Subject: [Buildroot] [PATCH v2] tslib: bump to 1.5
In-Reply-To: <1486646889-19742-1-git-send-email-martin.kepplinger@ginzinger.com>
References: <1486646889-19742-1-git-send-email-martin.kepplinger@ginzinger.com>
Message-ID: <1486647203-24194-1-git-send-email-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
again, thanks to buildroot for your help.


revision history
----------------
v2: forgot to update hash source comment


 package/tslib/tslib.hash | 6 ++----
 package/tslib/tslib.mk   | 3 +--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index b731df2..9ce4e09 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,4 +1,2 @@
-# taken from https://github.com/kergoth/tslib/releases/tag/1.4
-sha256  ad0373f1dbfda27caec92cb10421227f226c79d160488f1ac915585ba947741f  tslib-1.4.tar.xz
-# Locally computed
-sha256	b76d25358d1e2bbcc88b0b225e8d71cd00a4795f6d17020bae270940b17d0825  02795c4fa8b842c6fc017e86b5e036466bd4d3ef.patch
+# taken from https://github.com/kergoth/tslib/releases/tag/1.5
+sha256  94874fe72c5af5c9be642a2ce524f014eb1d59d15cf852f2d3b2cf380f04252d  tslib-1.5.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 356c4c2..08b1d26 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.4
+TSLIB_VERSION = 1.5
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
 
-TSLIB_PATCH = https://github.com/kergoth/tslib/commit/02795c4fa8b842c6fc017e86b5e036466bd4d3ef.patch
 TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
-- 
2.1.4
