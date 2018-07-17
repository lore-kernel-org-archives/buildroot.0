From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 17 Jul 2018 09:20:11 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] gnupg2: security bump to
 version 2.2.8
Message-ID: <20180717072759.E928088706@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a1d6db9af11071b6d343a41eb40468fa5e96fdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Fixes CVE-2018-12020: Unsanitized file names might cause injection of
terminal control characters into the status output of gnupg.

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b78a365b56eeb57030b8e3ca98c23dddfc416820)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/gnupg2.hash | 8 ++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index f5cc95cb1b..f5890c5e2a 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,6 +1,6 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q2/000424.html
-sha1 e222cda63409a86992369df8976f6c7511e10ea0  gnupg-2.2.7.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q2/000425.html
+sha1 d87553a125832ea90e8aeb3ceeecf24f88de56fb  gnupg-2.2.8.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.7.tar.bz2.sig
-sha256 d95b361ee6ef7eff86af40c8c72bf9313736ac9f7010d6604d78bf83818e976e  gnupg-2.2.7.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.8.tar.bz2.sig
+sha256 777b4cb8ced21965a5053d4fa20fe11484f0a478f3d011cef508a1a49db50dcd  gnupg-2.2.8.tar.bz2
 sha256 bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 0823921b0b..3151860f37 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.7
+GNUPG2_VERSION = 2.2.8
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
