From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jul 2017 23:59:32 +0200
Subject: [Buildroot] [git commit] nvme-cli: bump to version 1.3
Message-ID: <20170719070308.C89B1807C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a91b72753b102b1b567196f7f2e661f9d53a711b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nvme-cli had many bugfixes and improvements over the releases.
Buildroot still has version 0.3, so this patch bumps it to the
latest upstream release, version 1.3.

Signed-off-by: Guilherme G. Piccoli <gpiccoli@linux.vnet.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nvme/nvme.hash | 2 +-
 package/nvme/nvme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nvme/nvme.hash b/package/nvme/nvme.hash
index b299041..92e2bc0 100644
--- a/package/nvme/nvme.hash
+++ b/package/nvme/nvme.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 c631e90dd4d411cdb618b26bc36b06706e6f1f2d3db38874bcfe48f4bc15aac4 nvme-v0.3.tar.gz
+sha256 52eb45c9ef5a529580a3f6f9e02c067695675ac01b8ab8b8e0398c62e8a8646d nvme-v1.3.tar.gz
diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 66b3cef..27fbde2 100644
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NVME_VERSION = v0.3
+NVME_VERSION = v1.3
 NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
 NVME_LICENSE = GPL-2.0+
 NVME_LICENSE_FILES = LICENSE
