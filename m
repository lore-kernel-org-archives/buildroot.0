Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304BAC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5F1D83F5C;
	Mon, 20 Feb 2023 23:51:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5F1D83F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6QgWQ9id_eI6; Mon, 20 Feb 2023 23:51:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32FDC83EE0;
	Mon, 20 Feb 2023 23:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32FDC83EE0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7564C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E4844178E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E4844178E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aTWsVerZnUhG for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EA2B41745
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EA2B41745
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6750086495; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 22:29:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fd1d0a9cbf6de2c30fcfcc181b466a5f2b44dc54
X-Git-Newrev: faa299ff8c94bea11345071a3d1d05c2681c2cdd
X-Patchwork-Hint: ignore
Message-Id: <20230220205244.6750086495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/beaglebone/readme.txt:
 update list of DTB files produced
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

commit: https://git.buildroot.net/buildroot/commit/?id=faa299ff8c94bea11345071a3d1d05c2681c2cdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/beaglebone/readme.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/board/beaglebone/readme.txt b/board/beaglebone/readme.txt
index 231e977a89..a11377eaee 100644
--- a/board/beaglebone/readme.txt
+++ b/board/beaglebone/readme.txt
@@ -28,6 +28,10 @@ Result of the build
 ===================
 output/images/
 +-- am335x-boneblack.dtb
++-- am335x-boneblack-wireless.dtb
++-- am335x-boneblue.dtb
++-- am335x-bonegreen.dtb
++-- am335x-bonegreen-wireless.dtb
 +-- am335x-bone.dtb
 +-- am335x-evm.dtb
 +-- am335x-evmsk.dtb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
