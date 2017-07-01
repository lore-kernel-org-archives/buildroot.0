From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 19:47:34 +0200
Subject: [Buildroot] [git commit] package/p7zip: bump version to 16.02
Message-ID: <20170701174431.62B6D81909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d233eec73fcc9d927d2a118cddb48afe9d24e9dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/p7zip/p7zip.hash | 8 +++++---
 package/p7zip/p7zip.mk   | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/p7zip/p7zip.hash b/package/p7zip/p7zip.hash
index ead6d87..b134550 100644
--- a/package/p7zip/p7zip.hash
+++ b/package/p7zip/p7zip.hash
@@ -1,3 +1,5 @@
-# From https://sourceforge.net/projects/p7zip/files/p7zip/
-md5	92cca093312b5a71a7be7dc7d1d32509	p7zip_15.14.1_src_all.tar.bz2
-sha1	9b15a79f94230fab9b9d4f9f532c723117145c7a	p7zip_15.14.1_src_all.tar.bz2
+# From https://sourceforge.net/projects/p7zip/files/p7zip/16.02/
+md5 a0128d661cfe7cc8c121e73519c54fbf  p7zip_16.02_src_all.tar.bz2
+sha1 e8819907132811aa1afe5ef296181d3a15cc8f22  p7zip_16.02_src_all.tar.bz2
+# Locally computed
+sha256 5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f  p7zip_16.02_src_all.tar.bz2
diff --git a/package/p7zip/p7zip.mk b/package/p7zip/p7zip.mk
index 1035a0d..ff0dd01 100644
--- a/package/p7zip/p7zip.mk
+++ b/package/p7zip/p7zip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-P7ZIP_VERSION = 15.14.1
+P7ZIP_VERSION = 16.02
 P7ZIP_SOURCE = p7zip_$(P7ZIP_VERSION)_src_all.tar.bz2
 P7ZIP_SITE = http://downloads.sourceforge.net/project/p7zip/p7zip/$(P7ZIP_VERSION)
 P7ZIP_LICENSE = LGPL-2.1+ with unRAR restriction
