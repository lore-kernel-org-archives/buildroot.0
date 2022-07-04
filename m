Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC61C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 07:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FC2040441;
	Mon,  4 Jul 2022 07:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FC2040441
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IjfCcDzjLuCG; Mon,  4 Jul 2022 07:51:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AFA24032E;
	Mon,  4 Jul 2022 07:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AFA24032E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 419611BF36B
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 07:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2688240986
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 07:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2688240986
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLsvm739LqM0 for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 07:51:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4AA0C40984
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 07:51:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AA0C40984
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3B2DF81F75; Mon,  4 Jul 2022 07:38:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Jul 2022 09:50:43 +0200
Subject: [git commit] DEVELOPERS: drop Gaël Portay
X-Git-Refname: refs/heads/master
X-Git-Oldrev: faeebe0858f40d18d7527b7d1de6a6868004c9e6
X-Git-Newrev: 91562c9045eabe50b1bf78d6cde9820a34a21391
X-Patchwork-Hint: ignore
Message-Id: <20220704073820.3B2DF81F75@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============0439652343579262968=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0439652343579262968==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=91562c9045eabe50b1bf78d6cde9820a34a21391
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gaël Portay is apparently no longer at Collabora:

<gael.portay@collabora.com>: host mail.collabora.co.uk[46.235.227.172] said:
    550 5.1.1 <gael.portay@collabora.com>: Recipient address rejected: User
    unknown in local recipient table (in reply to RCPT TO command)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c3312eec34..0afd697b6c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1055,11 +1055,6 @@ F: 	package/elixir/
 F:	package/libmodsecurity/
 F:	package/nginx-modsecurity/
 
-N:	Gaël Portay <gael.portay@collabora.com>
-F:	package/qt5/qt5virtualkeyboard/
-F:	package/qt5/qt5webengine/
-F:	package/qt5/qt5webkit/
-
 N:	Gao Xiang <hsiangkao@aol.com>
 F:	package/erofs-utils/
 

--===============0439652343579262968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0439652343579262968==--
