From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 14 Jul 2013 22:08:35 +0200
Subject: [Buildroot] [git commit] package/uclibc: fix indentation (use tabs,
	not spaces)
Message-ID: <20130714204246.74ED29A49D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f4cb885f31296db6eac4f4c93761a39eb3d1433
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/uclibc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index f309243..e508342 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -113,7 +113,7 @@ choice
 
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
-	        select BR2_TOOLCHAIN_HAS_THREADS
+		select BR2_TOOLCHAIN_HAS_THREADS
 		depends on !BR2_ARM_OABI
 		depends on !BR2_x86_i386
 		depends on !BR2_avr32
