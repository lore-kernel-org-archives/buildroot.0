Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A76C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E155160A71;
	Sat,  8 Jan 2022 18:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15D2ZY8UJter; Sat,  8 Jan 2022 18:07:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27F97607F9;
	Sat,  8 Jan 2022 18:07:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69C921BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5694E40127
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9p4WlqsKu21 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:07:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D8894011F
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:07:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D651882BDD; Sat,  8 Jan 2022 18:01:12 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 19:07:07 +0100
Subject: [git commit] DEVELOPERS: add entry for mali-driver to Miquèl Raynal
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ba2ee0b7a756c6499febf30f7db0346f2c1e6f2
X-Git-Newrev: d41f020bdc974a44b3e83da0daaa42ff109d157e
X-Patchwork-Hint: ignore
Message-Id: <20220108180112.D651882BDD@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============0407989534034863510=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0407989534034863510==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d41f020bdc974a44b3e83da0daaa42ff109d157e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index eb605b9170..2eeba07002 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2022,6 +2022,7 @@ N:	Min Xu <xuminready@gmail.com>
 F:	package/shadowsocks-libev/
 
 N:	Miquèl Raynal
+F:	package/mali-driver/
 F:	package/rockchip-mali/
 
 N:	Mircea Gliga <gliga.mircea@gmail.com>

--===============0407989534034863510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0407989534034863510==--
