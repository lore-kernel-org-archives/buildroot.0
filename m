From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 12:12:38 +0200
Subject: [Buildroot] [git commit] package/libsquish: bump version to 1.15
Message-ID: <20170429101427.62890827B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=374e39df819598a0049a9c485ce5b2adbe2c90a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added md5 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsquish/libsquish.hash | 3 ++-
 package/libsquish/libsquish.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libsquish/libsquish.hash b/package/libsquish/libsquish.hash
index caa7198..e68d28d 100644
--- a/package/libsquish/libsquish.hash
+++ b/package/libsquish/libsquish.hash
@@ -1,2 +1,3 @@
 # From http://sourceforge.net/projects/libsquish/files
-sha1	7bcdd7d0f0460a29e25dcdab8dc41a30e58bb366	libsquish-1.13.tgz
+sha1 51844b9a8bc815a27e2cc0ffbede5fee3ef75110 libsquish-1.15.tgz
+md5 c02645800131e55b519ff8dbe7284f93 libsquish-1.15.tgz
diff --git a/package/libsquish/libsquish.mk b/package/libsquish/libsquish.mk
index 73f8de9..a707355 100644
--- a/package/libsquish/libsquish.mk
+++ b/package/libsquish/libsquish.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSQUISH_VERSION = 1.13
+LIBSQUISH_VERSION = 1.15
 LIBSQUISH_SOURCE = libsquish-$(LIBSQUISH_VERSION).tgz
 LIBSQUISH_SITE = http://downloads.sourceforge.net/project/libsquish
 LIBSQUISH_INSTALL_STAGING = YES
