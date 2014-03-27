From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 27 Mar 2014 10:03:39 +0100
Subject: [Buildroot] [PATCH] tmux: bump to 1.9a
Message-ID: <1395911019-17272-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/tmux/tmux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tmux/tmux.mk b/package/tmux/tmux.mk
index 3f5f893..6288e0b 100644
--- a/package/tmux/tmux.mk
+++ b/package/tmux/tmux.mk
@@ -4,7 +4,7 @@
 #
 ###############################################################################
 
-TMUX_VERSION = 1.8
+TMUX_VERSION = 1.9a
 TMUX_SITE = http://downloads.sourceforge.net/tmux
 TMUX_LICENSE = ISC
 TMUX_LICENSE_FILES = README
-- 
1.8.1.2
