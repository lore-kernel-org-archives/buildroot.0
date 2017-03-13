From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Mon, 13 Mar 2017 18:09:27 +0100
Subject: [Buildroot] [PATCH v2] tslib: update to 1.7
In-Reply-To: <20170313142657.wva3dd6jx3b4wpgr@tarshish>
References: <20170313142657.wva3dd6jx3b4wpgr@tarshish>
Message-ID: <1489424967-29071-1-git-send-email-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
sorry. forgot to add tslib.mk previously.


 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index 649822e..dea1f91 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/kergoth/tslib/releases/download/1.6/tslib-1.6.tar.xz.sha256
-sha256  b9fbb93984d02506c5a944d475d0bf7f19473a111e547f523328138ed5c6e02b  tslib-1.6.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.7/tslib-1.7.tar.xz.sha256
+sha256  f2a4a416331dd2f38cea84cc526f23da1c342a2588cfae72fe070908f08b5ce8  tslib-1.7.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 0940d0d..e19c8d2 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.6
+TSLIB_VERSION = 1.7
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL, LGPL
-- 
2.1.4
