From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sat, 18 Aug 2012 10:25:41 +0100
Subject: [Buildroot] [PATCH 5/5] xloader: add license information
In-Reply-To: <1345281941-6722-1-git-send-email-spdawson@gmail.com>
References: <1345281941-6722-1-git-send-email-spdawson@gmail.com>
Message-ID: <1345281941-6722-5-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 boot/xloader/xloader.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/xloader/xloader.mk b/boot/xloader/xloader.mk
index fbdba02..b15d9b9 100644
--- a/boot/xloader/xloader.mk
+++ b/boot/xloader/xloader.mk
@@ -7,6 +7,9 @@ XLOADER_VERSION    = 6f3a26101303051e0f91b6213735b68ce804e94e
 XLOADER_SITE       = git://gitorious.org/x-loader/x-loader.git
 XLOADER_BOARD_NAME = $(call qstrip,$(BR2_TARGET_XLOADER_BOARDNAME))
 
+XLOADER_LICENSE = GPLv2+
+XLOADER_LICENSE_FILES = README
+
 XLOADER_INSTALL_IMAGES = YES
 
 define XLOADER_BUILD_CMDS
-- 
1.7.9.5
