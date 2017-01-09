From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Mon, 9 Jan 2017 14:00:22 +0100
Subject: [Buildroot] [PATCH] tslib: bump version to 1.3
Message-ID: <1483966822-16568-1-git-send-email-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
 package/tslib/tslib.hash | 4 +++-
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index fc493e7..f22767b 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,4 @@
 # Locally generated
-sha256  b6450f4d1bc8f4fbbb796a2d1210aee3ccf9ecf302a368dddf279c63eb634833  tslib-1.2.tar.gz
+sha256  599f51c265158e7801b166e879e19759e8d3e5fdf2fa99c630698fe162a41d56  tslib-1.3.tar.gz
+sha256  cae81f835c50415e0087eaec397e6507dfbb1603bbc78607bc37f501591e1f3e  tslib-1.3.tar.bz2
+sha256  e935101adca980a14d1a13362796222575f99e6a41db585e8358fffddb98d92c  tslib-1.3.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 6437f60..d6e66b7 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.2
+TSLIB_VERSION = 1.3
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
-- 
2.1.4
