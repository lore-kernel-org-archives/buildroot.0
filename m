From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:27:26 +0200
Subject: [Buildroot] [git commit] input-tools: add license information
Message-ID: <20140701224921.B60E49D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4c401027c3deac1a85cfa2721b165b492f36aa0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/input-tools/input-tools.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/input-tools/input-tools.mk b/package/input-tools/input-tools.mk
index 7c3fe4e..ae3f7d2 100644
--- a/package/input-tools/input-tools.mk
+++ b/package/input-tools/input-tools.mk
@@ -5,9 +5,11 @@
 ################################################################################
 
 INPUT_TOOLS_VERSION = 20051019
-INPUT_TOOLS_SOURCE  = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
-INPUT_TOOLS_PATCH   = joystick_$(INPUT_TOOLS_VERSION)-5.diff.gz
-INPUT_TOOLS_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/joystick/
+INPUT_TOOLS_SOURCE = joystick_$(INPUT_TOOLS_VERSION).orig.tar.gz
+INPUT_TOOLS_PATCH = joystick_$(INPUT_TOOLS_VERSION)-5.diff.gz
+INPUT_TOOLS_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/joystick/
+INPUT_TOOLS_LICENSE = GPLv2+
+INPUT_TOOLS_LICENSE_FILES = utils/Makefile
 
 INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_INPUTATTACH) += inputattach
 INPUT_TOOLS_TARGETS_$(BR2_PACKAGE_INPUT_TOOLS_JSCAL)       += jscal
