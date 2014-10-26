From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:19 +0100
Subject: [Buildroot] [PATCH 13/51] libconfuse: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-13-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The tag v2.7 is from 2010, no release has been since then and a few
changes has been mode, notably a LICENSE file was added.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/libconfuse/libconfuse.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
2.1.1
