Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05B2C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 13:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 289A1400D0;
	Sun, 30 Jan 2022 13:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pCWrCJqEF9MT; Sun, 30 Jan 2022 13:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2CE6340111;
	Sun, 30 Jan 2022 13:53:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CF1D1BF592
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 13:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9480683E75
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 13:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hmjIMAkPUOn6 for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 13:53:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A48F83E5A
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 13:53:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E006B82870; Sun, 30 Jan 2022 13:46:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 14:43:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5777d6e725fb4ecc25e16f15ac764de03939202f
X-Git-Newrev: b4bdbc7c505157d0039d1010e67f653b0f89b945
X-Patchwork-Hint: ignore
Message-Id: <20220130134605.E006B82870@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add entry for hostapd and
 wpa_supplicant to Yegor Yefremov
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4bdbc7c505157d0039d1010e67f653b0f89b945
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fe8de1916e..a4b4fa2f70 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2992,6 +2992,7 @@ F:	package/circus/
 F:	package/dhcpcd/
 F:	package/feh/
 F:	package/giblib/
+F:	package/hostapd/
 F:	package/imlib2/
 F:	package/jquery-datetimepicker/
 F:	package/jquery-sidebar/
@@ -3020,6 +3021,7 @@ F:	package/swig/
 F:	package/qt5/qt5serialbus/
 F:	package/sdparm/
 F:	package/ti-utils/
+F:	package/wpa_supplicant/
 F:	package/x11r7/xapp_xconsole/
 F:	package/x11r7/xapp_xinput-calibrator/
 F:	package/zlog/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
