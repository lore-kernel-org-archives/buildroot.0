From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jun 2010 22:33:08 +0200
Subject: [Buildroot] [git commit master 1/1] at91bootstrap: do not default
	to $(BOARD_NAME)
Message-ID: <20100614203441.56AA7804D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=de5dfe4a1ee74e6f44166e7dbde8f64a388ce6ba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
1.7.1
