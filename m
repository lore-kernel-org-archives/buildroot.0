From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:22:00 +0200
Subject: [Buildroot] [git commit] package/nvme: bump to version 1.12
Message-ID: <20200919122224.96E928230F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bdb2bccfb742001ecb47c139b847e6d6f7d5502e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nvme/nvme.hash | 4 ++--
 package/nvme/nvme.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nvme/nvme.hash b/package/nvme/nvme.hash
index 94aefb2ff9..a7ce51ca74 100644
--- a/package/nvme/nvme.hash
+++ b/package/nvme/nvme.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 d7c3d56f36f81c0933f7b7c3f90c4196be0fec758affc8062c525b6bc5ea65f5 nvme-1.9.tar.gz
-sha256 a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753 LICENSE
+sha256  a75270e65a4a7a6add48f748ba216d8f68d78f90f8cb77e88e9753b74d527991  nvme-1.12.tar.gz
+sha256  a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753  LICENSE
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 5a7c634e3c..678b978211 100644
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVME_VERSION = 1.9
+NVME_VERSION = 1.12
 NVME_SITE = $(call github,linux-nvme,nvme-cli,v$(NVME_VERSION))
 NVME_LICENSE = GPL-2.0+
 NVME_LICENSE_FILES = LICENSE
