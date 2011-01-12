From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 12 Jan 2011 12:03:15 +0100
Subject: [Buildroot] [PATCH 2/2] liberation: fixed misspelled target
	uninstall macro name
In-Reply-To: <1294830195-11438-1-git-send-email-daniel.nystrom@timeterminal.se>
References: <1294830195-11438-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <1294830195-11438-2-git-send-email-daniel.nystrom@timeterminal.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
---
 package/liberation/liberation.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 53b817d..98587be 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -14,7 +14,7 @@ define LIBERATION_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 644 $(@D)/*.ttf $(LIBERATION_TARGET_DIR)
 endef
 
-define LIBERATION_CLEAN_CMDS
+define LIBERATION_UNINSTALL_TARGET_CMDS
 	rm -rf $(LIBERATION_TARGET_DIR)
 endef
 
-- 
1.7.1
