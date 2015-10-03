From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  3 Oct 2015 16:14:23 +0200
Subject: [Buildroot] [PATCH v3 2/3] skeleton: Remove bash specific files
In-Reply-To: <1443881664-9100-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443881664-9100-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1443881664-9100-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 system/skeleton/root/.bash_history | 0
 system/skeleton/root/.bash_logout  | 7 -------
 system/skeleton/root/.bash_profile | 7 -------
 3 files changed, 14 deletions(-)
 delete mode 100644 system/skeleton/root/.bash_history
 delete mode 100644 system/skeleton/root/.bash_logout
 delete mode 100644 system/skeleton/root/.bash_profile

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
-- 
2.5.3
