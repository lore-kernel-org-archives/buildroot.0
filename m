From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jun 2017 17:09:04 +0200
Subject: [Buildroot] [git commit] package/libass: bump version to 0.13.6
Message-ID: <20170603151115.9642482859@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cf95051514d344dc29f0f2d9642e6af09d5b38ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libass/libass.hash | 2 +-
 package/libass/libass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index d1e9022..53fd79d 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 d84a2fc89011b99d87fc47af91906622707c165d1860e9f774825ebbbc9c9fb6  libass-0.13.4.tar.xz
+sha256 f8a874d104e3e72e2cc057e5a1710c650b10367486845a26e5ff28ed7a912c2d  libass-0.13.6.tar.xz
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 9fe967f..aeae86a 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.13.4
+LIBASS_VERSION = 0.13.6
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
