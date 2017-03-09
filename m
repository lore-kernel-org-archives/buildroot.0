From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Mar 2017 21:53:18 +0100
Subject: [Buildroot] [git commit] ti-uim: moved to github
Message-ID: <20170309205330.AFC478179C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c63b4ab877f6c9cd1690a005c382400ff13dae7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

gitorious.org is down. Use the github repo instead.

Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Acked-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ti-uim/ti-uim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-uim/ti-uim.mk b/package/ti-uim/ti-uim.mk
index b498180..1c78db0 100644
--- a/package/ti-uim/ti-uim.mk
+++ b/package/ti-uim/ti-uim.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TI_UIM_VERSION = c73894456df5def97111cb33d2106b684b8b7959
-TI_UIM_SITE = git://gitorious.org/uim/uim.git
+TI_UIM_SITE = $(call github,96boards,uim,$(TI_UIM_VERSION))
 TI_UIM_LICENSE = GPLv2+
 
 define TI_UIM_BUILD_CMDS
