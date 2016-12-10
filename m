From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 21:40:48 +0100
Subject: [Buildroot] [git commit] package/libass: bump version to 0.13.4
Message-ID: <20161210204132.A5A5B818E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc90a56c70d7dce1f61fb1d03ecf64417adee7b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libass/libass.hash | 2 +-
 package/libass/libass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index cb5016d..d1e9022 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 a641b653d7c9f2f3b9d6a5e5a906a004ac3e110487ad485d9dd029e944bb3f6d  libass-0.13.3.tar.xz
+sha256 d84a2fc89011b99d87fc47af91906622707c165d1860e9f774825ebbbc9c9fb6  libass-0.13.4.tar.xz
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 0e296ca..9fe967f 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.13.3
+LIBASS_VERSION = 0.13.4
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
