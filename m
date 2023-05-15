Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0898C7EE22
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 15:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73F4040129;
	Mon, 15 May 2023 15:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73F4040129
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CfRg1p0TN3FZ; Mon, 15 May 2023 15:53:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CF5941D8C;
	Mon, 15 May 2023 15:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CF5941D8C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1DA1B1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 15:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9DDA410C8
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 15:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9DDA410C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2N-I8_x6Z5JX for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 15:53:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17653409AD
 for <buildroot@buildroot.org>; Mon, 15 May 2023 15:53:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17653409AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 04F8D86705; Mon, 15 May 2023 15:53:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 15 May 2023 17:52:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f4fb695a47cb50a0645a68aa03e27bdb3d73afe
X-Git-Newrev: 7e655f81d43c0776567c1fc6d3815cc3b63e93a0
X-Patchwork-Hint: ignore
Message-Id: <20230515155321.04F8D86705@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Update email address for
 Damien Le Moal
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e655f81d43c0776567c1fc6d3815cc3b63e93a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Change my email address to dlemoal@kernel.org.

Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index fef008f84b..e76717e845 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -662,7 +662,7 @@ N:	Damien Lanson <damien@kal-host.com>
 F:	package/libvdpau/
 F:	package/log4cpp/
 
-N:	Damien Le Moal <damien.lemoal@wdc.com>
+N:	Damien Le Moal <dlemoal@kernel.org>
 F:	package/python-kflash/
 F:	board/canaan/
 F:	configs/canaan_kd233_defconfig
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
