From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Oct 2014 21:38:54 +0100
Subject: [Buildroot] [git commit] fix minor typo in kexec description
Message-ID: <20141029203859.0F2FAB1F5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2cf29dfb286fd7d5c36bc2a11655b60ea3f34be2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kexec/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 0139c17..d92e6b9 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_KEXEC
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
 		BR2_powerpc || BR2_sh4 || BR2_sh4a
 	help
-	  Kexec is a user space utiltity for loading another kernel
+	  Kexec is a user space utility for loading another kernel
 	  and asking the currently running kernel to do something with it.
 
 	  https://www.kernel.org/pub/linux/utils/kernel/kexec/
