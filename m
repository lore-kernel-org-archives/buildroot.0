From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Apr 2019 20:01:50 +0200
Subject: [Buildroot] [git commit] package/exiv2: bump to version 0.27.1
Message-ID: <20190429175907.C6684811AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff064fe02c9f93e1d69700464a305cac0a36808a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exiv2/exiv2.hash | 3 ++-
 package/exiv2/exiv2.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/exiv2/exiv2.hash b/package/exiv2/exiv2.hash
index e30cbfaa51..f99cb8cb87 100644
--- a/package/exiv2/exiv2.hash
+++ b/package/exiv2/exiv2.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 290cb6208f143b9bd5074d790fc8924409f28e5813356c143d739a3311d8ad76  exiv2-910f3507795e1930ae216c9febee0bf9a88e99c0.tar.gz
+sha256 1b3766b2c203ce213a4195de14d61694017ec1a69d15d4575bccecef130990fe exiv2-0.27.1.tar.gz
+sha256 a7ba75cb966aca374711e2af49e5f3aea6a4443a803440f5d93e73a5a1222f66 COPYING
diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 32029bab97..ba9d9b7303 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIV2_VERSION = 910f3507795e1930ae216c9febee0bf9a88e99c0
+EXIV2_VERSION = 0.27.1
 EXIV2_SITE = $(call github,Exiv2,exiv2,$(EXIV2_VERSION))
 EXIV2_INSTALL_STAGING = YES
 
