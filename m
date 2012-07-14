From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 14 Jul 2012 22:32:11 +0200
Subject: [Buildroot] [PATCH 6/6] orc: remove redundant HOST_ORC_DEPENDENCIES
In-Reply-To: <1342297879-9881-1-git-send-email-arnout@mind.be>
References: <1342297879-9881-1-git-send-email-arnout@mind.be>
Message-ID: <1342297931-11881-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/orc/orc.mk |    1 -
 1 file changed, 1 deletion(-)

diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 6602e36..97c80f2 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -7,7 +7,6 @@ ORC_VERSION = 0.4.14
 ORC_SITE = http://code.entropywave.com/download/orc/
 ORC_INSTALL_STAGING = YES
 ORC_DEPENDENCIES = host-orc
-HOST_ORC_DEPENDENCIES =
 
 define ORC_REMOVE_BUGREPORT
 	rm -f $(TARGET_DIR)/usr/bin/orc-bugreport
-- 
tg: (a24703b..) t/host-no-circular-dep-6-orc (depends on: t/host-no-circular-dep-5-ncurses)
