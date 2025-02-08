Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E55C021A0
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 17:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06ECE41286;
	Sat,  8 Feb 2025 17:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSr_gz85biYK; Sat,  8 Feb 2025 17:05:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8511412AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8511412AE;
	Sat,  8 Feb 2025 17:05:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 255E86C
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73C80605EF
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:05:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhN2kavt_I-H for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 17:05:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 757CC600D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 757CC600D4
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 17:05:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 49D5987172; Sat,  8 Feb 2025 17:05:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Feb 2025 18:03:47 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ed17c2d17f666cb268b13ba8337a6902c77e2675
X-Git-Newrev: 4e1f339a6b885dfff408fb1419822a9ae3f5f649
X-Patchwork-Hint: ignore
Message-Id: <20250208170528.49D5987172@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: remove Chris
 Dimich
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0983900263394453011=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0983900263394453011==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4e1f339a6b885dfff408fb1419822a9ae3f5f649
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Chris email address at boundarydevices is bouncing:

Chris Dimich is no longer with Ezurio. Please contact Gary Bisson by
email at Gary.Bisson@ezurio.com. Thank you!"

Move his package to Gary Bisson as suggested.

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 892d1ae27fa394eb8b7a4e455c26a6efcc00457b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index fd17cc34b7..09082e905d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -544,9 +544,6 @@ F:	package/alsa-plugins/
 N:	Changming Huang <jerry.huang@nxp.com>
 F:	package/qoriq-cadence-dp-firmware/
 
-N:	Chris Dimich <chris.dimich@boundarydevices.com>
-F:	package/freescale-imx/imx-vpu-hantro-daemon/
-
 N:	Chris Packham <judge.packham@gmail.com>
 F:	package/coremark/
 F:	package/coremark-pro/
@@ -1139,6 +1136,7 @@ N:	Gary Bisson <bisson.gary@gmail.com>
 F:	board/boundarydevices/
 F:	configs/nitrogen*
 F:	package/freescale-imx/
+F:	package/freescale-imx/imx-vpu-hantro-daemon/
 F:	package/gstreamer1/gst1-imx/
 F:	package/libimxvpuapi/
 F:	package/mfgtools/

--===============0983900263394453011==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0983900263394453011==--
