Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A87C52D7D
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 08:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F404E60A43;
	Thu, 15 Aug 2024 08:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jjm8xXPS0znU; Thu, 15 Aug 2024 08:58:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CB8D60A66
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CB8D60A66;
	Thu, 15 Aug 2024 08:58:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5276E1BF2B6
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 08:58:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D46B60A66
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 08:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lg_L8ZENmCEx for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 08:58:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90D9160A43
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90D9160A43
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 08:58:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CFD785E2C; Thu, 15 Aug 2024 08:58:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 10:57:42 +0200
Subject: [git commit branch/next] DEVELOPERS: add skarnet.org packages to J. Neuschäfer's entry
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5b54c1166b78fa0b36183d58be2fd0ff140ee41f
X-Git-Newrev: e09154dc70ba7973d9acb247cd6a37651f315213
X-Patchwork-Hint: ignore
Message-Id: <20240815085802.7CFD785E2C@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============0997852388280274816=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0997852388280274816==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e09154dc70ba7973d9acb247cd6a37651f315213
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

--===============0997852388280274816==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0997852388280274816==--
