Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B098C25B77
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01FE961348;
	Thu,  9 May 2024 20:46:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1lMJTTQNBtHg; Thu,  9 May 2024 20:46:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D7A461355
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D7A461355;
	Thu,  9 May 2024 20:46:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FCAD1BF995
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7E4241FDE
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iwJgRMwNJsDA for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 008FA41FE0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 008FA41FE0
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F111F86ADA; Thu,  9 May 2024 20:46:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:45:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8eea9f5783c6ba3e2cba245fcca71dd4017c2fdc
X-Git-Newrev: 5b847f88fef768c8e79422db4193533b3a7488ea
X-Patchwork-Hint: ignore
Message-Id: <20240509204628.F111F86ADA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board: update hashes for generated achives
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5b847f88fef768c8e79422db4193533b3a7488ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
[Arnout: also update acmesystems/acqua-a5]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash | 2 +-
 board/radxa/rock5b/patches/linux/linux.hash                           | 2 +-
 board/toradex/apalis-imx6/patches/linux/linux.hash                    | 2 +-
 board/toradex/apalis-imx6/patches/uboot/uboot.hash                    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
index 659be67590..3734f22c95 100644
--- a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
+++ b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  fef34111a07d9e5aa97b0840355a367f806a17e029583830e9deaa747ce47824  at91bootstrap3-v3.10.3-git3.tar.gz
+sha256  fef34111a07d9e5aa97b0840355a367f806a17e029583830e9deaa747ce47824  at91bootstrap3-v3.10.3-git4.tar.gz
diff --git a/board/radxa/rock5b/patches/linux/linux.hash b/board/radxa/rock5b/patches/linux/linux.hash
index 18074c0aee..7cf26c66d2 100644
--- a/board/radxa/rock5b/patches/linux/linux.hash
+++ b/board/radxa/rock5b/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  255961f7ea8ea82c42f19be049f94a690f9cb171fe8562ea87868ac5cabc3eb9  linux-52f51a2b5ba178f331af62260d2da86d7472c14b-git3.tar.gz
+sha256  41c0ee93d8751e4bdb85fae24b3e84fc6904a6755c485244eff2e6f8ca38a0c7  linux-52f51a2b5ba178f331af62260d2da86d7472c14b-git4.tar.gz
diff --git a/board/toradex/apalis-imx6/patches/linux/linux.hash b/board/toradex/apalis-imx6/patches/linux/linux.hash
index 277abc20aa..0697228724 100644
--- a/board/toradex/apalis-imx6/patches/linux/linux.hash
+++ b/board/toradex/apalis-imx6/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  41551a4f44bdfe18f68bedc0fd9c644d8657d2ee63215cc348a708cfd5b7e6f2  linux-d899927728beca8357a5b4120b690cb3c1d80844-git3.tar.gz
+sha256  722ece80ee8dbcc04309c89139da8b1df6974e1ab4bb66d04c1906a576fa46fa  linux-d899927728beca8357a5b4120b690cb3c1d80844-git4.tar.gz
diff --git a/board/toradex/apalis-imx6/patches/uboot/uboot.hash b/board/toradex/apalis-imx6/patches/uboot/uboot.hash
index d451219cb4..6132435fed 100644
--- a/board/toradex/apalis-imx6/patches/uboot/uboot.hash
+++ b/board/toradex/apalis-imx6/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  2fa23d10559c17362ef92e5d7e636b388e9af3784c9b03e86c702a71df100f36  uboot-30a1208727729dae22cb42f9ba9ba17efe5e6f77-git3.tar.gz
+sha256  f8d3e45d7944c9620ecacbd8f8824db42134c70e3b55efd6dab127bf763e48c2  uboot-30a1208727729dae22cb42f9ba9ba17efe5e6f77-git4.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
