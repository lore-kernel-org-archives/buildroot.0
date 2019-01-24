From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 19:55:52 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] gnupg2: bump to version
 2.2.10
Message-ID: <20190124190126.458268E62F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2681514abfd9a16c031d4f2b620472358a6d7e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bf8e55fd08fd1ed55efa3d32c91ae71e43350038)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/gnupg2.hash | 9 +++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index f5890c5e2a..a367effcab 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,6 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q2/000425.html
-sha1 d87553a125832ea90e8aeb3ceeecf24f88de56fb  gnupg-2.2.8.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q3/000428.html
+sha1 3e87504e2ca317718aa9b6299947ebf7e906b54e  gnupg-2.2.10.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.8.tar.bz2.sig
-sha256 777b4cb8ced21965a5053d4fa20fe11484f0a478f3d011cef508a1a49db50dcd  gnupg-2.2.8.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.10.tar.bz2.sig
+# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
+sha256 799dd37a86a1448732e339bd20440f4f5ee6e69755f6fd7a73ee8af30840c915  gnupg-2.2.10.tar.bz2
 sha256 bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 3151860f37..64329522d5 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.8
+GNUPG2_VERSION = 2.2.10
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
