Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A86C4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E41F040A1D;
	Sat, 26 Nov 2022 18:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E41F040A1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R22HWLnsQ9Af; Sat, 26 Nov 2022 18:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B009408F0;
	Sat, 26 Nov 2022 18:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B009408F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AABB1BF372
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9FCD40A03
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9FCD40A03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zoDHqnI-98eT for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:30:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63004408B2
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:30:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63004408B2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B41884700; Sat, 26 Nov 2022 18:30:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 19:22:31 +0100
Subject: [git commit branch/2022.02.x] package/mali-driver: remove Miquèl from the DEVELOPERS list
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 21c0c0ae138858c54276256281262105863b2a9b
X-Git-Newrev: da848bc81555b346ffe63afe8d0ac30326d5b088
X-Patchwork-Hint: ignore
Message-Id: <20221126183007.4B41884700@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============7828143845825656435=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7828143845825656435==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=da848bc81555b346ffe63afe8d0ac30326d5b088
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

I am not really maintaining these packages, I don't follow closely
enough nor use them to take the time to make the necessary changes.
Giulio has been much more reactive than me to fix issues and he is
already listed for them anyway.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 124fc473dd9298facc6f9fd58dd59a706550e29b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index d3dedb06f4..113d7f5ca4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2046,10 +2046,6 @@ F:	configs/bananapi_m2_plus_defconfig
 N:	Mikhail Boiko <mikhailboiko85@gmail.com>
 F:	package/libfribidi/
 
-N:	Miquèl Raynal <miquel.raynal@bootlin.com>
-F:	package/mali-driver/
-F:	package/rockchip-mali/
-
 N:	Mircea Gliga <gliga.mircea@gmail.com>
 F:	package/mbuffer/
 

--===============7828143845825656435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7828143845825656435==--
