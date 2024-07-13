Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11A2C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B34C4098E;
	Sat, 13 Jul 2024 14:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtxGgllBuzHx; Sat, 13 Jul 2024 14:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77B69410B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77B69410B0;
	Sat, 13 Jul 2024 14:22:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D5F241BF86D
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C383760643
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:22:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7sZlMocFPNfM for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C06D60639
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C06D60639
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:22:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9C11864B3; Sat, 13 Jul 2024 14:21:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:21:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c2237dd25072236fe9a5dffd03bf2cdda71ff819
X-Git-Newrev: fd988ac2b84b15eb7b19fe514acc9bd99a159ab2
X-Patchwork-Hint: ignore
Message-Id: <20240713142159.E9C11864B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/spike/riscv64/readme.txt: update
 riscv-openocd URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=fd988ac2b84b15eb7b19fe514acc9bd99a159ab2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The URL https://github.com/riscv/riscv-openocd is now redirecting to:
https://github.com/riscv-collab/riscv-openocd

This commit updates the URL to this new location.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/spike/riscv64/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/spike/riscv64/readme.txt b/board/spike/riscv64/readme.txt
index 34db625aad..465fb06b39 100644
--- a/board/spike/riscv64/readme.txt
+++ b/board/spike/riscv64/readme.txt
@@ -28,4 +28,4 @@ https://github.com/riscv-software-src/riscv-isa-sim/tree/v1.1.0#simulating-a-new
 https://github.com/riscv-software-src/riscv-isa-sim/tree/v1.1.0#debugging-with-gdb
 
 [3].
-https://github.com/riscv/riscv-openocd
+https://github.com/riscv-collab/riscv-openocd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
