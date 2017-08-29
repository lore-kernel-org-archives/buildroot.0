From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Aug 2017 21:57:27 +0200
Subject: [Buildroot] [git commit] tslib: update to version 1.12
Message-ID: <20170902130620.2E65F8016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5ba888a29784c3edd54594da5f72cac60722eaa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The release page has a short changelog overview:

    https://github.com/kergoth/tslib/releases/tag/1.12

Signed-off-by: Martin Kepplinger <martink@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index 87d72ac..f053c6c 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,2 +1,2 @@
-# https://github.com/kergoth/tslib/releases/download/1.11/tslib-1.11.tar.xz.sha256
-sha256  90d22b2f1b6dc9899d9491bc0480dfdcb2b55ff6e620ebb999d607aa5389af06  tslib-1.11.tar.xz
+# https://github.com/kergoth/tslib/releases/download/1.12/tslib-1.12.tar.xz.sha256
+sha256  237f66c9e53789429b1bcc89a36eb7a37f1deb2877e6e7d928e994e3c48d0b83  tslib-1.12.tar.xz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 5190465..2b4320d 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.11
+TSLIB_VERSION = 1.12
 TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
