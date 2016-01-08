From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Jan 2016 10:29:50 -0300
Subject: [Buildroot] [PATCH] configs/qemu: enable SMP for x86 & x86_64
Message-ID: <1452259790-9223-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the 21st century, so enable SMP for them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/x86/linux-4.3.config    | 1 +
 board/qemu/x86_64/linux-4.3.config | 1 +
 2 files changed, 2 insertions(+)

diff --git a/board/qemu/x86/linux-4.3.config b/board/qemu/x86/linux-4.3.config
index 20726c3..4dcc995 100644
--- a/board/qemu/x86/linux-4.3.config
+++ b/board/qemu/x86/linux-4.3.config
@@ -1,4 +1,5 @@
 CONFIG_SYSVIPC=y
+CONFIG_SMP=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
diff --git a/board/qemu/x86_64/linux-4.3.config b/board/qemu/x86_64/linux-4.3.config
index 20726c3..4dcc995 100644
--- a/board/qemu/x86_64/linux-4.3.config
+++ b/board/qemu/x86_64/linux-4.3.config
@@ -1,4 +1,5 @@
 CONFIG_SYSVIPC=y
+CONFIG_SMP=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
-- 
2.4.10
