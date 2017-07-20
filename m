From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 21 Jul 2017 01:03:03 +0300
Subject: [Buildroot] [PATCH] psplash: bump to latest version
Message-ID: <8edf5dbd5f2672e761bd85a9945f248d7b0a7e29.1500588183.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/6c2/6c2b77ad710ae95f2c2e126a536542ad00bc2913/
http://autobuild.buildroot.net/results/ca0/ca0c07ffdc930b9fd8bb1eb42544a48470bb9d59/

Cc: Phil Eichinger <phil.eichinger@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/psplash/psplash.hash | 2 +-
 package/psplash/psplash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/psplash/psplash.hash b/package/psplash/psplash.hash
index 8c84f67147c6..68c6ffa8a9dd 100644
--- a/package/psplash/psplash.hash
+++ b/package/psplash/psplash.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a119cced0dab49dce0726ceda533f74ff8252731fcc36c3a53f876acb6e13c46  psplash-14c8f7b705de944beb4de3f296506d80871e410f.tar.gz
+sha256 aaddb20ef892dfb03d4e046cc634159bbcdfe555f7291652dde2b7d4cf491289  psplash-5b3c1cc28f5abdc2c33830150b48b278cc4f7bca.tar.gz
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index 0bd985f28f80..fe009785b995 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PSPLASH_VERSION = 14c8f7b705de944beb4de3f296506d80871e410f
+PSPLASH_VERSION = 5b3c1cc28f5abdc2c33830150b48b278cc4f7bca
 PSPLASH_SITE = git://git.yoctoproject.org/psplash
 PSPLASH_LICENSE = GPL-2.0+
 PSPLASH_AUTORECONF = YES
-- 
2.13.2
