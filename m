Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22867C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 12:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FC1A405F6;
	Sat, 15 Oct 2022 12:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FC1A405F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J4TneB3QGrR4; Sat, 15 Oct 2022 12:49:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91F3840235;
	Sat, 15 Oct 2022 12:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F3840235
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F7821BF962
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 12:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEAE560784
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 12:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEAE560784
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y35-S0KfEe74 for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 12:49:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 398C160777
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 12:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 398C160777
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27949864E0; Sat, 15 Oct 2022 12:49:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 14:48:55 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: a6e5b67d7c46325ea14447e3f9237514386a345e
X-Git-Newrev: c45cbea560280327a4667d166e8f0cd709a4c55d
X-Patchwork-Hint: ignore
Message-Id: <20221015124918.27949864E0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] DEVELOPERS: remove
 Nicolas Tran
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c45cbea560280327a4667d166e8f0cd709a4c55d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Nicolas Tran is apparently no longer at Smile:

The response from the remote server was:
450 4.1.1 <nicolas.tran@smile.fr>: Recipient address rejected: User unknown in virtual mailbox table

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e4ecf82f99f53e55d51e6f74ae5021473aa2bb1d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c7d408dab7..81f33fe117 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2210,10 +2210,6 @@ N:	Nicolas Serafini <nicolas.serafini@ik.me>
 F:	package/exiv2/
 F:	package/ofono/
 
-N:	Nicolas Tran <nicolas.tran@smile.fr>
-F:	package/dust/
-F:	package/hyperfine/
-
 N:	Niklas Cassel <niklas.cassel@wdc.com>
 F:	configs/qemu_riscv64_nommu_virt_defconfig
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
