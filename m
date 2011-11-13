From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Nov 2011 23:14:30 +0100
Subject: [Buildroot] [git commit] toolchain/crosstool-NG: update to 1.13.1
Message-ID: <20111113221441.949F78F314@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1ec29eaec46d901ad32acf7bc6dec19f5bfe7e4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

crosstool-ng-1.13.1 contains a fix for the UBI breakage in
the installed kernel headers.
Refresh a patch.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../crosstool-ng-000-makefile-recursion.patch      |    2 +-
 package/crosstool-ng/crosstool-ng.mk               |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng-000-makefile-recursion.patch b/package/crosstool-ng/crosstool-ng-000-makefile-recursion.patch
index 4f66744..b875e3f 100644
--- a/package/crosstool-ng/crosstool-ng-000-makefile-recursion.patch
+++ b/package/crosstool-ng/crosstool-ng-000-makefile-recursion.patch
@@ -18,7 +18,7 @@ Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
 diff -du crosstool-ng-1.12.0/Makefile.in host-crosstool-ng-1.12.0/Makefile.in
 --- crosstool-ng-1.12.0/Makefile.in     2011-08-01 01:21:34.000000000 +0200
 +++ host-crosstool-ng-1.12.0/Makefile.in        2011-08-07 21:39:16.055958219 +0200
-@@ -95,9 +95,14 @@
+@@ -101,9 +101,14 @@
  # level.
  # This has the side effect of only showing the real targets, and hiding our
  # internal ones. :-)
diff --git a/package/crosstool-ng/crosstool-ng.mk b/package/crosstool-ng/crosstool-ng.mk
index f676697..82c1fbe 100644
--- a/package/crosstool-ng/crosstool-ng.mk
+++ b/package/crosstool-ng/crosstool-ng.mk
@@ -1,4 +1,4 @@
-CROSSTOOL_NG_VERSION           = 1.13.0
+CROSSTOOL_NG_VERSION           = 1.13.1
 CROSSTOOL_NG_SOURCE            = crosstool-ng-$(CROSSTOOL_NG_VERSION).tar.bz2
 CROSSTOOL_NG_SITE              = http://crosstool-ng.org/download/crosstool-ng/
 CROSSTOOL_NG_INSTALL_STAGING   = NO
