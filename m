From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 28 Mar 2011 21:14:23 +0200
Subject: [Buildroot] [PATCH] tslib: bump version
Message-ID: <1301339663-5026-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/tslib/tslib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 3ca40c5..ef77dac 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -3,7 +3,7 @@
 # tslib
 #
 #############################################################
-TSLIB_VERSION:=860d69ca
+TSLIB_VERSION:=412d99d8b92c
 TSLIB_SITE:=git://github.com/kergoth/tslib.git
 TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
-- 
1.7.1
