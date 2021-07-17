Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDE4C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:05:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F891600CD
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F891600CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BFF082FD5;
	Tue,  3 Aug 2021 22:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egOJ8BwWuMb8; Tue,  3 Aug 2021 22:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5301983A95;
	Tue,  3 Aug 2021 22:05:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C546A1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A75B40569
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGD9Hs4Y1DrB for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CB6B40508
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 97683868A0; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Jul 2021 10:07:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2b2f635733999918d359d6cd611ef07c2ec4bacc
X-Git-Newrev: 2c6b0359c3b819fadb4437b2d780e95c32fdab21
X-Patchwork-Hint: ignore
Message-Id: <20210803211005.97683868A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/swupdate: bump to
 version 2021.04
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2c6b0359c3b819fadb4437b2d780e95c32fdab21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add new optional dependencies.

Drop patches that are now upstream.

License update details

LICENSES/BSD-1-Clause.txt:
https://github.com/sbabic/swupdate/commit/e419b06b497ee627b05cbc33d4b4df064137d0de

LICENSES/BSD-2-Clause.txt:
https://github.com/sbabic/swupdate/commit/32c1f98eaca69e362be074197f84a59d994c0876

LICENSES/BSD-3-Clause.txt:
https://github.com/sbabic/swupdate/commit/32c1f98eaca69e362be074197f84a59d994c0876

LICENSES/CC0-1.0.txt:
https://github.com/sbabic/swupdate/commit/7c3630f572e6d00d7c51b7c4925494c7a822aef9

LICENSES/CC-BY-ND-4.0.txt:
https://github.com/sbabic/swupdate/commit/b66db00c56f9960e9983e1a6d36eef4f151124a8

LICENSES/GPL-2.0-only.txt:
https://github.com/sbabic/swupdate/commit/af2cc98b44cc6a066c0be4511406294e9113e4b1

LICENSES/GPL-2.0-or-later.txt:
https://github.com/sbabic/swupdate/commit/11af069b85475f5bcaa094261259a6b40e363986

LICENSES/ISC.txt:
https://github.com/sbabic/swupdate/commit/6500f1e89a097bd12d0ac42f6c7cc7ee284a6e17

LICENSES/LGPL-2.1-or-later.txt:
https://github.com/sbabic/swupdate/commit/4ef88a9df89ddd445597ef49309563d29cb72607

LICENSES/LicenseRef-OpenSSL-Exception.txt:
https://github.com/sbabic/swupdate/commit/2f513d117c5948ca9d950bbb82f05e8e38cbab50

LICENSES/MIT.txt:
https://github.com/sbabic/swupdate/commit/c1bad02cb93ff9bc616029cd27318134d36cfacb

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...rt-force-kernel-to-reread-partition-table.patch | 32 -------------
 .../0002-Shellscript-stops-before-completing.patch | 52 ----------------------
 package/swupdate/swupdate.hash                     | 17 ++++---
 package/swupdate/swupdate.mk                       | 42 +++++++++++++++--
 4 files changed, 50 insertions(+), 93 deletions(-)

diff --git a/package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch b/package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch
deleted file mode 100644
index 5964d1b96f..0000000000
--- a/package/swupdate/0001-diskpart-force-kernel-to-reread-partition-table.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 305a7a5a74a612801d9df2b2efc86dd952b8c4e7 Mon Sep 17 00:00:00 2001
-From: Stefano Babic <sbabic@denx.de>
-Date: Tue, 9 Jun 2020 13:58:06 +0000
-Subject: [PATCH] diskpart: force kernel to reread partition table
-
-After writing a partition table to disk, the kernel should be informed
-(like the partconf tool does), else it is not possible to install images
-in the new created partitions.
-
-Signed-off-by: Stefano Babic <sbabic@denx.de>
-Signed-off-by: Joris Offouga <offougajoris@gmail.com>
----
- handlers/diskpart_handler.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/handlers/diskpart_handler.c b/handlers/diskpart_handler.c
-index 16adc17..372412b 100644
---- a/handlers/diskpart_handler.c
-+++ b/handlers/diskpart_handler.c
-@@ -273,7 +273,8 @@ static int diskpart(struct img_type *img,
- 	/*
- 	 * Everything done, write into disk
- 	 */
--	ret = fdisk_write_disklabel(cxt);
-+	ret = fdisk_write_disklabel(cxt) |
-+		fdisk_reread_partition_table(cxt);
- 
- handler_exit:
- 	if (fdisk_deassign_device(cxt, 0))
--- 
-2.25.1
-
diff --git a/package/swupdate/0002-Shellscript-stops-before-completing.patch b/package/swupdate/0002-Shellscript-stops-before-completing.patch
deleted file mode 100644
index d91438893b..0000000000
--- a/package/swupdate/0002-Shellscript-stops-before-completing.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From bd08e45d7b25f06da2fc6dc824146b471db5f1f4 Mon Sep 17 00:00:00 2001
-From: Stefano Babic <sbabic@denx.de>
-Date: Tue, 16 Jun 2020 10:29:55 +0200
-Subject: [PATCH] Shellscript stops before completing
-
-Commit 8fb94d7 reworks the way shell script are called, redirecting
-stdout and stderr to SWUpdate. A shell script runs then in a child
-process. Under some circumstances, SWUpdate closes the forked process
-before the child process completes.
-
-Be sure that the child process has terminated before to go on.
-
-Signed-off-by: Stefano Babic <sbabic@denx.de>
-Reported-by: Piotr Piwko <piotr.piwko@gmail.com>
-Tested-by: Piotr Piwko <piotr.piwko@gmail.com>
-Signed-off-by: Joris Offouga <offougajoris@gmail.com>
----
- core/pctl.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/core/pctl.c b/core/pctl.c
-index 8b1c667..01ad540 100644
---- a/core/pctl.c
-+++ b/core/pctl.c
-@@ -263,6 +263,7 @@ int run_system_cmd(const char *cmd)
- 		}
- 	} else {
- 		int fds[2];
-+		pid_t w;
- 
- 		close(stdoutpipe[PIPE_WRITE]);
- 		close(stderrpipe[PIPE_WRITE]);
-@@ -276,7 +277,6 @@ int run_system_cmd(const char *cmd)
- 		 * and from stderr (of the child process) as ERROR
- 		 */
- 		do {
--			pid_t w;
- 			int n1 = 0;
- 			struct timeval tv;
- 			fd_set readfds;
-@@ -373,7 +373,7 @@ int run_system_cmd(const char *cmd)
- 					}
- 				}
- 			} while (ret > 0 && n1 > 0);
--		} while (!WIFEXITED(wstatus));
-+		} while (w != process_id);
- 
- 		close(stdoutpipe[PIPE_READ]);
- 		close(stderrpipe[PIPE_READ]);
--- 
-2.25.1
-
diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.hash
index 40f978d225..8bfbc7c8b9 100644
--- a/package/swupdate/swupdate.hash
+++ b/package/swupdate/swupdate.hash
@@ -1,6 +1,13 @@
 # Locally calculated
-sha256  132df2ff1ad41c7aabd0fbef6a23d28607cbd5cad52aab050c4822977a107486  swupdate-2020.04.tar.gz
-sha256  43492b377cf2fb67942d1dd231146bd4e6578646ad13ef289297c9dd75cbc478  Licenses/Exceptions
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Licenses/lgpl-2.1.txt
-sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  Licenses/mit.txt
+sha256  5afe78ae94e869bcb911d8592251641cdab80096d8e5149d483054ea49f9aab8  swupdate-2021.04.tar.gz
+sha256  4cf04ed34ff0ebbf5c71345b56e6af5093fc17206364cca0ebbae92ef3940683  LICENSES/BSD-1-Clause.txt
+sha256  3139f288c2e4cbe4a8c0e8c13c82661f3c798d446e1fbbc27a48a69aa7b4ec0d  LICENSES/BSD-2-Clause.txt
+sha256  e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679eaf444a6d000518a3a6  LICENSES/BSD-3-Clause.txt
+sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
+sha256  6e4efcb1952c7976d3fae93b802c591384c4f50949225a802adf41bc266fa3e6  LICENSES/CC-BY-ND-4.0.txt
+sha256  5d51b52a40391a26cbb2accf5dc5d1c165de49a022d9d5efb50b22204d2682ec  LICENSES/GPL-2.0-only.txt
+sha256  43fd695e9b198a9a4997cc2d02e10d26cae937e2c4930b9eff9c6d349c85cd32  LICENSES/GPL-2.0-or-later.txt
+sha256  492e801f1b0632185431472f148885a4fe8e990b10da57b4986a8bcf140a5374  LICENSES/ISC.txt
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
+sha256  43492b377cf2fb67942d1dd231146bd4e6578646ad13ef289297c9dd75cbc478  LICENSES/LicenseRef-OpenSSL-Exception.txt
+sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSES/MIT.txt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index d96a0c2e07..fe967d7fd7 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -4,11 +4,20 @@
 #
 ################################################################################
 
-SWUPDATE_VERSION = 2020.04
+SWUPDATE_VERSION = 2021.04
 SWUPDATE_SITE = $(call github,sbabic,swupdate,$(SWUPDATE_VERSION))
-SWUPDATE_LICENSE = GPL-2.0+ with OpenSSL exception, LGPL-2.1+, MIT
-SWUPDATE_LICENSE_FILES = Licenses/Exceptions Licenses/gpl-2.0.txt \
-	Licenses/lgpl-2.1.txt Licenses/mit.txt
+SWUPDATE_LICENSE = GPL-2.0, GPL-2.0+ with OpenSSL exception, LGPL-2.1+, MIT, ISC, BSD-1-Clause, BSD-2-Clause, BSD-3-Clause, CC0-1.0, CC-BY-ND-4.0
+SWUPDATE_LICENSE_FILES = LICENSES/BSD-1-Clause.txt \
+	LICENSES/BSD-2-Clause.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/CC0-1.0.txt \
+	LICENSES/CC-BY-ND-4.0.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-2.0-or-later.txt \
+	LICENSES/ISC.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/LicenseRef-OpenSSL-Exception.txt \
+	LICENSES/MIT.txt
 
 # swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not
 # available in all external toolchains, and use CC for linking. Ensure
@@ -17,6 +26,10 @@ SWUPDATE_MAKE_ENV = CC="$(TARGET_CC)" LD="$(TARGET_CC)"
 
 # swupdate bundles its own version of mongoose (version 6.16)
 
+ifeq ($(BR2_PACKAGE_E2FSPROGS),y)
+SWUPDATE_DEPENDENCIES += e2fsprogs
+endif
+
 ifeq ($(BR2_PACKAGE_EFIBOOTMGR),y)
 SWUPDATE_DEPENDENCIES += efibootmgr
 SWUPDATE_MAKE_ENV += HAVE_LIBEBGENV=y
@@ -38,6 +51,13 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBARCHIVE=n
 endif
 
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
+SWUPDATE_DEPENDENCIES += util-linux
+SWUPDATE_MAKE_ENV += HAVE_LIBBLKID=y
+else
+SWUPDATE_MAKE_ENV += HAVE_LIBBLKID=n
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
 SWUPDATE_DEPENDENCIES += libconfig
 SWUPDATE_MAKE_ENV += HAVE_LIBCONFIG=y
@@ -110,6 +130,13 @@ SWUPDATE_MAKE_ENV += HAVE_MBEDTLS=n
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_P11_KIT),y)
+SWUPDATE_DEPENDENCIES += p11-kit
+SWUPDATE_MAKE_ENV += HAVE_P11KIT=y
+else
+SWUPDATE_MAKE_ENV += HAVE_P11KIT=n
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 SWUPDATE_DEPENDENCIES += systemd
 endif
@@ -121,6 +148,13 @@ else
 SWUPDATE_MAKE_ENV += HAVE_LIBUBOOTENV=n
 endif
 
+ifeq ($(BR2_PACKAGE_WOLFSSL),y)
+SWUPDATE_DEPENDENCIES += wolfssl
+SWUPDATE_MAKE_ENV += HAVE_WOLFSSL=y
+else
+SWUPDATE_MAKE_ENV += HAVE_WOLFSSL=n
+endif
+
 ifeq ($(BR2_PACKAGE_ZEROMQ),y)
 SWUPDATE_DEPENDENCIES += zeromq
 SWUPDATE_MAKE_ENV += HAVE_LIBZEROMQ=y
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
