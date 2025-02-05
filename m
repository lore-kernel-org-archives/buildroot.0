Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0224DC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 13:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFCA4812FC;
	Wed,  5 Feb 2025 13:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6exRe9nV6EAc; Wed,  5 Feb 2025 13:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C178F8156C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C178F8156C;
	Wed,  5 Feb 2025 13:49:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ECE712F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EBF9607DB
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSjpZthGszh8 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 13:49:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BB2F6070E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BB2F6070E
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 13:49:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BEBF87069; Wed,  5 Feb 2025 13:49:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 14:49:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fcfec83410c470bc38d6d43461fead1832d9cef
X-Git-Newrev: 892d1ae27fa394eb8b7a4e455c26a6efcc00457b
X-Patchwork-Hint: ignore
Message-Id: <20250205134955.8BEBF87069@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Chris Dimich
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5386834425735535677=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5386834425735535677==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=892d1ae27fa394eb8b7a4e455c26a6efcc00457b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Chris email address at boundarydevices is bouncing:

Chris Dimich is no longer with Ezurio. Please contact Gary Bisson by
email at Gary.Bisson@ezurio.com. Thank you!"

Move his package to Gary Bisson as suggested.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1264c26fbd..aca1b3d04b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -602,9 +602,6 @@ F:	package/alsa-plugins/
 N:	Changming Huang <jerry.huang@nxp.com>
 F:	package/qoriq-cadence-dp-firmware/
 
-N:	Chris Dimich <chris.dimich@boundarydevices.com>
-F:	package/freescale-imx/imx-vpu-hantro-daemon/
-
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/coremark/
 F:	package/coremark-pro/
@@ -1222,6 +1219,7 @@ N:	Gary Bisson <bisson.gary@gmail.com>
 F:	board/boundarydevices/
 F:	configs/nitrogen*
 F:	package/freescale-imx/
+F:	package/freescale-imx/imx-vpu-hantro-daemon/
 F:	package/gstreamer1/gst1-imx/
 F:	package/libimxvpuapi/
 F:	package/mfgtools/

--===============5386834425735535677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5386834425735535677==--
