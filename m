From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Oct 2015 21:26:05 +0100
Subject: [Buildroot] [git commit] liblockfile: bump to version 1.0.9-6
Message-ID: <20151026202653.225E37FCAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e12be0b3759b00f0e17cfc064cf9e49060fd2949
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liblockfile/liblockfile.hash |    6 +++---
 package/liblockfile/liblockfile.mk   |    8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/liblockfile/liblockfile.hash b/package/liblockfile/liblockfile.hash
index 7f7ee7f..4421673 100644
--- a/package/liblockfile/liblockfile.hash
+++ b/package/liblockfile/liblockfile.hash
@@ -1,3 +1,3 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/libl/liblockfile/liblockfile_1.08-4.dsc
-sha256	d63293d5091d7fdc0259563694e4d68771310dbc4e70e188e6b68e7a776405cb	liblockfile_1.08.orig.tar.gz
-sha256	e1343c37b83722abdaa1b5d98e1696748ca134ad36752b8affebebd51ef78468	liblockfile_1.08-4.debian.tar.bz2
+# From http://snapshot.debian.org/archive/debian/20151026T153523Z/pool/main/libl/liblockfile/liblockfile_1.09-6.dsc
+sha256	16979eba05396365e1d6af7100431ae9d32f9bc063930d1de66298a0695f1b7f	liblockfile_1.09.orig.tar.gz
+sha256	d45eacb7c637c16d03c777c55989d98da494ae9584a0783fe6dbf0db60fa290f	liblockfile_1.09-6.debian.tar.bz2
diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 4f7a67e..8de598f 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-LIBLOCKFILE_VERSION = 1.08
+LIBLOCKFILE_VERSION = 1.09
 LIBLOCKFILE_SOURCE = liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
-LIBLOCKFILE_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/libl/liblockfile
-LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-4.debian.tar.bz2
+LIBLOCKFILE_SITE = http://snapshot.debian.org/archive/debian/20151026T153523Z/pool/main/libl/liblockfile
+LIBLOCKFILE_PATCH = liblockfile_$(LIBLOCKFILE_VERSION)-6.debian.tar.bz2
 
 LIBLOCKFILE_LICENSE = LGPLv2+, dotlockfile GPLv2+
-# No license file included, it refers to the gnu.org website
+LIBLOCKFILE_LICENSE_FILES = COPYRIGHT
 
 LIBLOCKFILE_INSTALL_STAGING = YES
 LIBLOCKFILE_CONF_OPTS = --mandir=/usr/share/man
