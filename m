From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 19:58:59 +0100
Subject: [Buildroot] [git commit] libconfuse: bump version
Message-ID: <20141101185927.0A92DB2AFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56a902f40ed10c757b91d073ea9092ba33dc29b1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tag v2.7 is from 2010, no release has been since then and a few
changes have been made, notably a LICENSE file was added.

[Thomas: fix minor typos in commit log.]

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libconfuse/libconfuse.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 61b233c..b3dcceb 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-LIBCONFUSE_VERSION = V2_7
+LIBCONFUSE_VERSION = 9413a82f9cb56a94f71fa420f146e841c5372ed8
 LIBCONFUSE_SITE = $(call github,martinh,libconfuse,$(LIBCONFUSE_VERSION))
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPTS = --disable-rpath
 LIBCONFUSE_DEPENDENCIES = host-flex
 LIBCONFUSE_LICENSE = ISC
-LIBCONFUSE_LICENSE_FILES = src/confuse.c
+LIBCONFUSE_LICENSE_FILES = LICENSE
 
 # Fresh from the repository, no configure et al.
 LIBCONFUSE_AUTORECONF = YES
