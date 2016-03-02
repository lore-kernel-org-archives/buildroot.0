From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 02 Mar 2016 20:27:52 -0000
Subject: [Buildroot] [git commit] package/libass: bump version to 0.13.1
Message-ID: <20160302202751.D809080203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67c7fe48c947c9eb94a89fc3ea24e4ff61f78da8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
