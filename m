From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 23:09:06 +0200
Subject: [Buildroot] [git commit] sunxi-tools: fix github tarball to use
	commit id
Message-ID: <20130606211259.229A49A9A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63c39b52ce3cfacf12071e8d76a5a30c57fe54d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sunxi-tools/sunxi-tools.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sunxi-tools/sunxi-tools.mk b/package/sunxi-tools/sunxi-tools.mk
index 8f1ae28..d47574c 100644
--- a/package/sunxi-tools/sunxi-tools.mk
+++ b/package/sunxi-tools/sunxi-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 SUNXI_TOOLS_VERSION = 3a94e721dd8d1e13d0b25da0a83463891e8e9ee0
-SUNXI_TOOLS_SITE = http://github.com/linux-sunxi/sunxi-tools/tarball/master
+SUNXI_TOOLS_SITE = http://github.com/linux-sunxi/sunxi-tools/tarball/$(SUNXI_TOOLS_VERSION)
 SUNXI_TOOLS_LICENSE = GPLv2+
 SUNXI_TOOLS_LICENSE_FILES = COPYING
 HOST_SUNXI_TOOLS_DEPENDENCIES = host-libusb
