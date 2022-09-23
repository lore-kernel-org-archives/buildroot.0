Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E8CC07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D98BF41053;
	Fri, 23 Sep 2022 21:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D98BF41053
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a3cPkv15iQLl; Fri, 23 Sep 2022 21:36:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B37E4108D;
	Fri, 23 Sep 2022 21:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B37E4108D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46A3C1C2744
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2236640151
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2236640151
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IrlcYzjQ-TX0 for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:36:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 372544013B
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 372544013B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2316D85F1A; Fri, 23 Sep 2022 21:36:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 23:32:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccc1cc949094c408169d5be845aff8bb6f39fb7a
X-Git-Newrev: 094e87c805e37c3981d3ef0b4e7431a25181a6c2
X-Patchwork-Hint: ignore
Message-Id: <20220923213617.2316D85F1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Peter Seiderer
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

commit: https://git.buildroot.net/buildroot/commit/?id=094e87c805e37c3981d3ef0b4e7431a25181a6c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No review/patches from my side the last few months, so drop my
DEVELOPERS entry.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3de63ea72f..8d0e1282f5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2375,41 +2375,6 @@ F:	package/wireguard-linux-compat/
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
