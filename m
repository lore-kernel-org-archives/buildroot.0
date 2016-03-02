From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Mar 2016 23:47:29 +0100
Subject: [Buildroot] [git commit] nvme: fix legal-info
Message-ID: <20160302224733.98A1A81917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=720552dd28a00299da8a752bf13fb5446eda130a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/441/441afa17dfd6f259642526850d92f1c9965d8353/

The license file is called LICENSE, not COPYING.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nvme/nvme.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nvme/nvme.mk b/package/nvme/nvme.mk
index 8cb8863..7c4bd8e 100755
--- a/package/nvme/nvme.mk
+++ b/package/nvme/nvme.mk
@@ -7,7 +7,7 @@
 NVME_VERSION = v0.3
 NVME_SITE = $(call github,linux-nvme,nvme-cli,$(NVME_VERSION))
 NVME_LICENSE = GPLv2+
-NVME_LICENSE_FILES = COPYING
+NVME_LICENSE_FILES = LICENSE
 
 # LIBUDEV=1 means that libudev is _disabled_
 define NVME_BUILD_CMDS
