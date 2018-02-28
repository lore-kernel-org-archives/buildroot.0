From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Feb 2018 20:44:53 +0100
Subject: [Buildroot] [git commit] gnupg2: bump to version 2.2.5
Message-ID: <20180305200719.1CA6481199@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=379c34739082f3906ccf4877b85a2e714606bffe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/gnupg2.hash | 8 ++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index a003da668b..9cc8e4c913 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,6 +1,6 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2017q4/000419.html
-sha1 732266e8888c6f41c084d043c7a0058332ff3580  gnupg-2.2.4.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2018q1/000420.html
+sha1 9dec110397e460b3950943e18f5873a4f277f216  gnupg-2.2.5.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.4.tar.bz2.sig
-sha256 401a3e64780fdfa6d7670de0880aa5c9d589b3db7a7098979d7606cec546f2ec  gnupg-2.2.4.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.5.tar.bz2.sig
+sha256 3fa189a32d4fb62147874eb1389047c267d9ba088f57ab521cb0df46f08aef57  gnupg-2.2.5.tar.bz2
 sha256 bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 980fae342b..ba5370902f 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.4
+GNUPG2_VERSION = 2.2.5
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
