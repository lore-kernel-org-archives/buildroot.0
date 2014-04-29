From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Apr 2014 23:14:04 +0200
Subject: [Buildroot] [git commit] uclibc: arc: bump to arc-4.8-R3 release
Message-ID: <20140429223019.BAD659CA71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c31d5bfdecf4a9da25a637e7a9b04ffe6cb3b9c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 2b93660..cc244a9 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -42,7 +42,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.31.1	if BR2_UCLIBC_VERSION_0_9_31
 	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
 	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
-	default "f37101d94284c692ee9b23bc72ef38b9473cd316" if BR2_arc
+	default "arc-4.8-R3"	if BR2_arc
 	default "7bf35c8b7d4a1f97174eb49f47f33946b282114c" if BR2_UCLIBC_VERSION_XTENSA_GIT
 	default BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
