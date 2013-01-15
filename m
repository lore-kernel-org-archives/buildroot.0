From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 15 Jan 2013 21:37:38 +0100
Subject: [Buildroot] [git commit] tslib: fix license info
Message-ID: <20130115204907.918D69A1C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cf256ec4943fe35f488238dc90fd45ff509a783
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tslib/tslib.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
