Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A8F0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 17:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F6CB401CA;
	Mon, 24 Jan 2022 17:38:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8a2-mOtVQUN; Mon, 24 Jan 2022 17:38:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11A49405F2;
	Mon, 24 Jan 2022 17:38:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0229D1BF487
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE28C40213
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 17:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnpsZjtT6WFA for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 17:36:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 693ED40225
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 17:36:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BBBEE82DC2; Mon, 24 Jan 2022 17:29:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 18:26:56 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 17be0de47cbaad0e27e16a834f7d90705b0aa488
X-Git-Newrev: 2a35749e6f93e7ff712dd3007efb2b7e8302468e
X-Patchwork-Hint: ignore
Message-Id: <20220124172947.BBBEE82DC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] DEVELOPERS: remove Ryan
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a35749e6f93e7ff712dd3007efb2b7e8302468e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
index a9179fc154..de7d2c3fbf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2402,18 +2402,6 @@ F:	support/testing/tests/package/test_glxinfo.py
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
