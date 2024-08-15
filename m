Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC59E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E067B842FC;
	Fri,  6 Sep 2024 20:00:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ou9Zk1XBCJ3U; Fri,  6 Sep 2024 20:00:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 809A08446B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 809A08446B;
	Fri,  6 Sep 2024 20:00:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13F751BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B718040791
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qck4MFsgwdRX for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DEC640822
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DEC640822
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1C5586EE4; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 10:57:42 +0200
Subject: [git commit] DEVELOPERS: add skarnet.org packages to J. Neuschäfer's entry
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b54c1166b78fa0b36183d58be2fd0ff140ee41f
X-Git-Newrev: e09154dc70ba7973d9acb247cd6a37651f315213
X-Patchwork-Hint: ignore
Message-Id: <20240906195853.F1C5586EE4@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============6522737980677623107=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6522737980677623107==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e09154dc70ba7973d9acb247cd6a37651f315213
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since I've contributed some maintenance to s6 and other packages from
skarnet.org in the past, I'm stepping up to be notified of developments
in these packages.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 837d42bb4f..e87031b598 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1453,7 +1453,16 @@ F:	package/axel/
 F:	package/mawk/
 
 N:	J. Neuschäfer <j.neuschaefer@gmx.net>
-F:	package/tipidee
+F:	package/execline/
+F:	package/mdevd/
+F:	package/s6/
+F:	package/s6-linux-init/
+F:	package/s6-linux-utils/
+F:	package/s6-networking/
+F:	package/s6-portable-utils/
+F:	package/s6-rc/
+F:	package/skalibs/
+F:	package/tipidee/
 
 N:	Jagan Teki <jagan@amarulasolutions.com>
 F:	board/amarula/

--===============6522737980677623107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6522737980677623107==--
