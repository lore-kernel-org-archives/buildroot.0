From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 May 2014 22:48:04 +0200
Subject: [Buildroot] [git commit] uclibc: arc: bump to 8af9dc8
Message-ID: <20140501211456.636C39CAAE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=485a55c9d62e72ba8af7ed44e472cc568f52f391
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will resolve uClibc build error for configurations without large file
support.

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index cc244a9..4b3b975 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -42,7 +42,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
 	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
-	default "arc-4.8-R3"	if BR2_arc
+	default "8af9dc8f714d20a68df034f6ed1ededc2d752f5b" if BR2_arc
 	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
