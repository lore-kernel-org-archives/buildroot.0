Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4755ACAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1842C413F6;
	Wed,  1 Oct 2025 20:01:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XI1ITpCaHU3W; Wed,  1 Oct 2025 20:01:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A89F413F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A89F413F2;
	Wed,  1 Oct 2025 20:01:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0BFAED
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D06EE411EE
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljJ8TC40Nut1 for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9918E411FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9918E411FA
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 952588668C; Wed,  1 Oct 2025 20:01:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 10:24:34 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e633d453ff2bdd8b4bb66bdad2d2f830be8950a5
X-Git-Newrev: 0062ff55c5282bfc359b25d1e9eba8de636e3752
X-Patchwork-Hint: ignore
Message-Id: <20251001200129.952588668C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] DEVELOPERS: Remove
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0062ff55c5282bfc359b25d1e9eba8de636e3752
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Patches submitted to update these packages have gone ignored for
months without comment, and I no longer wish to recieve daily
emails about them being out of date.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 20f99312c9ae6b20da8a5c801d972d76c8c0784f)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 DEVELOPERS | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3dd36fe123..79cf831eb9 100644
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
@@ -42,8 +39,6 @@ F:	package/flutter-packages/flutter-rfw-local-example/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
 F:	package/ivi-homescreen/
-F:	package/libutempter/
-F:	package/tllist/
 F:	support/testing/tests/package/test_flutter.py
 
 N:	Adam Heinrich <adam@adamh.cz>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
