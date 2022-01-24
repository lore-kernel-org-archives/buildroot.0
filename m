Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5BBC433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B4A060EC5;
	Mon, 24 Jan 2022 17:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dKyEkA4gWLD6; Mon, 24 Jan 2022 17:37:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4E7960A79;
	Mon, 24 Jan 2022 17:37:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F6871BF487
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A48040209
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s9f5mxskTuup for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:36:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7802040213
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:36:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CF5EC82BCC; Mon, 24 Jan 2022 17:29:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 18:27:01 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 4294adf244cd5083ba957a106c4a13562692367d
X-Git-Newrev: eb96c11e6f5eb3dc0384657fe2dacbcdf4d6e4d6
X-Patchwork-Hint: ignore
Message-Id: <20220124172936.CF5EC82BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] DEVELOPERS: remove Ryan
 Barnett
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb96c11e6f5eb3dc0384657fe2dacbcdf4d6e4d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

His e-mail address is bouncing (and we have some private information
that explains why):

Ryan Barnett (ryan.barnett@collins.com)<mailto:ryan.barnett@collins.com>
The recipient won't be able to receive this message because it's too large.

The maximum message size that's allowed is 1 KB. This message is 7 KB.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 287601459e15c683feb9517092d8d50099b09915)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index e1e526a666..9108d11f3c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2284,18 +2284,6 @@ F:	support/testing/tests/package/test_glxinfo.py
 F:	support/testing/tests/package/test_openssh.py
 F:	toolchain/
 
-N:	Ryan Barnett <ryan.barnett@collins.com>
-F:	package/atftp/
-F:	package/c-periphery/
-F:	package/miraclecast/
-F:	package/opkg/
-F:	package/opkg-utils/
-F:	package/python-pysnmp/
-F:	package/python-pysnmp-mibs/
-F:	package/python-tornado/
-F:	package/resiprocate/
-F:	package/websocketpp/
-
 N:	Ryan Wilkins <ryan@deadfrog.net>
 F:	package/biosdevname/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
