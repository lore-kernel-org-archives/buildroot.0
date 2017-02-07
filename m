From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 07:40:46 +0100
Subject: [Buildroot] [git commit] libcec: remove LIBCEC_AUTORECONF variable
Message-ID: <20170207064344.3898081D9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=087f62898146c99b047aea06d2c80aeef37ddef4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcec is a cmake based package. LIBCEC_AUTORECONF is meaningless in
this context.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcec/libcec.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 1fe69ee..f00e10f 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -9,8 +9,6 @@ LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPLv2+
 LIBCEC_LICENSE_FILES = COPYING
 
-# Autoreconf required due to being a dev tarball and not a release tarball.
-LIBCEC_AUTORECONF = YES
 LIBCEC_INSTALL_STAGING = YES
 LIBCEC_DEPENDENCIES = host-pkgconf libplatform
 
