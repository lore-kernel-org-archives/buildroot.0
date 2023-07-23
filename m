Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0360C001DF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 17:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B668410C5;
	Sun, 23 Jul 2023 17:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B668410C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SNWXDite4Kjl; Sun, 23 Jul 2023 17:24:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D356410C0;
	Sun, 23 Jul 2023 17:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D356410C0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82E4D1BF5B5
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BA4381E33
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BA4381E33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7uHayErU5ny for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 17:24:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3AF881E2C
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 17:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3AF881E2C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93C6B82815; Sun, 23 Jul 2023 17:24:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 19:23:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15aae1902a3d47caa29bfb997a82a72194c79396
X-Git-Newrev: b65f510fb6ce315957e9aed427ad5bb3db85dda6
X-Patchwork-Hint: ignore
Message-Id: <20230723172421.93C6B82815@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Bernd Kuhls from pixman
 & vnstat
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

commit: https://git.buildroot.net/buildroot/commit/?id=b65f510fb6ce315957e9aed427ad5bb3db85dda6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index bcbacc5665..c690f1dac7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -442,7 +442,6 @@ F:	package/perl-timedate/
 F:	package/perl-uri/
 F:	package/perl-www-robotrules/
 F:	package/php/
-F:	package/pixman/
 F:	package/pngquant/
 F:	package/pppd/
 F:	package/privoxy/
@@ -474,7 +473,6 @@ F:	package/transmission/
 F:	package/tvheadend/
 F:	package/unixodbc/
 F:	package/vlc/
-F:	package/vnstat/
 F:	package/wget/
 F:	package/wireless-regdb/
 F:	package/wireless_tools/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
