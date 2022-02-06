Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19FAC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B79A40289;
	Sun,  6 Feb 2022 14:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VNQYeZ_wXfwl; Sun,  6 Feb 2022 14:27:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CDE2400C1;
	Sun,  6 Feb 2022 14:27:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 458F11BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 33FD0813C3
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:26:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFIPafFDtKTW for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:26:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ECC4813C0
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:26:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 048C182627; Sun,  6 Feb 2022 14:19:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 15:23:48 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 323ae1e681c24babfb375cb46bc81df551a3e0b7
X-Git-Newrev: b2f57d410a940ff719ad5691b575a3f0499ef7b7
X-Patchwork-Hint: ignore
Message-Id: <20220206141937.048C182627@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] DEVELOPERS: add entry for
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2f57d410a940ff719ad5691b575a3f0499ef7b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b4bdbc7c505157d0039d1010e67f653b0f89b945)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e2c0f4d521..d45cfc5572 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2886,6 +2886,7 @@ F:	package/circus/
 F:	package/dhcpcd/
 F:	package/feh/
 F:	package/giblib/
+F:	package/hostapd/
 F:	package/imlib2/
 F:	package/jquery-datetimepicker/
 F:	package/jquery-sidebar/
@@ -2914,6 +2915,7 @@ F:	package/swig/
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
