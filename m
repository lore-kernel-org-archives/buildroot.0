Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E85EC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 16:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5018F431B2;
	Wed,  1 Nov 2023 16:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5018F431B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ac1X7G5WXtic; Wed,  1 Nov 2023 16:25:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B2EC431E8;
	Wed,  1 Nov 2023 16:25:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B2EC431E8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43A651BF841
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2817170429
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 16:24:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2817170429
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUn1qydGywyR for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 16:24:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85A617042C
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 16:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85A617042C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 725CC8636B; Wed,  1 Nov 2023 16:24:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 17:10:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e612a67c95cc5e4ff617805957b0d72ef01f47cd
X-Git-Newrev: 2ced8d5878481ce83622c73c5858d358dd4e4407
X-Patchwork-Hint: ignore
Message-Id: <20231101162447.725CC8636B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uftrace: bump to version 0.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2ced8d5878481ce83622c73c5858d358dd4e4407
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Upstream link to patch (even if it was rejected)

https://github.com/namhyung/uftrace/blob/v0.14/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                     | 1 -
 .../0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch      | 1 +
 package/uftrace/uftrace.hash                                            | 2 +-
 package/uftrace/uftrace.mk                                              | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 23c0811de6..973c3ba134 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1398,7 +1398,6 @@ package/uboot-tools/0003-tools-Makefile-fix-C-LD-FLAGS-with-CROSS_BUILD_TOOLS.pa
 package/ubus/0001-Install-server-and-client-examples.patch Upstream
 package/udpcast/0001-fix-musl-build.patch Upstream
 package/uemacs/01-clear-ixon-termios-flag.patch Upstream
-package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch Upstream
 package/uhd/0001-host-CMakeLists-add-boost-unit_test_framework-requir.patch Upstream
 package/uhttpd/0001-Remove-Werror.patch Upstream
 package/uhttpd/0002-Fix-TCP_FASTOPEN-related-compile-error.patch Upstream
diff --git a/package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch b/package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch
index 6913012c3b..2855be0d9e 100644
--- a/package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch
+++ b/package/uftrace/0001-cmds-records-replace-ADDR_NO_RANDOMIZE-by-its-value.patch
@@ -11,6 +11,7 @@ Using a #ifdef ... #endif test doesn't work as this value is defined
 through an enum in glibc.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://github.com/namhyung/uftrace/pull/1389
 ---
  cmds/record.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/uftrace/uftrace.hash b/package/uftrace/uftrace.hash
index 195f0605c8..c4aad39016 100644
--- a/package/uftrace/uftrace.hash
+++ b/package/uftrace/uftrace.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2aad01f27d4f18717b681824c7a28ac3e1efd5e7bbed3ec888a3ea5af60e3700  uftrace-0.12.tar.gz
+sha256  b81255bc288e79e96a5b158d4875fa6425ad51c85f4c4c8523c1defb9366ad12  uftrace-0.14.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/uftrace/uftrace.mk b/package/uftrace/uftrace.mk
index d36c3bd8f5..c005a32b76 100644
--- a/package/uftrace/uftrace.mk
+++ b/package/uftrace/uftrace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UFTRACE_VERSION = 0.12
+UFTRACE_VERSION = 0.14
 UFTRACE_SITE = $(call github,namhyung,uftrace,v$(UFTRACE_VERSION))
 UFTRACE_LICENSE = GPL-2.0
 UFTRACE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
