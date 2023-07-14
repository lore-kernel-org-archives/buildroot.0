Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398E9C001DD
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:15:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E36B861443;
	Fri, 14 Jul 2023 10:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E36B861443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wgwFUnZk_oSv; Fri, 14 Jul 2023 10:15:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31E0761440;
	Fri, 14 Jul 2023 10:15:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31E0761440
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11B311BF98D
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC9C260A9F
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC9C260A9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p1ucUCnGYhnG for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:14:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 100B861415
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:14:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 100B861415
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3A3787070; Fri, 14 Jul 2023 10:14:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 12:04:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0ca839ab193a46ed215df9235554458b6c81f21
X-Git-Newrev: a1a2bfa429ebeb061059a00fdb6c2f9def494c78
X-Patchwork-Hint: ignore
Message-Id: <20230714101440.F3A3787070@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update entry for Daniel Lang
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a1a2bfa429ebeb061059a00fdb6c2f9def494c78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b7c9fa8c27..1021e5c6ba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -649,7 +649,7 @@ F:	package/odroidc2-firmware/
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
 
-N:	Daniel Lang <d.lang@abatec.at>
+N:	Daniel Lang <dalang@gmx.at>
 F:	package/atkmm/
 F:	package/atkmm2_28/
 F:	package/cairomm/
@@ -663,6 +663,7 @@ F:	package/libsigc2/
 F:	package/paho-mqtt-cpp/
 F:	package/pangomm/
 F:	package/pangomm2_46/
+F:	package/sam-ba/
 
 N:	Damien Lanson <damien@kal-host.com>
 F:	package/libvdpau/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
