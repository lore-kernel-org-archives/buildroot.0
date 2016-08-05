From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Aug 2016 14:21:31 +0200
Subject: [Buildroot] [git commit] ncurses: reinstall l/linux terminfo file
Message-ID: <20160805122225.AD8D382249@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0215a1a17f7c2ed11abfd02b47b6c7853260f40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This file was installed prior to the refactoring done in commit
33ba5188351ece027455e460f6cba4245af49f3a ("ncurses: factorize terminfo
files installation").

Reported-by: Beno??t Allard <benoit.allard@greenbone.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ncurses/ncurses.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 614b6ce..2764824 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -57,6 +57,7 @@ NCURSES_LIBS-$(BR2_PACKAGE_NCURSES_TARGET_FORM) += form
 
 NCURSES_TERMINFO_FILES = \
 	a/ansi \
+	l/linux \
 	p/putty \
 	p/putty-vt100 \
 	s/screen \
