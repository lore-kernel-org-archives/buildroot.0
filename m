Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AB2C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 17:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 459B9812F2;
	Fri,  7 Jan 2022 17:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ord6OSGO-pQO; Fri,  7 Jan 2022 17:49:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80E0A813B9;
	Fri,  7 Jan 2022 17:49:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B1F11C116E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0532C400E5
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 17:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id THyb1BR1uW99 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 17:49:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D55540002
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 17:49:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CF1A983493; Fri,  7 Jan 2022 17:43:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 18:49:21 +0100
Subject: [git commit] DEVELOPERS: remove qt5webkit-examples entry from Gaël Portay
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfce8d765cc8c7e1452493b7c02a8c014d2a6f1f
X-Git-Newrev: 07e0923b58c9dd0788c012f5106491c0acff56d5
X-Patchwork-Hint: ignore
Message-Id: <20220107174320.CF1A983493@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============0259836072344155359=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0259836072344155359==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=07e0923b58c9dd0788c012f5106491c0acff56d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This causes warning on ./utils/get-developers:
WARNING: 'package/qt5/qt5webkit-examples/' doesn't match any file
because 'package/qt5/qt5webkit-examples/' has been removed, so let's remove
its entry in this file.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3d5c01f795..630196fd54 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1021,7 +1021,6 @@ N:	Gaël Portay <gael.portay@collabora.com>
 F:	package/qt5/qt5virtualkeyboard/
 F:	package/qt5/qt5webengine/
 F:	package/qt5/qt5webkit/
-F:	package/qt5/qt5webkit-examples/
 
 N:	Gao Xiang <hsiangkao@aol.com>
 F:	package/erofs-utils/

--===============0259836072344155359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0259836072344155359==--
