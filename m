From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Jun 2017 11:15:21 +0200
Subject: [Buildroot] [git commit] package/hans: bump version to 1.0
Message-ID: <20170605091751.65EE082158@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0263fcbf945c877f091b4bbb88c85af96ffae940
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added sha256 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/hans/hans.hash | 6 ++++--
 package/hans/hans.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/hans/hans.hash b/package/hans/hans.hash
index c1a28df..bde6a7a 100644
--- a/package/hans/hans.hash
+++ b/package/hans/hans.hash
@@ -1,3 +1,5 @@
 # From http://sourceforge.net/projects/hanstunnel/files/source/
-md5	97a93a886bc766212257198fd99d1061	hans-0.4.4.tar.gz
-sha1	8a21a9acc6d52cf7d2a5049523469e2609716ab3	hans-0.4.4.tar.gz
+md5 8628393ec1b61a6c3a47a0a3dcb455b3  hans-1.0.tar.gz
+sha1 0bc857df109af222732cb95c861a0f0a6dd53dee  hans-1.0.tar.gz
+# Locally computed
+sha256 f8f70cf22ba14d9223695c9e9a2d75289d8360f61f533b83ee538836f29a458e  hans-1.0.tar.gz
diff --git a/package/hans/hans.mk b/package/hans/hans.mk
index 5058581..e26c2f3 100644
--- a/package/hans/hans.mk
+++ b/package/hans/hans.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HANS_VERSION = 0.4.4
+HANS_VERSION = 1.0
 HANS_SITE = http://downloads.sourceforge.net/project/hanstunnel/source
 HANS_LICENSE = GPL-3.0+
 HANS_LICENSE_FILES = LICENSE
