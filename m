From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 14:07:57 +0100
Subject: [Buildroot] [git commit] poco: bump to version 1.8.1
Message-ID: <20180117130819.DDE3283E1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c903d0c073f8dffaa8100a22d2df91e3536acf90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/poco/poco.hash | 2 +-
 package/poco/poco.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index d92645f..0c0266f 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ae87222c674ff5cb1318253d19a72348e385f2a4db4b05329d712361303578f5  poco-poco-1.8.0.1-release.tar.gz
+sha256  43cc469c01d1f799efc51e2bfde6ffdf467b98a8a0901e6b33db86958619b3af  poco-poco-1.8.1-release.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 89b9791..3dddb43 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = poco-1.8.0.1-release
+POCO_VERSION = poco-1.8.1-release
 POCO_SITE = $(call github,pocoproject,poco,$(POCO_VERSION))
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
