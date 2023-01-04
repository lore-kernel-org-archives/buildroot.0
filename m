Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C38C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 14:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A70B440597;
	Wed,  4 Jan 2023 14:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A70B440597
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i8joStL07nnA; Wed,  4 Jan 2023 14:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F18CA40567;
	Wed,  4 Jan 2023 14:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F18CA40567
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B98971BF95E
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 14:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9439B41720
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 14:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9439B41720
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1bDk4osL2J03 for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 14:32:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B21584098F
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 14:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B21584098F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F4A9874FB; Wed,  4 Jan 2023 14:32:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 15:30:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5bdcb4cc562942cac592519c710bc67d1decf8e
X-Git-Newrev: 6f02b4ba5d17922e52d17f00c3ecaa40563522f4
X-Patchwork-Hint: ignore
Message-Id: <20230104143228.9F4A9874FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Julien Olivain for
 package/gnupg2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f02b4ba5d17922e52d17f00c3ecaa40563522f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8399dcc7af..86e3f0e7b1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1682,6 +1682,7 @@ F:	configs/spike_riscv64_defconfig
 F:	configs/zynq_qmtech_defconfig
 F:	package/fluid-soundfont/
 F:	package/fluidsynth/
+F:	package/gnupg2/
 F:	package/glslsandbox-player/
 F:	package/octave/
 F:	package/ola/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
