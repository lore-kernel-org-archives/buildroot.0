Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9318EC001DB
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 19:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26E0982135;
	Thu,  3 Aug 2023 19:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26E0982135
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z25tx5vyhdM4; Thu,  3 Aug 2023 19:17:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2ED2F83F48;
	Thu,  3 Aug 2023 19:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ED2F83F48
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FD1E1BF2BD
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 19:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45346418C9
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 19:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45346418C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UvP0Hkq4trvv for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 19:17:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89F294032A
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 19:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89F294032A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 772AF841B8; Thu,  3 Aug 2023 19:17:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 3 Aug 2023 21:16:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0ff6ad7ff6fb5c4643314b9e029f81cc3b07762
X-Git-Newrev: 2672fb08730dc378079672b02aa4c1f713b186ab
X-Patchwork-Hint: ignore
Message-Id: <20230803191705.772AF841B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: sort entries of Neal Frager
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

commit: https://git.buildroot.net/buildroot/commit/?id=2672fb08730dc378079672b02aa4c1f713b186ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Neal Frager <neal.frager@amd.com>
[yann.morin.1998@free.fr: sort with LC_ALL=C]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5023ecd775..0f6cb75e0e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2182,12 +2182,11 @@ N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
 F:	board/zynq/
 F:	board/zynqmp/
-F:	board/zynqmp/kria/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc706_defconfig
+F:	configs/zynqmp_kria_kv260_defconfig
 F:	configs/zynqmp_zcu102_defconfig
 F:	configs/zynqmp_zcu106_defconfig
-F:	configs/zynqmp_kria_kv260_defconfig
 F:	package/bootgen/
 F:	package/versal-firmware/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
