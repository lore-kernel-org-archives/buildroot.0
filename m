From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:34 +0200
Subject: [Buildroot] [PATCH 65/69] ncurses: remove empty host dependencies
	definition
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-66-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/ncurses/ncurses.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 8368c690b606..bef57c5f08f5 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -8,7 +8,6 @@ NCURSES_VERSION = 5.9
 NCURSES_SITE = $(BR2_GNU_MIRROR)/ncurses
 NCURSES_INSTALL_STAGING = YES
 NCURSES_DEPENDENCIES = host-ncurses
-HOST_NCURSES_DEPENDENCIES =
 NCURSES_PROGS = clear infocmp tabs tic toe tput tset
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = README
-- 
2.1.0
