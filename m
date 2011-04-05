From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 5 Apr 2011 12:05:08 +0200
Subject: [Buildroot] [git commit] tslib: bump version
Message-ID: <20110405100726.8B51F81F6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6fd58dfcf58206e10e101dbfca5f7368bb425861
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
