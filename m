From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Feb 2016 10:29:33 +0100
Subject: [Buildroot] [PATCH/next 1/4] package/libass: bump version to 0.13.1
Message-ID: <1455442176-31448-1-git-send-email-bernd.kuhls@t-online.de>
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
index 87d3f26..88f15f4 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	e0071a3b2e95411c8d474014678368e3f0b852f7d663e0564b344e7335eb0671	libass-0.13.0.tar.xz
+sha256	4aa36b1876a61cab46fc9284fee84224b9e2840fe7b3e63d96a8d32574343fe7	libass-0.13.1.tar.xz
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 2f0ca08..df0c7ae 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.13.0
+LIBASS_VERSION = 0.13.1
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
-- 
2.7.0
