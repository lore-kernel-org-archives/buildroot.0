From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Jul 2019 23:37:24 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/gnupg2: security
 bump to version 2.2.17
Message-ID: <20190731213444.E23C1883A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3950c81da0a25e84a3dfb896e9a6ddf020776155
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

This release mitigates the effects of the denial-of-service attacks on
the keyserver network (CVE-2019-13050).

https://gist.github.com/rjhansen/67ab921ffb4084c865b3618d6955275f
https://access.redhat.com/articles/4264021

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 410e8a5977130b40cc93bf30aea8329859d60cef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg2/gnupg2.hash | 8 ++++----
 package/gnupg2/gnupg2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index a9b7d10f67..806a07b840 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2019q1/000434.html
-sha1 66ebc053e2d22f743673d3fbe54453774e4fac58  gnupg-2.2.13.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2019q3/000439.html
+sha1 12c1cee8871c03f0315fc8f27876364b75c95b12  gnupg-2.2.17.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.13.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.17.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256 76c787a955f9e6e0ead47c9be700bfb9d454f955a7b7c7e697aa719bac7b11d8  gnupg-2.2.13.tar.bz2
+sha256 afa262868e39b651a2db4c071fba90415154243e83a830ca00516f9a807fd514  gnupg-2.2.17.tar.bz2
 sha256 bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index ca6b6293e7..aa1f7b14d6 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.13
+GNUPG2_VERSION = 2.2.17
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
