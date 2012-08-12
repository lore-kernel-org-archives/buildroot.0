From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 01:54:22 +0200
Subject: [Buildroot] [PATCH 34/36] package/qemu: enable guest-base
In-Reply-To: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1344815664-28138-34-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Backport this patch to the initial QEMU patch if it works.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/qemu/qemu.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 9e3e65f..a6ae5e1 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -267,7 +267,6 @@ define QEMU_CONFIGURE_CMDS
 	        --disable-slirp                     \
 	        --disable-vnc-sasl                  \
 	        --disable-brlapi                    \
-	        --disable-guest-base                \
 	        --disable-rbd                       \
 	        --disable-guest-agent               \
 	        --disable-smartcard                 \
-- 
1.7.2.5
