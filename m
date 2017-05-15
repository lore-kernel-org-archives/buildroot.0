From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 23:02:32 +0200
Subject: [Buildroot] [git commit branch/next] tslib: update to 1.10
Message-ID: <20170515210736.2530982825@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af8fb485a91593d4ccfc3728df26230527b84292
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

If you're overly interested, check out the release notes at
https://github.com/kergoth/tslib/releases

Signed-off-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index e8e72c8..1eeafd0 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/kergoth/tslib/releases/download/1.9/tslib-1.9.tar.xz.sha256
-sha256  af4e40a4cf2aa7a81f1602de1613190a101760689709103cc3590132266ac7b8  tslib-1.9.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.10/tslib-1.10.tar.xz.sha256
+sha256  26ce1df4647dc8d16f6247062f30a8a03c34165dd19e042d0b2df8860da265b2  tslib-1.10.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 27d960d..9d7b926 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.9
+TSLIB_VERSION = 1.10
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL, LGPL
