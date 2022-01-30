Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A51C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 13:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D479F8195C;
	Sun, 30 Jan 2022 13:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHfznxzAemso; Sun, 30 Jan 2022 13:53:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38A1E812D3;
	Sun, 30 Jan 2022 13:53:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 790BB1BF592
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 13:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6669340111
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 13:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6FasKpvlNk9Y for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 13:53:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C2E5400D0
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 13:53:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E8B2E82A6F; Sun, 30 Jan 2022 13:46:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 14:43:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4bdbc7c505157d0039d1010e67f653b0f89b945
X-Git-Newrev: 73ce754531b5e45bd42b56c58718fbacc754406f
X-Patchwork-Hint: ignore
Message-Id: <20220130134605.E8B2E82A6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add entry for libqmi and
 libqrtr-glib to Yegor Yefremov
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

commit: https://git.buildroot.net/buildroot/commit/?id=73ce754531b5e45bd42b56c58718fbacc754406f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a4b4fa2f70..e17803f38a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3002,6 +3002,8 @@ F:	package/libical/
 F:	package/libmbim/
 F:	package/libndp/
 F:	package/libnftnl/
+F:	package/libqmi/
+F:	package/libqrtr-glib/
 F:	package/libsoc/
 F:	package/libsocketcan/
 F:	package/libubox/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
