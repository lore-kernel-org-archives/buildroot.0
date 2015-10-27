From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 Oct 2015 22:17:22 -0300
Subject: [Buildroot] [PATCH 2/2] qemu/x86: enable generic hda codec
In-Reply-To: <1445908642-8162-1-git-send-email-gustavo@zacarias.com.ar>
References: <1445908642-8162-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1445908642-8162-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable the generic hda (sound) codec, necessary for qemu audio to work.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 board/qemu/x86/linux-4.2.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/qemu/x86/linux-4.2.config b/board/qemu/x86/linux-4.2.config
index 5b64416..20726c3 100644
--- a/board/qemu/x86/linux-4.2.config
+++ b/board/qemu/x86/linux-4.2.config
@@ -15,6 +15,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_GENERIC=y
 CONFIG_EXT4_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-- 
2.4.10
