From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 03:01:44 +0200
Subject: [Buildroot] [git commit] configs/qemu: enable modules for x86 and
	x86_64
Message-ID: <20160329010146.3C15781972@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fdc5f301f8d60024469c497e15641d776174dd87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's useful for demo configs which have more features, like
automatically loaded (module) drivers.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/qemu/x86/linux-4.5.config    | 2 ++
 board/qemu/x86_64/linux-4.5.config | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/board/qemu/x86/linux-4.5.config b/board/qemu/x86/linux-4.5.config
index 9cd64f7..c630f02 100644
--- a/board/qemu/x86/linux-4.5.config
+++ b/board/qemu/x86/linux-4.5.config
@@ -1,4 +1,6 @@
 CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_SMP=y
 CONFIG_NET=y
 CONFIG_PACKET=y
diff --git a/board/qemu/x86_64/linux-4.5.config b/board/qemu/x86_64/linux-4.5.config
index 9cd64f7..c630f02 100644
--- a/board/qemu/x86_64/linux-4.5.config
+++ b/board/qemu/x86_64/linux-4.5.config
@@ -1,4 +1,6 @@
 CONFIG_SYSVIPC=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
 CONFIG_SMP=y
 CONFIG_NET=y
 CONFIG_PACKET=y
