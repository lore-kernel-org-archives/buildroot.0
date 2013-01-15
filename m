From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 15 Jan 2013 17:34:44 +0100
Subject: [Buildroot] [PATCH] tslib: fix license info
Message-ID: <1358267684-31885-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---

Indeed, some tslib files are licensed under the GPL:
$ grep -ril 'placed under the GPL' |wc -l
9
$ grep -ril 'placed under the LGPL' |wc -l
39
$

 package/tslib/tslib.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index c94be7d..8533cf9 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -5,7 +5,7 @@
 #############################################################
 TSLIB_VERSION = 412d99d
 TSLIB_SITE = http://github.com/kergoth/tslib/tarball/master
-TSLIB_LICENSE = LGPL
+TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
 
 TSLIB_AUTORECONF = YES
-- 
1.7.10.4
