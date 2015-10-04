From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Oct 2015 15:53:01 +0100
Subject: [Buildroot] [git commit] skeleton: Remove bash specific files
Message-ID: <20151004145339.2E9BE7FDAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ae4a168deafed14ccc0037abb0e5cf51ceeaa2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/skeleton/root/.bash_logout  |    7 -------
 system/skeleton/root/.bash_profile |    7 -------
 2 files changed, 0 insertions(+), 14 deletions(-)

diff --git a/system/skeleton/root/.bash_history b/system/skeleton/root/.bash_history
deleted file mode 100644
index e69de29..0000000
diff --git a/system/skeleton/root/.bash_logout b/system/skeleton/root/.bash_logout
deleted file mode 100644
index 77ef1f9..0000000
--- a/system/skeleton/root/.bash_logout
+++ /dev/null
@@ -1,7 +0,0 @@
-# ~/.bash_logout: executed by bash(1) when login shell exits.
-
-# when leaving the console clear the screen to increase privacy
-
-case "`tty`" in
-    /dev/tty[0-9]*) clear
-esac
diff --git a/system/skeleton/root/.bash_profile b/system/skeleton/root/.bash_profile
deleted file mode 100644
index 0ee04a3..0000000
--- a/system/skeleton/root/.bash_profile
+++ /dev/null
@@ -1,7 +0,0 @@
-# .bash_profile
-
-umask 022
-
-if [ -f ~/.bashrc ]; then
-    source ~/.bashrc
-fi
