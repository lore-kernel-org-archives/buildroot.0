Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0EAC678D5
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C89994059F;
	Thu, 23 Feb 2023 22:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C89994059F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z9mnXk7hZX_4; Thu, 23 Feb 2023 22:44:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D2AA4058E;
	Thu, 23 Feb 2023 22:44:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D2AA4058E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBD7F1BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B72FD4058E
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B72FD4058E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h8La8xj06pPY for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:44:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9DD8403A4
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9DD8403A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D92ED869E1; Thu, 23 Feb 2023 22:44:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 23:43:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 463d0dd49454669e7d72179319aeb967686c129e
X-Git-Newrev: 3254a2886a4e20111e5c87614f6f374ec626b755
X-Patchwork-Hint: ignore
Message-Id: <20230223224433.D92ED869E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/boot-wrapper-aarch64:
 bump version
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
Content-Type: multipart/mixed; boundary="===============1729008993893675080=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1729008993893675080==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=3254a2886a4e20111e5c87614f6f374ec626b755
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump boot-wrapper to the latest version.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index 30b352f8e7..95f7e22760 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOT_WRAPPER_AARCH64_VERSION = 8d5a765251d9113c3c0f9fa14de42a9e7486fe8a
+BOOT_WRAPPER_AARCH64_VERSION = 9f26a1c1f27bd6b5b66c265114848007fc22e4aa
 BOOT_WRAPPER_AARCH64_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
 BOOT_WRAPPER_AARCH64_SITE_METHOD = git
 BOOT_WRAPPER_AARCH64_LICENSE = BSD-3-Clause

--===============1729008993893675080==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1729008993893675080==--
