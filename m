Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B369CAC5BA
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 19:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48B5F614D6;
	Thu, 25 Sep 2025 19:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOSSoM28VO5Y; Thu, 25 Sep 2025 19:03:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7831B614C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7831B614C8;
	Thu, 25 Sep 2025 19:03:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 53279199
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 39A4E8416A
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tly2u08t_whG for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 19:03:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46B3884311
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46B3884311
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 19:03:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30E3386386; Thu, 25 Sep 2025 19:03:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 20:58:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0ed51ca8b9ec854caf33c7698d09fa8526f2c55
X-Git-Newrev: 20f99312c9ae6b20da8a5c801d972d76c8c0784f
X-Patchwork-Hint: ignore
Message-Id: <20250925190345.30E3386386@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: Remove
 adam.duskett@amarulasolutions from sway packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=20f99312c9ae6b20da8a5c801d972d76c8c0784f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches submitted to update these packages have gone ignored for
months without comment, and I no longer wish to recieve daily
emails about them being out of date.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9094973fdf..fc561eb1ea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -28,9 +28,6 @@
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
 F:	package/depot-tools/
-F:	package/dmenu-wayland/
-F:	package/fcft/
-F:	package/foot/
 F:	package/flutter-engine/
 F:	package/flutter-packages/
 F:	package/flutter-packages/flutter-adaptive-scaffold-example/
@@ -42,9 +39,7 @@ F:	package/flutter-packages/flutter-rfw-local-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/ivi-homescreen/
-F:	package/libutempter/
 F:	package/mender-update-modules/
-F:	package/tllist/
 F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Heinrich <adam@adamh.cz>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
