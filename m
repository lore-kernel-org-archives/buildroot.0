Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FB0C282DE
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 20:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EE2E40486;
	Thu, 13 Mar 2025 20:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTBolMehS9RN; Thu, 13 Mar 2025 20:47:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 092424177E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 092424177E;
	Thu, 13 Mar 2025 20:47:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48C5D116
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3921A60630
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ecdym9AhkzD1 for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 20:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47953610DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47953610DE
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:47:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34DE887FAC; Thu, 13 Mar 2025 20:47:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Mar 2025 21:42:38 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d976cec1be8ed1b97b8141bd000aec66ae9dc58f
X-Git-Newrev: be2a4ed89abc4e8476bc3e6fb4726790a220546a
X-Patchwork-Hint: ignore
Message-Id: <20250313204703.34DE887FAC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: put Andreas
 Naumann at the right place
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=be2a4ed89abc4e8476bc3e6fb4726790a220546a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c0aae3e42403277d033e371d49b1cb27954a28a7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 09082e905d..ace35117d6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -166,6 +166,12 @@ F:	package/wine/
 N:	Andreas Klinger <ak@it-klinger.de>
 F:	package/ply/
 
+N:	Andreas Naumann <ANaumann@ultratronik.de>
+F:	package/evemu/
+F:	package/libevdev/
+F:	package/pkg-qmake.mk
+F:	package/qt5/qt5opcua/
+
 N:	Andreas Ziegler <br015@umbiko.net>
 F:	package/mpd/
 
@@ -2282,12 +2288,6 @@ N:	Nathaniel Roach <nroach44@gmail.com>
 F:	package/bandwidthd/
 F:	package/libgudev/
 
-N:	Naumann Andreas <ANaumann@ultratronik.de>
-F:	package/evemu/
-F:	package/libevdev/
-F:	package/pkg-qmake.mk
-F:	package/qt5/qt5opcua/
-
 N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
 F:	board/zynq/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
