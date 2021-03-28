From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:47:17 +0200
Subject: [Buildroot] [git commit] package/netopeer2: bump version to 1.1.70
Message-ID: <20210328202237.76CD38A4B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1a1ba25e6484037ecbe3c22940ecd845397f484b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netopeer2/netopeer2.hash | 2 +-
 package/netopeer2/netopeer2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index 801c353e11..4386e5661c 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6b43026211a787d5cb91d47cb7fdd7923649044c55f264aaf85bf5676c004211  netopeer2-1.1.53.tar.gz
+sha256  7fc1a3520ee4bb488112f502e34cea465464dc933d2a5742a72eb32a6dfe3b3f  netopeer2-1.1.70.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index be5ffd2be7..c9fa097606 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 1.1.53
+NETOPEER2_VERSION = 1.1.70
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
