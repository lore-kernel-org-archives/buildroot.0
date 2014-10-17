From: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Date: Fri, 17 Oct 2014 11:12:27 -0400
Subject: [Buildroot] [PATCH] ncurses: fix typo 'target'
Message-ID: <1413558747-31850-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
---
 package/ncurses/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ncurses/Config.in b/package/ncurses/Config.in
index 3cc0a37..44713f9 100644
--- a/package/ncurses/Config.in
+++ b/package/ncurses/Config.in
@@ -36,6 +36,6 @@ config BR2_PACKAGE_NCURSES_TARGET_MENU
 config BR2_PACKAGE_NCURSES_TARGET_PROGS
 	bool "ncurses programs"
 	help
-	  Include ncurses programs in traget (clear, reset, tput, ...)
+	  Include ncurses programs in target (clear, reset, tput, ...)
 
 endif
-- 
1.8.3.4
