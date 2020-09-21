From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Sep 2020 22:39:10 +0200
Subject: [Buildroot] [git commit] package/ser2net: bump to version 4.2.2
Message-ID: <20200921203840.3EE6082650@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80aebd343ee6ef4ec812486c24b11fe95bf6d9fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ser2net/ser2net.hash | 6 +++---
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 1f108418e2..fd2761075b 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  db112efce759e70caf91765fa47920fa  ser2net-4.2.1.tar.gz
-sha1  2f406a209c4a93544146e338ae92b938c421493a  ser2net-4.2.1.tar.gz
+md5  7c0a47bd9b405aedac136c4e290ebfeb  ser2net-4.2.2.tar.gz
+sha1  64e77d3194bbbac6e7e9d5810d06b6ade7bfdcf4  ser2net-4.2.2.tar.gz
 # Locally computed:
-sha256  a0d84c71a6bc75d73737461708f964084c6bbfe0cc1ef4725b4cd9cc35de14c0  ser2net-4.2.1.tar.gz
+sha256  60e2aab04c4a346447a7e58e308a830fb74bac208a021229c113fc8ccc7bdfe6  ser2net-4.2.2.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 3589e813c8..868d7f3a1d 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.2.1
+SER2NET_VERSION = 4.2.2
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
