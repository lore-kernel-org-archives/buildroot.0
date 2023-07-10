Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B9FEB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 21:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DFF541803;
	Mon, 10 Jul 2023 21:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DFF541803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FZHcR-cKpyb8; Mon, 10 Jul 2023 21:45:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7979418C0;
	Mon, 10 Jul 2023 21:45:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7979418C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A7291BF33B
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E617A81EE4
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 21:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E617A81EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ne7fnU1IeEu for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 21:45:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AAB781FB4
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 21:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AAB781FB4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27A0A86D3D; Mon, 10 Jul 2023 21:45:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Jul 2023 23:43:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b774048be6292bb61f90759ad3b7b58a33a1650
X-Git-Newrev: 10dbb664e50e75ce7df2732d3cb483817147ffbf
X-Patchwork-Hint: ignore
Message-Id: <20230710214523.27A0A86D3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Remove Michael Rommel
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

commit: https://git.buildroot.net/buildroot/commit/?id=10dbb664e50e75ce7df2732d3cb483817147ffbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removal requested via email:

could you somehow please remove me as maintainer from this package.
I am since many years not using builtroot anymore and have no longer
systems with which I could do patch requests.
I am going into retirement.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3237c90c39..95f5305d6c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2079,11 +2079,6 @@ F:	package/protobuf/
 F:	package/re2/
 F:	package/spdlog/
 
-N:	Michael Rommel <rommel@layer-7.net>
-F:	package/knock/
-F:	package/python-crc16/
-F:	package/python-pyzmq/
-
 N:	Michael Trimarchi <michael@amarulasolutions.com>
 F:	board/bsh/
 F:	configs/imx8mn_bsh_smm_s2_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
