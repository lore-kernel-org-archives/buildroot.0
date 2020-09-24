From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Sep 2020 22:57:56 +0200
Subject: [Buildroot] [git commit] package/makedumpfile: add support for IBM
 s390x and Z arch
Message-ID: <20200924213040.0CBC480E36@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a02eabb75059152c2f6ef820ce9ad0f9e2786b05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/makedumpfile/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/makedumpfile/Config.in b/package/makedumpfile/Config.in
index a90ccbdf3c..e41c4641a2 100644
--- a/package/makedumpfile/Config.in
+++ b/package/makedumpfile/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_s390x
 	default y if BR2_sparc64
 
 comment "makedumpfile needs a uClibc or glibc toolchain w/ wchar, dynamic library"
