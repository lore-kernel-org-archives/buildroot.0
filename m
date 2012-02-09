From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 9 Feb 2012 22:59:20 +0100
Subject: [Buildroot] [git commit] toolchain/crosstool-ng: update to 1.13.4
Message-ID: <20120209221235.7C29290A44@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d83f347c254f194b8da517e92cc5bb565b1ffd73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to fix downloads from sourceforge (the 'mesh' network
no longer works).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 6f05ce4..a2069a9 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,4 +1,4 @@
-CROSSTOOL_NG_VERSION           = 1.13.3
+CROSSTOOL_NG_VERSION           = 1.13.4
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_STAGING   = NO
