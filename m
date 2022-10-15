Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEDBC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 12:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81FF940554;
	Sat, 15 Oct 2022 12:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81FF940554
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OmbAvfaFR3y9; Sat, 15 Oct 2022 12:50:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EEDA404EC;
	Sat, 15 Oct 2022 12:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EEDA404EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 42B681BF963
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 12:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C4D540522
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 12:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C4D540522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pjrspqN3UY4R for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 12:50:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5967840125
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 12:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5967840125
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 496008669C; Sat, 15 Oct 2022 12:50:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 14:46:06 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0fed79d6c7f3d1027da7801926758b4ba57b693e
X-Git-Newrev: 75368d47446534a1cd8f0d932882f61df9d35eb3
X-Patchwork-Hint: ignore
Message-Id: <20221015125023.496008669C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: remove Joerg
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
Content-Type: multipart/mixed; boundary="===============1974473579756669737=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1974473579756669737==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=75368d47446534a1cd8f0d932882f61df9d35eb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index 55e81be072..91707bbc4a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1502,23 +1502,6 @@ N:	Joris Offouga <offougajoris@gmail.com>
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

--===============1974473579756669737==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1974473579756669737==--
