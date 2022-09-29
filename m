Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57093C433F5
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 21:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CB8584033;
	Thu, 29 Sep 2022 21:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CB8584033
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iAhkBYfc4pJk; Thu, 29 Sep 2022 21:27:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 362A784026;
	Thu, 29 Sep 2022 21:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 362A784026
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8D0411BF3D1
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E72541C3C
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E72541C3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EfEIwmcykc3c for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 21:21:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 354D041C4E
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 21:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 354D041C4E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FFB386615; Thu, 29 Sep 2022 21:21:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 23:04:31 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: e834c8c54b7927d438749913df719d8a57118d79
X-Git-Newrev: 8fda20d964c1bbb0bedbdbdf238ce2617897b08a
X-Patchwork-Hint: ignore
Message-Id: <20220929212137.2FFB386615@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] DEVELOPERS: remove Peter
 Seiderer
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

commit: https://git.buildroot.net/buildroot/commit/?id=8fda20d964c1bbb0bedbdbdf238ce2617897b08a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

No review/patches from my side the last few months, so drop my
DEVELOPERS entry.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 094e87c805e37c3981d3ef0b4e7431a25181a6c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index f0f76c7a69..1b6d7de85f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2366,41 +2366,6 @@ F:	package/wireguard-linux-compat/
 F:	package/wireguard-tools/
 F:	support/testing/tests/package/test_docker_compose.py
 
-N:	Peter Seiderer <ps.report@gmx.net>
-F:	board/raspberrypi/
-F:	configs/raspberrypi*_defconfig
-F:	package/assimp/
-F:	package/bcm2835/
-F:	package/ddrescue/
-F:	package/dejavu/
-F:	package/dillo/
-F:	package/double-conversion/
-F:	package/edid-decode/
-F:	package/ell/
-F:	package/ghostscript-fonts/
-F:	package/gstreamer1/gst1-devtools/
-F:	package/gstreamer1/gst1-interpipe/
-F:	package/gstreamer1/gstreamer1-editing-services/
-F:	package/iwd/
-F:	package/libb2/
-F:	package/libcamera-apps/
-F:	package/libevdev/
-F:	package/libuev/
-F:	package/log4cplus/
-F:	package/ntpsec/
-F:	package/postgresql/
-F:	package/python-colorzero/
-F:	package/python-flask-wtf/
-F:	package/python-gpiozero/
-F:	package/qt5/
-F:	package/quotatool/
-F:	package/racehound/
-F:	package/redir/
-F:	package/rtl8812au-aircrack-ng/
-F:	package/uredir/
-F:	package/uqmi/
-F:	package/wayland-utils/
-
 N:	Peter Thompson <peter.macleod.thompson@gmail.com>
 F:	package/sdl2_gfx/
 F:	package/sdl2_image/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
