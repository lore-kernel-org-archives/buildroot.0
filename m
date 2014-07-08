From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jul 2014 00:04:34 +0200
Subject: [Buildroot] [git commit] linux-fusion: add license information
Message-ID: <20140708222428.0F4D99D1CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bac1a96b22c3a3e8c2cbca607a83460c243ff2c2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: license is GPLv2+]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-fusion/linux-fusion.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 635e07f..c1b03ef 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -8,6 +8,8 @@ LINUX_FUSION_VERSION = 9.0.2
 LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 LINUX_FUSION_INSTALL_STAGING = YES
 LINUX_FUSION_DEPENDENCIES = linux
+LINUX_FUSION_LICENSE = GPLv2+
+LINUX_FUSION_LICENSE_FILES = debian/copyright
 
 LINUX_FOR_FUSION=$(LINUX_VERSION_PROBED)
 LINUX_FUSION_ETC_DIR=$(TARGET_DIR)/etc/udev/rules.d
