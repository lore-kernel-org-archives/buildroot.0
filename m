From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Oct 2014 15:02:34 -0300
Subject: [Buildroot] [PATCH] system/skeleton: drop pcmcia bits
Message-ID: <1414519354-24108-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

They're obsolete and the package was removed way back in 2010.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 system/skeleton/var/lib/pcmcia | 1 -
 system/skeleton/var/pcmcia     | 1 -
 2 files changed, 2 deletions(-)
 delete mode 120000 system/skeleton/var/lib/pcmcia
 delete mode 120000 system/skeleton/var/pcmcia

diff --git a/system/skeleton/var/lib/pcmcia b/system/skeleton/var/lib/pcmcia
deleted file mode 120000
index f1fde8c..0000000
--- a/system/skeleton/var/lib/pcmcia
+++ /dev/null
@@ -1 +0,0 @@
-../../tmp
\ No newline at end of file
diff --git a/system/skeleton/var/pcmcia b/system/skeleton/var/pcmcia
deleted file mode 120000
index 1431b0e..0000000
--- a/system/skeleton/var/pcmcia
+++ /dev/null
@@ -1 +0,0 @@
-../tmp
\ No newline at end of file
-- 
2.0.4
