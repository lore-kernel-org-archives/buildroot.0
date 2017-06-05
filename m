From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 16:07:55 +0200
Subject: [Buildroot] [git commit] package/libass: bump version to 0.13.7
Message-ID: <20170605140803.323B9825D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b305185495087c2c5c28fd01a9e48b535640791a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libass/libass.hash | 2 +-
 package/libass/libass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index 53fd79d..d98b163 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f8a874d104e3e72e2cc057e5a1710c650b10367486845a26e5ff28ed7a912c2d  libass-0.13.6.tar.xz
+sha256 7065e5f5fb76e46f2042a62e7c68d81e5482dbeeda24644db1bd066e44da7e9d  libass-0.13.7.tar.xz
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index aeae86a..41f027d 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.13.6
+LIBASS_VERSION = 0.13.7
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
