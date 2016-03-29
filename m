From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Mar 2016 22:29:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/libass: bump version to 0.13.2
Message-ID: <1459283354-30813-1-git-send-email-bernd.kuhls@t-online.de>
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
index 88f15f4..5dddc40 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	4aa36b1876a61cab46fc9284fee84224b9e2840fe7b3e63d96a8d32574343fe7	libass-0.13.1.tar.xz
+sha256	d698d0a6adca7c36c5a86b540d67b05bfd36cebc3c351ab7646497c43fe1face	libass-0.13.2.tar.xz
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index df0c7ae..716bca6 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.13.1
+LIBASS_VERSION = 0.13.2
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
-- 
2.8.0.rc3
