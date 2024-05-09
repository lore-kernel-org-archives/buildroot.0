Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70D9C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 20:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AADB61307;
	Thu,  9 May 2024 20:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upmkcC3TGqug; Thu,  9 May 2024 20:47:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93590613C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93590613C7;
	Thu,  9 May 2024 20:47:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA6F11BF31C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13EA683FF2
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 20:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LF62KLbfivc9 for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 20:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C23B283FF6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C23B283FF6
 for <buildroot@buildroot.org>; Thu,  9 May 2024 20:46:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B968686DC9; Thu,  9 May 2024 20:46:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 22:45:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8000791e3725a6c54db6ea32b9e36ccaad53a95
X-Git-Newrev: e527bdd8a918ee90df020e4c78fd97ad76c46000
X-Patchwork-Hint: ignore
Message-Id: <20240509204628.B968686DC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board: update hashes of git archives
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

commit: https://git.buildroot.net/buildroot/commit/?id=e527bdd8a918ee90df020e4c78fd97ad76c46000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace the names of the tarballs in the hash files to -git3.

Linux and U-Boot sources do contain symlinks, so the hashes change.

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
index 06a63d449d..659be67590 100644
--- a/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
+++ b/board/acmesystems/acqua-a5/patches/at91bootstrap3/at91bootstrap3.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  cdc04cca9e811043efdea43ad203d70d897e23a8bd46f01896ba45c8df50f6ec  at91bootstrap3-v3.10.3-br1.tar.gz
+sha256  fef34111a07d9e5aa97b0840355a367f806a17e029583830e9deaa747ce47824  at91bootstrap3-v3.10.3-git3.tar.gz
diff --git a/board/radxa/rock5b/patches/linux/linux.hash b/board/radxa/rock5b/patches/linux/linux.hash
index 8797d29f68..18074c0aee 100644
--- a/board/radxa/rock5b/patches/linux/linux.hash
+++ b/board/radxa/rock5b/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  a5eca7b8f929a1918125e2e4fbd7ab4ea5b3910b5ae4547e81c794b47373ffb5  linux-52f51a2b5ba178f331af62260d2da86d7472c14b-br2.tar.gz
+sha256  255961f7ea8ea82c42f19be049f94a690f9cb171fe8562ea87868ac5cabc3eb9  linux-52f51a2b5ba178f331af62260d2da86d7472c14b-git3.tar.gz
diff --git a/board/toradex/apalis-imx6/patches/linux/linux.hash b/board/toradex/apalis-imx6/patches/linux/linux.hash
index ff2b1ea287..277abc20aa 100644
--- a/board/toradex/apalis-imx6/patches/linux/linux.hash
+++ b/board/toradex/apalis-imx6/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9c69a1c283db6ee8042cc6f013a159473f257e71751887312c7dd2902f01bec8  linux-d899927728beca8357a5b4120b690cb3c1d80844-br2.tar.gz
+sha256  41551a4f44bdfe18f68bedc0fd9c644d8657d2ee63215cc348a708cfd5b7e6f2  linux-d899927728beca8357a5b4120b690cb3c1d80844-git3.tar.gz
diff --git a/board/toradex/apalis-imx6/patches/uboot/uboot.hash b/board/toradex/apalis-imx6/patches/uboot/uboot.hash
index 80cad35849..d451219cb4 100644
--- a/board/toradex/apalis-imx6/patches/uboot/uboot.hash
+++ b/board/toradex/apalis-imx6/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9a540b08ccb7e8a0252f86d0bad5d676d0964725a7f2a06d798225c2a3024878  uboot-30a1208727729dae22cb42f9ba9ba17efe5e6f77-br2.tar.gz
+sha256  2fa23d10559c17362ef92e5d7e636b388e9af3784c9b03e86c702a71df100f36  uboot-30a1208727729dae22cb42f9ba9ba17efe5e6f77-git3.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
