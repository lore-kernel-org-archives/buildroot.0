From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 26 Feb 2013 22:46:42 +0100
Subject: [Buildroot] [git commit] linux-fusion: bump to 9.0.0
Message-ID: <20130226222004.462BD9AD76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=208b36a234fe3bf1c02ad8ea1dcb45b4a378d260
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://bugs.busybox.net/show_bug.cgi?id=5960

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: broot at monkster.hopto.org
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-fusion/linux-fusion.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index 5ea7900..a2340bd 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -3,7 +3,7 @@
 # linux-fusion
 #
 #############################################################
-LINUX_FUSION_VERSION = 8.10.4
+LINUX_FUSION_VERSION = 9.0.0
 LINUX_FUSION_SOURCE = linux-fusion-$(LINUX_FUSION_VERSION).tar.gz
 LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 LINUX_FUSION_INSTALL_STAGING = YES
