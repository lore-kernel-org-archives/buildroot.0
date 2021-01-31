From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 21:23:35 +0100
Subject: [Buildroot] [git commit] package/ser2net: bump version to 4.3.2
Message-ID: <20210131200347.80B0F83817@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=217035b5ed463ebc971cddfa113e1734df8d96a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ser2net/ser2net.hash | 6 +++---
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 2e67a860b1..32783213c6 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  19e9819e8c4e91ea56c455a3f0f7d2d5  ser2net-4.3.0.tar.gz
-sha1  dc84a43c4a96d021a6d4fc64fba1f1ba86732018  ser2net-4.3.0.tar.gz
+md5  ee74b7db3bdca09c18a4d0a5ef060c9c  ser2net-4.3.2.tar.gz
+sha1  196e954be4086d322ec9312c018cd2155ee601b8  ser2net-4.3.2.tar.gz
 # Locally computed:
-sha256  5e407d684d0aa0919ddd15af368f890c5940cddd6034b7efc363823f38f6ff0c  ser2net-4.3.0.tar.gz
+sha256  39d93bbaf53ae23c85ceef918b176b89c20b417c95c1797a5554f441334c42bf  ser2net-4.3.2.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 5dd64f5a4f..bf743239ea 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.3.0
+SER2NET_VERSION = 4.3.2
 SER2NET_SITE = https://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
