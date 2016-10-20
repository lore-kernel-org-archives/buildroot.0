From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 21:34:22 +0200
Subject: [Buildroot] [git commit] libgpgme: bump to version 1.7.1
Message-ID: <20161020193500.5C09D7FEC7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=114d1f7729ffe9d4e0c4b858fd00a953001af4c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgpgme/libgpgme.hash | 2 +-
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 9b96fd2..5ef7b0e 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	71f55fed0f2b3eaf7a606e59772aa645ce3ffff322d361ce359951b3f755cc48	gpgme-1.7.0.tar.bz2
+sha256	d0abe1449395315eac37e4e45076bbb82732cedf94210937b37776e10cdc2bb6	gpgme-1.7.1.tar.bz2
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index c581a3c..84f4d22 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.7.0
+LIBGPGME_VERSION = 1.7.1
 LIBGPGME_SITE = ftp://ftp.gnupg.org/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPLv2.1+
