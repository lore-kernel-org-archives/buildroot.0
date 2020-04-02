From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Apr 2020 21:45:16 +0200
Subject: [Buildroot] [git commit] package/cjson: bump to version 1.7.13
Message-ID: <20200402194959.E343086C03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7ce1d034d82ad9a3e7872453109cc13e8c0fe32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation of hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cjson/cjson.hash | 4 ++--
 package/cjson/cjson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cjson/cjson.hash b/package/cjson/cjson.hash
index a02158321a..b99fcee8ba 100644
--- a/package/cjson/cjson.hash
+++ b/package/cjson/cjson.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 760687665ab41a5cff9c40b1053c19572bcdaadef1194e5cba1b5e6f824686e7  cjson-1.7.12.tar.gz
-sha256 a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
+sha256  d4e77a38f540f2c37f55758f2666655314f1f51c716fea5f279659940efdcf04  cjson-1.7.13.tar.gz
+sha256  a36dda207c36db5818729c54e7ad4e8b0c6fba847491ba64f372c1a2037b6d5c  LICENSE
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index b61d1ceb1b..31fef74d9b 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CJSON_VERSION = 1.7.12
+CJSON_VERSION = 1.7.13
 CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
