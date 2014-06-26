From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:48 -0300
Subject: [Buildroot] [PATCH 20/53] input-tools: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-20-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/input-tools/input-tools.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

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
-- 
1.8.5.5
