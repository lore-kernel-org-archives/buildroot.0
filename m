From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Apr 2021 20:04:11 +0200
Subject: [Buildroot] [git commit] package/readline: add Signed-off-by and
 renumber patch
Message-ID: <20210411180008.6FEC87FC0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=575c60ff9aaaa03662555ae9353ad4e441e7fc6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Signed-off-by and while at it, renumber it

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13731

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/readline/{0000-curses-link.patch => 0001-curses-link.patch} | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/readline/0000-curses-link.patch b/package/readline/0001-curses-link.patch
similarity index 85%
rename from package/readline/0000-curses-link.patch
rename to package/readline/0001-curses-link.patch
index 56b4770220..6afc5ba078 100644
--- a/package/readline/0000-curses-link.patch
+++ b/package/readline/0001-curses-link.patch
@@ -3,6 +3,8 @@ link readline directly to ncurses since it needs symbols from it
 upstream readline does this on purpose (no direct linking), but
 it doesn't make much sense in a Linux world
 
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
 --- a/support/shobj-conf
 +++ b/support/shobj-conf
 @@ -42,7 +42,7 @@
