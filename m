From: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
Date: Mon, 29 Apr 2019 18:32:23 +0200
Subject: [Buildroot] [PATCH 4/7] package/qemu: remove comment about sh64
In-Reply-To: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
References: <1556555546-9246-1-git-send-email-jugurtha.belkalem@smile.fr>
Message-ID: <1556555546-9246-5-git-send-email-jugurtha.belkalem@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sh64 has been removed since commit [1]:

[1] 4338a319b72570e433fd7484f8a95e1e0e978941

Signed-off-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
---
 package/qemu/qemu.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b509472..0dfb928 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -181,7 +181,6 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
 #       sh4eb           sh4eb
 #       sh4a            sh4
 #       sh4aeb          sh4eb
-#       sh64            not supported
 #       sparc           sparc
 #       sparc64         sparc64
 
-- 
2.7.4
