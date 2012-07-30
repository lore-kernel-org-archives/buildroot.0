From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 19:19:09 +0200
Subject: [Buildroot] [git commit branch/next] crosstool-ng: bump to version
	1.15.3
Message-ID: <20120802195302.388DE96CE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6b077ccd0ef658134cb580343b274227c10c8b0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jonathan Liu <net147@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/crosstool-ng/crosstool-ng.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index 4bf0258..379d400 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,4 +1,4 @@
-CROSSTOOL_NG_VERSION           = 1.15.2
+CROSSTOOL_NG_VERSION           = 1.15.3
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_TARGET    = NO
