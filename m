From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Sep 2018 14:12:55 +0200
Subject: [Buildroot] [git commit] quazip: upgrade to 0.7.6
Message-ID: <20180927121257.11E6988F59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6fa6a45e196665d6607b522f290b1451b949c2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quazip/quazip.hash | 2 +-
 package/quazip/quazip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quazip/quazip.hash b/package/quazip/quazip.hash
index 4e9af16a1a..9f43643d6b 100644
--- a/package/quazip/quazip.hash
+++ b/package/quazip/quazip.hash
@@ -1,2 +1,2 @@
 # From github release page
-sha256 f3a56647d4706c9daef411e40e3884702e2bd770e980145c3899321788ba8bb2 quazip-0.7.5.tar.gz
+sha256 4118a830a375a81211956611cc34b1b5b4ddc108c126287b91b40c2493046b70 quazip-0.7.6.tar.gz
diff --git a/package/quazip/quazip.mk b/package/quazip/quazip.mk
index 7bef2fe7d9..872340ab40 100644
--- a/package/quazip/quazip.mk
+++ b/package/quazip/quazip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAZIP_VERSION = 0.7.5
+QUAZIP_VERSION = 0.7.6
 QUAZIP_SITE = $(call github,stachenov,quazip,$(QUAZIP_VERSION))
 QUAZIP_INSTALL_STAGING = YES
 QUAZIP_DEPENDENCIES = \
