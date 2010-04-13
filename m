From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Apr 2010 17:05:37 +0200
Subject: [Buildroot] [PATCH 25/35] at91bootstrap: do not default to
	$(BOARD_NAME)
In-Reply-To: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
References: <cover.1271170913.git.thomas.petazzoni@free-electrons.com>
Message-ID: <ee9349cc95db557a95318bb22789d1a3b72b5d55.1271170913.git.thomas.petazzoni@free-electrons.com>
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
1.6.3.3
