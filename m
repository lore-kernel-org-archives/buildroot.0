Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14848C00528
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 21:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C03BA60DFF;
	Tue,  1 Aug 2023 21:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C03BA60DFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wb5WkFnlcdjJ; Tue,  1 Aug 2023 21:12:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EB5060EB3;
	Tue,  1 Aug 2023 21:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EB5060EB3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C0DF1BF408
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 760D260E74
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 21:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 760D260E74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6UMpWj0zwcxC for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 21:11:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B44960E6A
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 21:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B44960E6A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68B8283F9E; Tue,  1 Aug 2023 21:11:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Aug 2023 23:11:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a12985e5277cc47f0f68c85f8f4b11709e1a574
X-Git-Newrev: 9e69a62fe08d704c753565b03119aaadea15b0b7
X-Patchwork-Hint: ignore
Message-Id: <20230801211151.68B8283F9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Nicolas Carrier for
 package/composer/
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

commit: https://git.buildroot.net/buildroot/commit/?id=9e69a62fe08d704c753565b03119aaadea15b0b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 22d26ea961..5023ecd775 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2200,6 +2200,7 @@ F:	configs/galileo_defconfig
 
 N:	Nicolas Carrier <nicolas.carrier@orolia.com>
 F:	package/bmap-tools/
+F:	package/composer/
 F:	package/libdbi/
 F:	package/libdbi-drivers/
 F:	package/lua-augeas/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
