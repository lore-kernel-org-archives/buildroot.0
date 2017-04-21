From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Fri, 21 Apr 2017 08:26:47 +0200
Subject: [Buildroot] [PATCH] tslib: update to 1.9
Message-ID: <1492756007-31315-1-git-send-email-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The curious ones will find the release notes here:

    https://github.com/kergoth/tslib/releases

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index f8f7ae3..e8e72c8 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/kergoth/tslib/releases/download/1.8/tslib-1.8.tar.xz.sha256
-sha256  be00af1ad643e3535b1958e4e48fea9905888489d7f1480a957c9e3d1cbaeac5  tslib-1.8.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.9/tslib-1.9.tar.xz.sha256
+sha256  af4e40a4cf2aa7a81f1602de1613190a101760689709103cc3590132266ac7b8  tslib-1.9.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index f3e0d94..e0f307a 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.8
+TSLIB_VERSION = 1.9
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL, LGPL
-- 
2.1.4
