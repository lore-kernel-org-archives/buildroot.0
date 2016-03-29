From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 03:10:26 +0200
Subject: [Buildroot] [git commit] package/x265: bump version to 1.9
Message-ID: <20160329011110.742517FB80@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a24d9ccf41e4645595e022d726d7fa9a72fa6cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x265/x265.hash | 2 +-
 package/x265/x265.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x265/x265.hash b/package/x265/x265.hash
index 714ec2a..92b5bea 100644
--- a/package/x265/x265.hash
+++ b/package/x265/x265.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 760e6280c688f1ea90c492d19fc6d4084ca1c4b0ea9b2e3c736d32565c30d857 x265_1.8.tar.gz
+sha256	3e4654133ed957a98708fdb4cb9a154d9e80922b84e26e43fc462a101c5b15c8	x265_1.9.tar.gz
diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 45c86f1..e737c31 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-X265_VERSION = 1.8
+X265_VERSION = 1.9
 X265_SOURCE = x265_$(X265_VERSION).tar.gz
 X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 X265_LICENSE = GPLv2+
