Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA440C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 12:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25F1840327;
	Sat, 15 Oct 2022 12:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25F1840327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6sFtPIfp1UY; Sat, 15 Oct 2022 12:49:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2559C402CE;
	Sat, 15 Oct 2022 12:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2559C402CE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 113BD1BF5F8
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 12:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1BA540522
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 12:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1BA540522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6SGlb7WXidtn for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 12:49:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E34740125
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 12:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E34740125
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CDB8864DF; Sat, 15 Oct 2022 12:49:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 14:45:59 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 678bf71778b102bcb88a5d2802ad8bf43d16fe16
X-Git-Newrev: a6e5b67d7c46325ea14447e3f9237514386a345e
X-Patchwork-Hint: ignore
Message-Id: <20221015124918.1CDB8864DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] DEVELOPERS: remove Joerg
 Krause
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
Content-Type: multipart/mixed; boundary="===============8833658901844430457=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8833658901844430457==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a6e5b67d7c46325ea14447e3f9237514386a345e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

His e-mail server is no longer responsive. Every single day, we get:

<joerg.krause@embedded.rocks>: connect to embedded.rocks[99.83.154.118]:25:
    Connection timed out

when sending the daily autobuilder report.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c6b987f39ddd2abbce526021ccb39bd42e50fa23)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index af21b8bdd0..c7d408dab7 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1567,23 +1567,6 @@ N:	Joris Offouga <offougajoris@gmail.com>
 F:	package/python-colorlog/
 F:	package/python-simplelogging/
 
-N:	Jörg Krause <joerg.krause@embedded.rocks>
-F:	board/lemaker/bananapro/
-F:	configs/bananapro_defconfig
-F:	package/augeas/
-F:	package/bluez-alsa/
-F:	package/caps/
-F:	package/freescale-imx/imx-alsa-plugins/
-F:	package/libopusenc/
-F:	package/libupnpp/
-F:	package/luv/
-F:	package/luvi/
-F:	package/mpd/
-F:	package/shairport-sync/
-F:	package/swupdate/
-F:	package/upmpdcli/
-F:	package/wavemon/
-
 N:	Joris Lijssens <joris.lijssens@gmail.com>
 F:	package/emlog/
 F:	package/libcoap/

--===============8833658901844430457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8833658901844430457==--
