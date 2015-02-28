From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Feb 2015 13:04:04 +0100
Subject: [Buildroot] [git commit] gnupg: security bump to version 1.4.19
Message-ID: <20150228120508.51AE2805E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6997c8e4c93ab4385c666d982d573f5e6f641fe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2014-3591 - Use ciphertext blinding for Elgamal decryption
CVE-2015-0837 - Fixed data-dependent timing variations in modular
exponentiation.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnupg/gnupg.hash |    4 ++--
 package/gnupg/gnupg.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnupg/gnupg.hash b/package/gnupg/gnupg.hash
index d6733f5..ba38d38 100644
--- a/package/gnupg/gnupg.hash
+++ b/package/gnupg/gnupg.hash
@@ -1,2 +1,2 @@
-# Locally calculated after checking pgp signature
-sha256	b7b5fdda78849955e0cdbc5a085f3a08f8b7fba126c622085debb62def5d6388	gnupg-1.4.18.tar.bz2
+# From http://lists.gnupg.org/pipermail/gnupg-announce/2015q1/000363.html
+sha1	5503f7faa0a0e84450838706a67621546241ca50	gnupg-1.4.19.tar.bz2
diff --git a/package/gnupg/gnupg.mk b/package/gnupg/gnupg.mk
index c0bf88c..94f5d89 100644
--- a/package/gnupg/gnupg.mk
+++ b/package/gnupg/gnupg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG_VERSION = 1.4.18
+GNUPG_VERSION = 1.4.19
 GNUPG_SOURCE = gnupg-$(GNUPG_VERSION).tar.bz2
 GNUPG_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG_LICENSE = GPLv3+
