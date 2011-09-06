From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 6 Sep 2011 15:19:57 +0200
Subject: [Buildroot] [git commit] leafpad: bump to 0.8.18
Message-ID: <20110906152206.895DE8D421@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5f150dc6d86b949876f350f96e8a92f7fdcb0765
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/leafpad/leafpad.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index 9964409..bc04249 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -3,7 +3,7 @@
 # leafpad
 #
 #############################################################
-LEAFPAD_VERSION = 0.8.14
+LEAFPAD_VERSION = 0.8.18
 LEAFPAD_SOURCE = leafpad-$(LEAFPAD_VERSION).tar.gz
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
 LEAFPAD_AUTORECONF = NO
-- 
1.7.3.4
