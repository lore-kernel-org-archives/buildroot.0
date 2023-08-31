Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAFAC83F12
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 12:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DBD8813FE;
	Thu, 31 Aug 2023 12:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DBD8813FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o03LKCCk1Kbu; Thu, 31 Aug 2023 12:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A358B80FF9;
	Thu, 31 Aug 2023 12:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A358B80FF9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8C51BF990
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 12:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBF3A830FB
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 12:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBF3A830FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LDqheqkWGCxH for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 12:23:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B5168308A
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 12:23:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B5168308A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A840866F4; Thu, 31 Aug 2023 12:23:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 13:10:38 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 5ad971ee08e738174a802e519a964e5eee20bf04
X-Git-Newrev: 560c4a0d03bc47995d8be88273abf28b3ed0ac9d
X-Patchwork-Hint: ignore
Message-Id: <20230831122322.2A840866F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] DEVELOPERS: sort entries
 of Neal Frager
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

commit: https://git.buildroot.net/buildroot/commit/?id=560c4a0d03bc47995d8be88273abf28b3ed0ac9d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Neal Frager <neal.frager@amd.com>
[yann.morin.1998@free.fr: sort with LC_ALL=C]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2672fb08730dc378079672b02aa4c1f713b186ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 31f108fed0..4e25d04952 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2136,12 +2136,11 @@ N:	Neal Frager <neal.frager@amd.com>
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
