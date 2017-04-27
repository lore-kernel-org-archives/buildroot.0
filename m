From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 10:19:02 +0200
Subject: [Buildroot] [git commit] tovid: bump version to 0.35.2
Message-ID: <20170427081947.02F1182812@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3046f64c6a341165a3108900fc978579af6959f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Steve Kenton <skenton@ou.edu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tovid/tovid.hash | 4 ++--
 package/tovid/tovid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tovid/tovid.hash b/package/tovid/tovid.hash
index 9ddd750..0bd7668 100644
--- a/package/tovid/tovid.hash
+++ b/package/tovid/tovid.hash
@@ -1,2 +1,2 @@
-# Locally computed:
-sha256  06f7cb00b213bbe83d72f4f2076b675a662697034e1d2cdc2dce987e35c827bc  tovid-0.35.0.tar.gz
+# Locally calculated
+sha256 3193d081a7aa8e00f946b7514066f1fb7647f533ab1ebcc36b5ced927b0a1ab5  tovid-0.35.2.tar.gz
diff --git a/package/tovid/tovid.mk b/package/tovid/tovid.mk
index 079fada..c904b98 100644
--- a/package/tovid/tovid.mk
+++ b/package/tovid/tovid.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TOVID_VERSION = 0.35.0
-TOVID_SITE = https://github.com/tovid-suite/tovid/releases/download/v$(TOVID_VERSION)
+TOVID_VERSION = 0.35.2
+TOVID_SITE = https://github.com/tovid-suite/tovid/releases/download/$(TOVID_VERSION)
 TOVID_LICENSE = GPL-2.0+
 TOVID_LICENSE_FILES = COPYING
 TOVID_SETUP_TYPE = distutils
