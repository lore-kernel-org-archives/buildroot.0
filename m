From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 22:58:29 +0200
Subject: [Buildroot] [git commit] sunxi-tools: bump version
Message-ID: <20140420210331.8A5149BEC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eb5e8d6ee2ec67b0bc013481aff7c1940dbd4b30
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brian Beattie <beattie@beattie-home.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sunxi-tools/sunxi-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index a6c38d9..f84b286 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SUNXI_TOOLS_VERSION = 3a94e721dd8d1e13d0b25da0a83463891e8e9ee0
+SUNXI_TOOLS_VERSION = ed6f7969d80b91048b0ed95ccb61cc98f46fead7
 SUNXI_TOOLS_SITE = $(call github,linux-sunxi,sunxi-tools,$(SUNXI_TOOLS_VERSION))
 SUNXI_TOOLS_LICENSE = GPLv2+
 SUNXI_TOOLS_LICENSE_FILES = COPYING
