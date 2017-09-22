From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Sep 2017 23:36:21 +0200
Subject: [Buildroot] [git commit] package/ocrad: bump version to 0.26
Message-ID: <20170922213002.588127FDA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e8472bd3bcfee2981ffdc134984e3a9389450162
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ocrad/ocrad.hash | 2 +-
 package/ocrad/ocrad.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ocrad/ocrad.hash b/package/ocrad/ocrad.hash
index d2a44ae..5f093d2 100644
--- a/package/ocrad/ocrad.hash
+++ b/package/ocrad/ocrad.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e710be9c030fbcbce2315077326c8268feb422c0bc39fa744644cbbd1f5d4dd4	ocrad-0.25.tar.lz
+sha256 c383d37869baa0990d38d38836d4d567e9e2862aa0cd704868b62dafeac18e3c  ocrad-0.26.tar.lz
diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index 3a858ef..94020d2 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCRAD_VERSION = 0.25
+OCRAD_VERSION = 0.26
 OCRAD_SOURCE = ocrad-$(OCRAD_VERSION).tar.lz
 OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
 OCRAD_LICENSE = GPL-3.0+
