From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  1 Jun 2010 00:08:17 +0200
Subject: [Buildroot] [PATCH 31/46] at91bootstrap: do not default to
	$(BOARD_NAME)
In-Reply-To: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
References: <cover.1275343447.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7fc5e3e4ff9e862461bfa28ee15c820936fc113d.1275343448.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/at91bootstrap/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/boot/at91bootstrap/Config.in b/boot/at91bootstrap/Config.in
index 44db8f5..8514ccc 100644
--- a/boot/at91bootstrap/Config.in
+++ b/boot/at91bootstrap/Config.in
@@ -6,7 +6,7 @@ if	BR2_TARGET_AT91BOOTSTRAP
 
 config BR2_TARGET_AT91BOOTSTRAP_BOARD
 	string "Bootstrap board"
-	default "$(BOARD_NAME)"
+	default ""
 	help
 	  This is used to do a make <board>_config
 
-- 
1.7.0.4
