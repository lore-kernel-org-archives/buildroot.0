From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Apr 2016 17:35:18 +0200
Subject: [Buildroot] [git commit] linux: explicit latest kernel version
Message-ID: <20160420153533.811E48180F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42f22d687d021f8f0ca6c6f444fc772f451000eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When setting BR2_LINUX_KERNEL_LATEST_VERSION, it is hard for the user to
know that this version is subject to change in the future.

Explicit this in the Kconfig entry text.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 53994a8..ef93489 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -27,7 +27,7 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "4.5.2"
+	bool "Latest version (4.5.2)"
 
 config BR2_LINUX_KERNEL_CUSTOM_VERSION
 	bool "Custom version"
