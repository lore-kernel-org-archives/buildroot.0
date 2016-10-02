From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Oct 2016 16:18:36 +0200
Subject: [Buildroot] [git commit] package/libass: bump version to 0.13.3
Message-ID: <20161002142217.493817F984@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f34f025c01ffc806ae7dc769e076d733005a0506
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libass/libass.hash | 2 +-
 package/libass/libass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index 5dddc40..cb5016d 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256	d698d0a6adca7c36c5a86b540d67b05bfd36cebc3c351ab7646497c43fe1face	libass-0.13.2.tar.xz
+sha256 a641b653d7c9f2f3b9d6a5e5a906a004ac3e110487ad485d9dd029e944bb3f6d  libass-0.13.3.tar.xz
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 716bca6..0e296ca 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.13.2
+LIBASS_VERSION = 0.13.3
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
