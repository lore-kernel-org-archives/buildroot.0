From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 12:09:28 +0200
Subject: [Buildroot] [git commit] xloader: add license information
Message-ID: <20120821110312.0D62297206@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bec669184a46de96ddc4d6c9184b56e2762b12c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/xloader/xloader.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

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
