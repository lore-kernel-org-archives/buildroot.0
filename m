Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29247C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 08:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A5FB60E37;
	Mon, 27 Dec 2021 08:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vqLUjgeSTbR; Mon, 27 Dec 2021 08:52:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1751860E31;
	Mon, 27 Dec 2021 08:52:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C82131BF36A
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 08:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B069160E31
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 08:52:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YHTWebqUgS6r for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 08:52:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A9A460E2B
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 08:52:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4C44B82975; Mon, 27 Dec 2021 08:46:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 09:51:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f9f84b6ba751c987b6de164c67501b494949d04
X-Git-Newrev: 287601459e15c683feb9517092d8d50099b09915
X-Patchwork-Hint: ignore
Message-Id: <20211227084644.4C44B82975@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Ryan Barnett
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

commit: https://git.buildroot.net/buildroot/commit/?id=287601459e15c683feb9517092d8d50099b09915
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

His e-mail address is bouncing (and we have some private information
that explains why):

Ryan Barnett (ryan.barnett@collins.com)<mailto:ryan.barnett@collins.com>
The recipient won't be able to receive this message because it's too large.

The maximum message size that's allowed is 1 KB. This message is 7 KB.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7f8459dab7..4372c9ae8d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2431,18 +2431,6 @@ F:	support/testing/tests/package/test_glxinfo.py
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
