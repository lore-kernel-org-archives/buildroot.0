From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jul 2015 15:36:52 +0200
Subject: [Buildroot] [git commit] c-periphery: bump version to 1.0.3
Message-ID: <20150708134044.517A9818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4f73fba92cb8f8eaadad90c95f2fdcf72040d73f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-periphery/c-periphery.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/c-periphery/c-periphery.mk b/package/c-periphery/c-periphery.mk
index 68193d7..730b3bc 100644
--- a/package/c-periphery/c-periphery.mk
+++ b/package/c-periphery/c-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_PERIPHERY_VERSION = 0fdfac3264f1dce32991f4ec30d084e34b35181d
+C_PERIPHERY_VERSION = v1.0.3
 C_PERIPHERY_SITE = $(call github,vsergeev,c-periphery,$(C_PERIPHERY_VERSION))
 C_PERIPHERY_INSTALL_STAGING = YES
 # only a static library
