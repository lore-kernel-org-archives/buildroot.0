From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 22:29:49 +0100
Subject: [Buildroot] [git commit] expat: bump to 2.2.5
Message-ID: <20171201205333.536447FAAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78e964bc22a8ecab1b8b11b23b30824737da218d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/expat/expat.hash | 10 +++++-----
 package/expat/expat.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index ef01ec9..945e102 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.2.4/
-md5	6e3980aba29a224a9f478d88ac7ec207	expat-2.2.4.tar.bz2
-sha1	3394d6390c041a8f5dec1d5fe7c4af0a23ae4504	expat-2.2.4.tar.bz2
-# Calculated based on the hashes above
-sha256	03ad85db965f8ab2d27328abcf0bc5571af6ec0a414874b2066ee3fdd372019e	expat-2.2.4.tar.bz2
+# From https://sourceforge.net/projects/expat/files/expat/2.2.5/
+md5	789e297f547980fc9ecc036f9a070d49		expat-2.2.5.tar.bz2
+sha1	490659abd7d6c6d4cb4e60c945a15fbf081564f6	expat-2.2.5.tar.bz2
+
 # Locally calculated
+sha256	d9dc32efba7e74f788fcc4f212a43216fc37cf5f23f4c2339664d473353aedf6	expat-2.2.5.tar.bz2
 sha256	46336ab2fec900803e2f1a4253e325ac01d998efb09bc6906651f7259e636f76	COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index ef196ec..69c457d 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.2.4
+EXPAT_VERSION = 2.2.5
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.bz2
 EXPAT_INSTALL_STAGING = YES
