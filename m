Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FDBCA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 19:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34F0D606FD;
	Thu,  4 Sep 2025 19:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHDIPJ8JE24i; Thu,  4 Sep 2025 19:32:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA8D7606DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA8D7606DA;
	Thu,  4 Sep 2025 19:31:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9BB11E05
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0718606D4
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1IO9xVi5IRAE for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 19:31:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E410606C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E410606C7
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 19:31:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D5EF82B36; Thu,  4 Sep 2025 19:31:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 20:48:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e255cfff44f25fdc91fe871b6923932c7b728a6c
X-Git-Newrev: 7c20afb95eae62ebffd7f9f093e6a60cea274892
X-Patchwork-Hint: ignore
Message-Id: <20250904193156.2D5EF82B36@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/aspeed_ast2600evb:
 bump U-Boot to commit 66672e5af36f
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4298708390860862631=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4298708390860862631==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=7c20afb95eae62ebffd7f9f093e6a60cea274892
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Use a newer commit ID (2023-07-24). While not the latest, this commit
marks a significant milestone in the ongoing development and support
of AST2600 SoC boards.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
[Julien: reword commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 configs/aspeed_ast2600evb_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/aspeed_ast2600evb_defconfig b/configs/aspeed_ast2600evb_defconfig
index 4e49c4acbe..2057091776 100644
--- a/configs/aspeed_ast2600evb_defconfig
+++ b/configs/aspeed_ast2600evb_defconfig
@@ -18,7 +18,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/openbmc/u-boot.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="f2b82fa4ba17ed8091fe76c284220006645a293b"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="66672e5af36fe294df56f8e7942069e3909f3790"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="evb-ast2600"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="DEVICE_TREE=ast2600a1-evb"

--===============4298708390860862631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4298708390860862631==--
