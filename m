From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Oct 2014 12:24:45 +0200
Subject: [Buildroot] [git commit] ncurses: fix typo 'target'
Message-ID: <20141019102453.F14A6AE963@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bbd2948c988f908c6c4597646c1adb0f5422d382
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
