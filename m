Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B38C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 06:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBA8441020;
	Wed, 30 Aug 2023 06:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBA8441020
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9kth4uYG-bV8; Wed, 30 Aug 2023 06:10:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03FE341562;
	Wed, 30 Aug 2023 06:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03FE341562
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97BA11BF41D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 06:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EEF560E09
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 06:10:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EEF560E09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WfyccxoItmUU for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 06:10:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9803760E50
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 06:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9803760E50
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85EAF864B3; Wed, 30 Aug 2023 06:10:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 08:09:33 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 90d46e1901ca4106c7235f41f3025326eba4cfdd
X-Git-Newrev: 1aa7d047a762a5acfc63b7682ff34224dae1da01
X-Patchwork-Hint: ignore
Message-Id: <20230830061005.85EAF864B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] DEVELOPERS: remove Bernd
 Kuhls from pixman & vnstat
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

commit: https://git.buildroot.net/buildroot/commit/?id=1aa7d047a762a5acfc63b7682ff34224dae1da01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b65f510fb6ce315957e9aed427ad5bb3db85dda6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b5ac6c17af..324fa0733c 100644
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
