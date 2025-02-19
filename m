Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F9DC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 605D88591B;
	Fri, 28 Feb 2025 17:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vcx7Cl_OImde; Fri, 28 Feb 2025 17:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 638068590C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 638068590C;
	Fri, 28 Feb 2025 17:22:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1445A711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A13754A577
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njtbhZqxvuh3 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B6E846E38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B6E846E38
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42BCF86143; Fri, 28 Feb 2025 16:30:44 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 22:06:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 64b2f03f5a2e35b7ab873d6f7db64735a0567d59
X-Git-Newrev: bd41cccc7a9d912289315e28ca85ade8179f2c1f
X-Patchwork-Hint: ignore
Message-Id: <20250228163044.42BCF86143@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/boot-wrapper-aarch64:
 bump version
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: multipart/mixed; boundary="===============4509434202732143877=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4509434202732143877==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bd41cccc7a9d912289315e28ca85ade8179f2c1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump boot-wrapper to the latest version.

Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
index 95f7e22760..0f41d0d67f 100644
--- a/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
+++ b/boot/boot-wrapper-aarch64/boot-wrapper-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BOOT_WRAPPER_AARCH64_VERSION = 9f26a1c1f27bd6b5b66c265114848007fc22e4aa
+BOOT_WRAPPER_AARCH64_VERSION = ac6742520ded1da30d500f74e8affe86e27cabd5
 BOOT_WRAPPER_AARCH64_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wrapper-aarch64.git
 BOOT_WRAPPER_AARCH64_SITE_METHOD = git
 BOOT_WRAPPER_AARCH64_LICENSE = BSD-3-Clause

--===============4509434202732143877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4509434202732143877==--
