Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD2CCD3440
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 21:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA35B60814;
	Tue,  3 Sep 2024 21:39:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGz2H-V4rOI1; Tue,  3 Sep 2024 21:39:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2EED607ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2EED607ED;
	Tue,  3 Sep 2024 21:39:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CCFB91BF421
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C71E8402AB
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 21:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I67CEnaLCCyU for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 21:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D04E0402A9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D04E0402A9
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 21:39:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B37BA86D6B; Tue,  3 Sep 2024 21:39:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 23:39:19 +0200
Subject: [git commit branch/next] DEVELOPERS: add J. Neuschäfer for rpi-rgb-led-matrix/python-rgbmatrix
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5cc0592bfe9ce92aff5975a0bb12d8a1460ff072
X-Git-Newrev: 1e7f27adf99712c02f52853922f3f4ff32b88934
X-Patchwork-Hint: ignore
Message-Id: <20240903213943.B37BA86D6B@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============8614998457248483775=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8614998457248483775==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1e7f27adf99712c02f52853922f3f4ff32b88934
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add myself as maintainer so I can be notified of patches/problems/etc.

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ed64906fc5..0a5dd3f64d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1455,6 +1455,8 @@ F:	package/mawk/
 N:	J. Neuschäfer <j.neuschaefer@gmx.net>
 F:	package/execline/
 F:	package/mdevd/
+F:	package/python-rgbmatrix/
+F:	package/rpi-rgb-led-matrix/
 F:	package/s6/
 F:	package/s6-linux-init/
 F:	package/s6-linux-utils/

--===============8614998457248483775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8614998457248483775==--
