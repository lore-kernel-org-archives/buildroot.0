Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6843C04A94
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 22:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 633464038C;
	Mon,  7 Aug 2023 22:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 633464038C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LcKdKUbPjLwv; Mon,  7 Aug 2023 22:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60773401F0;
	Mon,  7 Aug 2023 22:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60773401F0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 025271BF28E
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEA78813E6
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 22:05:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEA78813E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eSQaJWlNuCPT for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 22:05:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BE378136F
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 22:05:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BE378136F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFBD0847BB; Mon,  7 Aug 2023 22:05:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 8 Aug 2023 00:03:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1ce9474e40f731f327035d8c0962abb16f00ff7
X-Git-Newrev: 7dc8dffe3a83dbd33abb0a0c7c3a24ce5cfe73cb
X-Patchwork-Hint: ignore
Message-Id: <20230807220505.EFBD0847BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/zynq/post-image.sh: correct comment
 text
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

commit: https://git.buildroot.net/buildroot/commit/?id=7dc8dffe3a83dbd33abb0a0c7c3a24ce5cfe73cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/zynq/post-image.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/zynq/post-image.sh b/board/zynq/post-image.sh
index 627c8ac41a..192354b5be 100755
--- a/board/zynq/post-image.sh
+++ b/board/zynq/post-image.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# By default U-Boot loads DTB from a file named "devicetree.dtb", so
+# By default U-Boot loads DTB from a file named "system.dtb", so
 # let's use a symlink with that name that points to the *first*
 # devicetree listed in the config.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
