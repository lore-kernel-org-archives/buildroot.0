From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jul 2013 21:06:48 +0200
Subject: [Buildroot] [git commit] cpanminus: bump to version 1.6109
Message-ID: <20130726190800.55FBC82E01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca574ced3bfd1a874d5f9e90f0f85ed703559c78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cpanminus/cpanminus.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cpanminus/cpanminus.mk b/package/cpanminus/cpanminus.mk
index a2cd44b..60a72ee 100644
--- a/package/cpanminus/cpanminus.mk
+++ b/package/cpanminus/cpanminus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPANMINUS_VERSION = 1.6002
+CPANMINUS_VERSION = 1.6109
 CPANMINUS_SOURCE = $(CPANMINUS_VERSION).tar.gz
 CPANMINUS_SITE = https://github.com/miyagawa/cpanminus/archive
 CPANMINUS_DEPENDENCIES = host-qemu perl $(call qstrip,$(BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES))
