Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FB7C3DA5D
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 20:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4550240E91;
	Wed, 17 Jul 2024 20:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0ap76PGkvCK; Wed, 17 Jul 2024 20:55:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FBBB40C6F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8FBBB40C6F;
	Wed, 17 Jul 2024 20:55:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E67211BF846
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 20:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E106B608C1
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 20:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7al8yz-HViyl for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 20:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E0B56069B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E0B56069B
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 20:55:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7BCB786CE4; Wed, 17 Jul 2024 20:55:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 22:53:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d9ada3c7cd8fb30fa1f98fb464421bce7d082eb
X-Git-Newrev: c0aae3e42403277d033e371d49b1cb27954a28a7
X-Patchwork-Hint: ignore
Message-Id: <20240717205505.7BCB786CE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: put Andreas Naumann at the
 right place
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

commit: https://git.buildroot.net/buildroot/commit/?id=c0aae3e42403277d033e371d49b1cb27954a28a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9462fe0459..08c120a60f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -174,6 +174,13 @@ F:	package/wine/
 N:	Andreas Klinger <ak@it-klinger.de>
 F:	package/ply/
 
+N:	Andreas Naumann <ANaumann@ultratronik.de>
+F:	package/evemu/
+F:	package/libevdev/
+F:	package/pkg-qmake.mk
+F:	package/qt5/qt5opcua/
+F:	package/qt6/qt6opcua/
+
 N:	Andreas Ziegler <br015@umbiko.net>
 F:	package/mpd/
 
@@ -2379,13 +2386,6 @@ N:	Nathaniel Roach <nroach44@gmail.com>
 F:	package/bandwidthd/
 F:	package/libgudev/
 
-N:	Naumann Andreas <ANaumann@ultratronik.de>
-F:	package/evemu/
-F:	package/libevdev/
-F:	package/pkg-qmake.mk
-F:	package/qt5/qt5opcua/
-F:	package/qt6/qt6opcua/
-
 N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
 F:	board/xilinx/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
