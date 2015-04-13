From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 13 Apr 2015 12:24:07 +0200
Subject: [Buildroot] [PATCH 2/3] sigrok-cli: bump commit hash
In-Reply-To: <1428920648-12979-1-git-send-email-bgolaszewski@baylibre.com>
References: <1428920648-12979-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <1428920648-12979-3-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to some changes in libsigrok API sigrok-cli commit must be
updated as well after bumping libsigrok hash.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 package/sigrok-cli/sigrok-cli.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sigrok-cli/sigrok-cli.mk b/package/sigrok-cli/sigrok-cli.mk
index 9f8b1c2..34e0a0e 100644
--- a/package/sigrok-cli/sigrok-cli.mk
+++ b/package/sigrok-cli/sigrok-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIGROK_CLI_VERSION = 198487f611d8a7be4fa15017c22fa01a56551ca6
+SIGROK_CLI_VERSION = c59bf72b694ab1d08b2ea44de4349c277e206414
 # No https access on upstream git
 SIGROK_CLI_SITE = git://sigrok.org/sigrok-cli
 SIGROK_CLI_LICENSE = GPLv3+
-- 
2.1.4
