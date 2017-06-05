From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jun 2017 11:54:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/libass: bump version to 0.13.7
Message-ID: <20170605095451.8541-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libass/libass.hash | 2 +-
 package/libass/libass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index 53fd79da4..d98b163f3 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 f8a874d104e3e72e2cc057e5a1710c650b10367486845a26e5ff28ed7a912c2d  libass-0.13.6.tar.xz
+sha256 7065e5f5fb76e46f2042a62e7c68d81e5482dbeeda24644db1bd066e44da7e9d  libass-0.13.7.tar.xz
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index aeae86a89..41f027d4c 100644
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
-- 
2.11.0
