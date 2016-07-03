From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 18:00:14 +0200
Subject: [Buildroot] [git commit] uclibc: update to 1.0.16
Message-ID: <20160703160043.AF71B81DF9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ea6daf61932eb51afeecb62d902f6fafa817f30c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update uClibc-ng to latest stable release (1.0.16).

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.hash | 2 +-
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 01a6b80..d7d1195 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,2 +1,2 @@
 # From http://www.uclibc-ng.org/
-sha256  0f62f35217d9a0b5eb3810dd6de16ab3dd4323f3224c6b95423250ac1e19ee49        uClibc-ng-1.0.15.tar.xz
+sha256  8de41ab1e774c4770a240009a85ad9c1566d82c52017267b99883d60e5bb10b3        uClibc-ng-1.0.16.tar.xz
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 6bc5f41..0b56f1f 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.15
+UCLIBC_VERSION = 1.0.16
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPLv2.1+
