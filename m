Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BF2C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 21:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B7C06117F;
	Mon, 30 Jan 2023 21:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B7C06117F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQv6FzO6eR0J; Mon, 30 Jan 2023 21:30:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C8426177C;
	Mon, 30 Jan 2023 21:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C8426177C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 479421BF44A
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FBF761096
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 21:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FBF761096
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rmot0P1eWpFH for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 21:30:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7908561374
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 21:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7908561374
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66F9C825BA; Mon, 30 Jan 2023 21:30:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 22:29:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd1d0a9cbf6de2c30fcfcc181b466a5f2b44dc54
X-Git-Newrev: faa299ff8c94bea11345071a3d1d05c2681c2cdd
X-Patchwork-Hint: ignore
Message-Id: <20230130213019.66F9C825BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/beaglebone/readme.txt: update list
 of DTB files produced
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
