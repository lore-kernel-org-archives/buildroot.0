From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jun 2017 09:55:10 +0200
Subject: [Buildroot] [git commit] ncurses: Copy terminfo for
	'screen-256color' terminal
Message-ID: <20170604075754.9D3C282948@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bd29da2b3cbf560a045334b27305486b0484a99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tmux uses 256 color version of 'screen' terminfo by default, so copy
corresponding file to support that usecase.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index d8ad9dd..94c8c9a 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -52,6 +52,7 @@ NCURSES_TERMINFO_FILES = \
 	p/putty \
 	p/putty-vt100 \
 	s/screen \
+	s/screen-256color \
 	v/vt100 \
 	v/vt100-putty \
 	v/vt102 \
