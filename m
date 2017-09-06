From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 23:48:44 +0200
Subject: [Buildroot] [git commit] package/eudev: bump version to 3.2.3
Message-ID: <20170906214125.1A9ED8183A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b11bb084e6a4b7719d8eefc9ecc13a4f88c55e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/eudev/eudev.hash | 4 ++--
 package/eudev/eudev.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/eudev/eudev.hash b/package/eudev/eudev.hash
index cda1a8d..513dc7d 100644
--- a/package/eudev/eudev.hash
+++ b/package/eudev/eudev.hash
@@ -1,4 +1,4 @@
 # From http://dev.gentoo.org/~blueness/eudev/
-md5 41e19b70462692fefd072a3f38818b6e  eudev-3.2.2.tar.gz
+md5 1e91710d6c42f03f803108091be5878f  eudev-3.2.3.tar.gz
 # Locally calculated
-sha256 3e4c56ec2fc1854afd0a31f3affa48f922c62d40ee12a0c1a4b4f152ef5b0f63  eudev-3.2.2.tar.gz
+sha256 49200c54f63bb0ae922880a9bb64f360959fa83d272239b9cf72111dd53f444a  eudev-3.2.3.tar.gz
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index fdb4432..ff94078 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EUDEV_VERSION = 3.2.2
+EUDEV_VERSION = 3.2.3
 EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev
 EUDEV_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 EUDEV_LICENSE_FILES = COPYING
