Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E0EC32771
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 07:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CAEC81CE1;
	Wed, 28 Sep 2022 07:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CAEC81CE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bTG-tf_vkjJ; Wed, 28 Sep 2022 07:04:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7B1781B25;
	Wed, 28 Sep 2022 07:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7B1781B25
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 807AF1C1135
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 07:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6824E410DE
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 07:04:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6824E410DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjMA9YtCbV_D for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 07:04:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 526DE410E3
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 07:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 526DE410E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C6D386402; Wed, 28 Sep 2022 07:04:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Sep 2022 09:03:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 358f4a013453a5fdd5f353fe10b412362bedef33
X-Git-Newrev: c6b987f39ddd2abbce526021ccb39bd42e50fa23
X-Patchwork-Hint: ignore
Message-Id: <20220928070417.3C6D386402@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Joerg Krause
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
Content-Type: multipart/mixed; boundary="===============8833672386831482196=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8833672386831482196==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=c6b987f39ddd2abbce526021ccb39bd42e50fa23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

His e-mail server is no longer responsive. Every single day, we get:

<joerg.krause@embedded.rocks>: connect to embedded.rocks[99.83.154.118]:25:
    Connection timed out

when sending the daily autobuilder report.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 51d025173a..eceb44ca86 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1577,23 +1577,6 @@ N:	Joris Offouga <offougajoris@gmail.com>
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

--===============8833672386831482196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8833672386831482196==--
