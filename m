From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 22:52:07 +0100
Subject: [Buildroot] [git commit] libass: change tarball compression to xz
Message-ID: <20150304215223.8FD6F80F41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3468e72abb7b714203ce39c5fed938e56ef964da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libass/libass.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 2b734c8..056ea8b 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 LIBASS_VERSION = 0.10.2
+LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 LIBASS_SITE = http://libass.googlecode.com/files
 LIBASS_INSTALL_STAGING = YES
 LIBASS_LICENSE = ISC
