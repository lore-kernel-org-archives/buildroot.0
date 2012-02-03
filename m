From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 3 Feb 2012 15:24:39 +0100
Subject: [Buildroot] [git commit] crosstool-ng: bump version
Message-ID: <20120203142519.1E609909AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ba094de31bbc9f986b6d5bce7932d5bb7443829
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 0337bf1..6f05ce4 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,4 +1,4 @@
-CROSSTOOL_NG_VERSION           = 1.13.2
+CROSSTOOL_NG_VERSION           = 1.13.3
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_STAGING   = NO
