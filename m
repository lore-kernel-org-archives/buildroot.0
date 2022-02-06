Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAE2C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:26:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09E77813CB;
	Sun,  6 Feb 2022 14:26:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TQ5G6t03321e; Sun,  6 Feb 2022 14:26:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55D6D813C0;
	Sun,  6 Feb 2022 14:26:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 939271BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82081402F8
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M5srRNNKCgNf for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:26:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB97E4029D
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:26:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5635582627; Sun,  6 Feb 2022 14:19:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 15:24:01 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: af67915161af4243cfdbd81408cd6ba64a8438eb
X-Git-Newrev: 72f648703e41ffc1268a57985e113a53fabc65e2
X-Patchwork-Hint: ignore
Message-Id: <20220206141931.5635582627@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: add entry for
 hostapd and wpa_supplicant to Yegor Yefremov
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

commit: https://git.buildroot.net/buildroot/commit/?id=72f648703e41ffc1268a57985e113a53fabc65e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b4bdbc7c505157d0039d1010e67f653b0f89b945)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 57e4592b4a..bd1d2eca6b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2743,6 +2743,7 @@ F:	package/circus/
 F:	package/dhcpcd/
 F:	package/feh/
 F:	package/giblib/
+F:	package/hostapd/
 F:	package/imlib2/
 F:	package/jquery-datetimepicker/
 F:	package/jquery-sidebar/
@@ -2771,6 +2772,7 @@ F:	package/swig/
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
