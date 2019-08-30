From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 30 Aug 2019 09:18:01 +0200
Subject: [Buildroot] [git commit branch/next] package/tinc: bump to 1.0.36
Message-ID: <20190830071504.10775885E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1cf3b163ed1021dfaefa0f4ab3571a0ce418f7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update the COPYING hash, since the copyright year was updated:

-Copyright (C) 1998-2018 Ivo Timmermans, Guus Sliepen and others.
+Copyright (C) 1998-2019 Ivo Timmermans, Guus Sliepen and others.

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
[Thomas: update license file hash]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tinc/tinc.hash | 4 ++--
 package/tinc/tinc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tinc/tinc.hash b/package/tinc/tinc.hash
index 0daeb324e9..5bd7aa2b1f 100644
--- a/package/tinc/tinc.hash
+++ b/package/tinc/tinc.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  18c83b147cc3e2133a7ac2543eeb014d52070de01c7474287d3ccecc9b16895e tinc-1.0.35.tar.gz
-sha256  3a112fd37b47d624e89b130d0e158bb8d14ec5bc9ecf5f18b448d2c07626e43d COPYING
+sha256  40f73bb3facc480effe0e771442a706ff0488edea7a5f2505d4ccb2aa8163108 tinc-1.0.36.tar.gz
+sha256  3b37ffbf3459f2aceeef169aa65ee8b111ac1f8ba24a2a1b90b079678a9c7faa COPYING
 sha256  9bf76a8aa304d807df20bf3d221c21d259764be63e39b58f299b80ba3ac14b5b COPYING.README
diff --git a/package/tinc/tinc.mk b/package/tinc/tinc.mk
index ae7ce97bfa..56a26e9a55 100644
--- a/package/tinc/tinc.mk
+++ b/package/tinc/tinc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINC_VERSION = 1.0.35
+TINC_VERSION = 1.0.36
 TINC_SITE = http://www.tinc-vpn.org/packages
 TINC_DEPENDENCIES = lzo openssl zlib
 TINC_LICENSE = GPL-2.0+ with OpenSSL exception
