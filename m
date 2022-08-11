Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BC5C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CA9A82EA1;
	Thu, 11 Aug 2022 11:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CA9A82EA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzNauJiuVpJi; Thu, 11 Aug 2022 11:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 718B082CD4;
	Thu, 11 Aug 2022 11:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 718B082CD4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7A7761BF403
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F36140132
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:00:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F36140132
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YoxcX1dLLqzK for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:00:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D8C44026A
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D8C44026A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 435F387100; Thu, 11 Aug 2022 10:46:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 11:47:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bbcb4e586ea24858769bbfd91bc6d9ebd1a8191e
X-Git-Newrev: 61ae6add9e5d4761536fa4ff24150d5f8f82a61d
X-Patchwork-Hint: ignore
Message-Id: <20220811104614.435F387100@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uclibc: update to 1.0.42
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=61ae6add9e5d4761536fa4ff24150d5f8f82a61d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.hash | 4 ++--
 package/uclibc/uclibc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/uclibc.hash b/package/uclibc/uclibc.hash
index 3b29c351b5..0122d08789 100644
--- a/package/uclibc/uclibc.hash
+++ b/package/uclibc/uclibc.hash
@@ -1,4 +1,4 @@
-# From https://downloads.uclibc-ng.org/releases/1.0.41/uClibc-ng-1.0.41.tar.xz.sha256
-sha256  b32a92a0218d95922d6976464e6ef51e2ebacfbcdb605820458d9dbb8a61e025  uClibc-ng-1.0.41.tar.xz
+# From https://downloads.uclibc-ng.org/releases/1.0.42/uClibc-ng-1.0.42.tar.xz.sha256
+sha256  ec6dae44ce86558885e56bc3bef6bd4d082397114e6e1fc15795f71e804d7016  uClibc-ng-1.0.42.tar.xz
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING.LIB
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 0e17a8e65d..0ddf7dfa6d 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_VERSION = 1.0.41
+UCLIBC_VERSION = 1.0.42
 UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
 UCLIBC_SITE = https://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)
 UCLIBC_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
