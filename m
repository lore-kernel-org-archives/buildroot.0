From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Feb 2013 18:18:48 +0100
Subject: [Buildroot] [PATCH] linux-fusion: bump to 9.0.0
Message-ID: <1361639928-24841-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

Fixes https://bugs.busybox.net/show_bug.cgi?id=5960

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: broot at monkster.hopto.org
---
Although it fixes a bug, it's probably for next (version bump).
---
 package/linux-fusion/linux-fusion.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.7.10.4
