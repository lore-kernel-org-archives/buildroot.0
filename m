From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 14:29:35 +0200
Subject: [Buildroot] [git commit] libgcrypt: bump version to 1.7.2
Message-ID: <20160715122955.E231C80280@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7663007378c87b17bc22738222879499febda6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgcrypt/libgcrypt.hash | 6 +++---
 package/libgcrypt/libgcrypt.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.hash b/package/libgcrypt/libgcrypt.hash
index 272d332..63148d4 100644
--- a/package/libgcrypt/libgcrypt.hash
+++ b/package/libgcrypt/libgcrypt.hash
@@ -1,4 +1,4 @@
-# From https://lists.gnupg.org/pipermail/gnupg-announce/2016q1/000384.html
-sha1	c3a5a13e717f7b3e3895650afc1b6e0d3fe9c726	libgcrypt-1.6.5.tar.bz2
+# From https://lists.gnupg.org/pipermail/gnupg-announce/2016q3/000392.html
+sha1 85a6a936bcab4c3c05f5efbf6ce847f23d35c0c4  libgcrypt-1.7.2.tar.bz2
 # Calculated based on the hash above
-sha256	f49ebc5842d455ae7019def33eb5a014a0f07a2a8353dc3aa50a76fd1dafa924	libgcrypt-1.6.5.tar.bz2
+sha256 3d35df906d6eab354504c05d749a9b021944cb29ff5f65c8ef9c3dd5f7b6689f  libgcrypt-1.7.2.tar.bz2
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 7c27a22..5eb54a4 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGCRYPT_VERSION = 1.6.5
+LIBGCRYPT_VERSION = 1.7.2
 LIBGCRYPT_SOURCE = libgcrypt-$(LIBGCRYPT_VERSION).tar.bz2
 LIBGCRYPT_LICENSE = LGPLv2.1+
 LIBGCRYPT_LICENSE_FILES = COPYING.LIB
