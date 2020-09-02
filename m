From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 02 Sep 2020 16:24:35 -0000
Subject: [Buildroot] [git commit] package/ser2net: bump to version 4.2.1
Message-ID: <20200902161635.45CF485EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=64c2733088c06ff6d348d394357a98f115c1edac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ser2net/ser2net.hash | 6 +++---
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 359ab98ed3..1f108418e2 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  eb08bf2822d5c4293f798d9d8f3c1b66  ser2net-4.1.8.tar.gz
-sha1  e3538f37b99f33a417c34e7b98eb9423262ff19a  ser2net-4.1.8.tar.gz
+md5  db112efce759e70caf91765fa47920fa  ser2net-4.2.1.tar.gz
+sha1  2f406a209c4a93544146e338ae92b938c421493a  ser2net-4.2.1.tar.gz
 # Locally computed:
-sha256  cffb5147021202b064eb0a9389d0db63d1bb2dcde5a896f7785f97b1b5f51a72  ser2net-4.1.8.tar.gz
+sha256  a0d84c71a6bc75d73737461708f964084c6bbfe0cc1ef4725b4cd9cc35de14c0  ser2net-4.2.1.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 861f954f76..3589e813c8 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.1.8
+SER2NET_VERSION = 4.2.1
 SER2NET_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
