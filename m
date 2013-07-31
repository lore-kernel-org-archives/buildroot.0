From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 31 Jul 2013 19:07:38 +0200
Subject: [Buildroot] [git commit] readline: make description more
	enlightening and fix indentation
Message-ID: <20130731170723.20D0B9AF43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07398f7b43af41a2af5e1b843415d0c9550d32c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/readline/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/readline/Config.in b/package/readline/Config.in
index 305955a..fbebf18 100644
--- a/package/readline/Config.in
+++ b/package/readline/Config.in
@@ -2,4 +2,6 @@ config BR2_PACKAGE_READLINE
 	bool "readline"
 	select BR2_PACKAGE_NCURSES
 	help
-	    Enable GNU readline support?
+	  The GNU Readline library provides a set of functions for use
+	  by applications that allow users to edit command lines
+	  as they are typed in.
