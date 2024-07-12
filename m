Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7328DC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38B51415DB;
	Fri, 12 Jul 2024 20:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXndlM3_l0dE; Fri, 12 Jul 2024 20:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0328941704
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0328941704;
	Fri, 12 Jul 2024 20:25:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C15861BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACF43846A5
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHGq5sstQQ1t for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:25:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 004C78469A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 004C78469A
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:25:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E82288617B; Fri, 12 Jul 2024 20:25:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 22:24:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61d04a0a738dd10bb2dd96a2e28ff3fd15e03476
X-Git-Newrev: 50049eb8a66e966f1f42fbd4494af4c4c1ec3ff3
X-Patchwork-Hint: ignore
Message-Id: <20240712202515.E82288617B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: re-add entries for
 imx8mmpico_defconfig
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

commit: https://git.buildroot.net/buildroot/commit/?id=50049eb8a66e966f1f42fbd4494af4c4c1ec3ff3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These entries should not have been removed by commit
61d04a0a738dd10bb2dd96a2e28ff3fd15e03476 ("configs/imx8mpico: remove
defconfig").

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d878e86f0e..896791cab3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1755,6 +1755,8 @@ F:	package/paho-mqtt-c
 N:	Julien Olivain <ju.o@free.fr>
 F:	board/qemu/riscv64-virt-efi/
 F:	board/spike/
+F:	board/technexion/imx8mmpico/
+F:	configs/imx8mmpico_defconfig
 F:	configs/qemu_riscv64_virt_efi_defconfig
 F:	configs/spike_riscv32_defconfig
 F:	configs/spike_riscv64_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
