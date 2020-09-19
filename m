From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 21:55:14 +0200
Subject: [Buildroot] [git commit] package/sunxi-tools: bump to version 1.4.2
Message-ID: <20200919194742.668018B86B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aaf909aa263f5bb2fe260fb43d59114ba5e2bd47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-tools/sunxi-tools.hash | 2 +-
 package/sunxi-tools/sunxi-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sunxi-tools/sunxi-tools.hash b/package/sunxi-tools/sunxi-tools.hash
index 2de26c418b..84acc2c76c 100644
--- a/package/sunxi-tools/sunxi-tools.hash
+++ b/package/sunxi-tools/sunxi-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  da5d762608517b4b2e9bd392bd9a63afae3973d9c8264cbcfb757ddac8120d1b  sunxi-tools-1.4.1.tar.gz
+sha256  81f48014a520cb83cac4e17f5ae627a637c4d6a422b60c693c5a705c92e43822  sunxi-tools-1.4.2.tar.gz
 sha256  2b0d4dda4bf8034e1506507a67f80f982131137afe62bf144d248f9faea31da4  LICENSE.md
diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index 35254263cf..c2913ee8f7 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_TOOLS_VERSION = 1.4.1
+SUNXI_TOOLS_VERSION = 1.4.2
 SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,v$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPL-2.0+
 SUNXI_TOOLS_LICENSE_FILES = LICENSE.md
