Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB7EEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02A5B41589;
	Thu,  6 Jul 2023 11:58:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02A5B41589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FUFV2rbGChQG; Thu,  6 Jul 2023 11:58:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6B6341585;
	Thu,  6 Jul 2023 11:58:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6B6341585
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 582F21BF345
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30F41416D4
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30F41416D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id givX_Iq_QzJ4 for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:57:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC6E7416C9
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC6E7416C9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C83A28671B; Thu,  6 Jul 2023 11:57:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:55:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: adfdeb1f82544466c5948f4c42e1eccd3ab0f72c
X-Git-Newrev: 006badd9b61ec281d656e23009ddc326a94ae39e
X-Patchwork-Hint: ignore
Message-Id: <20230706115734.C83A28671B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.18.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=006badd9b61ec281d656e23009ddc326a94ae39e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://www.samba.org/samba/history/samba-4.18.4.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 05563d00cf..cc7eee620f 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.18.3.tar.asc
-sha256  c67e1453165a3918ffffad600236ca3966b47bde4798e89ae600ae3903ccc32c  samba-4.18.3.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.18.4.tar.asc
+sha256  6ba7b3503cc59c9ff4f6fcb1b510c2c855fff93e0b366ab891a32a4732e88e53  samba-4.18.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 75938e21a8..a14cc63c01 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.18.3
+SAMBA4_VERSION = 4.18.4
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
