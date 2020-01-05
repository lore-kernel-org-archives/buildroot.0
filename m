From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 Jan 2020 21:29:22 +0100
Subject: [Buildroot] [git commit] package/gnupg2: bump version to 2.2.19
Message-ID: <20200105202818.D3DE68ECC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bcb6d0057fb8e5674b6e76fc0c7f38cdcf3ef89d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
- 2.2.18
  https://lists.gnupg.org/pipermail/gnupg-announce/2019q4/000442.html
- 2.2.19
  https://lists.gnupg.org/pipermail/gnupg-announce/2019q4/000443.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/gnupg2.hash | 8 ++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 806a07b840..2dee44283b 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2019q3/000439.html
-sha1 12c1cee8871c03f0315fc8f27876364b75c95b12  gnupg-2.2.17.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2019q4/000443.html
+sha1 e24a1208ffe69d7436b2f27e99542a85f34d0ac0  gnupg-2.2.19.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.17.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.19.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256 afa262868e39b651a2db4c071fba90415154243e83a830ca00516f9a807fd514  gnupg-2.2.17.tar.bz2
+sha256 242554c0e06f3a83c420b052f750b65ead711cc3fddddb5e7274fcdbb4e9dec0  gnupg-2.2.19.tar.bz2
 sha256 bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index aa1f7b14d6..28e946b400 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.17
+GNUPG2_VERSION = 2.2.19
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
