From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Aug 2018 23:28:32 +0200
Subject: [Buildroot] [git commit branch/next] package/sylpheed: bump version
 to 3.7.0
Message-ID: <20180819212111.E58C78D6EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a869884f498274588adaf8076ff6b1d8efe0ac0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Added license hashes, switched to xz tarball.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sylpheed/sylpheed.hash | 4 +++-
 package/sylpheed/sylpheed.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/sylpheed/sylpheed.hash b/package/sylpheed/sylpheed.hash
index 39c0927735..08a5d0a221 100644
--- a/package/sylpheed/sylpheed.hash
+++ b/package/sylpheed/sylpheed.hash
@@ -1,2 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	4aeb7c6436ad485a2cc101dd68a1fb84abcad4c6471ed9ddefec65e482e5b2b1	sylpheed-3.2.0.tar.bz2
+sha256 0d6bc5eb46f5d0a463757c62bc80b00d219b294b3c3662840e4540f6db2e3e49  sylpheed-3.7.0.tar.xz
+sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
+sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING.LIB
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 14107f0a6a..0453fba521 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SYLPHEED_VERSION_MAJOR = 3.2
+SYLPHEED_VERSION_MAJOR = 3.7
 SYLPHEED_VERSION = $(SYLPHEED_VERSION_MAJOR).0
-SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
+SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.xz
 SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v$(SYLPHEED_VERSION_MAJOR)
 SYLPHEED_LICENSE = GPL-2.0+ (executables), LGPL-2.1+ (library, attachment plugin)
 SYLPHEED_LICENSE_FILES = COPYING COPYING.LIB
