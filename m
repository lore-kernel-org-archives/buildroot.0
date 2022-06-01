Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ED3CCA473
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 20:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7B3260EB2;
	Wed,  1 Jun 2022 20:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L0tMUi6TX0Uv; Wed,  1 Jun 2022 20:57:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F181260BAF;
	Wed,  1 Jun 2022 20:57:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 182931BF2C7
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 20:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06251409C8
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 20:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWV3JBtyY6Qm for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 20:57:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C85C409A6
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 20:57:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C0DA1868E2; Wed,  1 Jun 2022 20:45:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 22:51:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4bb884a3c61c6b71e33f69453a90eb2a367f64b7
X-Git-Newrev: 549f5f07785448c94454bdedf57b39304ac67e43
X-Patchwork-Hint: ignore
Message-Id: <20220601204553.C0DA1868E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/wolftpm: add missing
 license file hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=549f5f07785448c94454bdedf57b39304ac67e43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wolftpm/wolftpm.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wolftpm/wolftpm.hash b/package/wolftpm/wolftpm.hash
index 6dbf143ffe..b9a9628b68 100644
--- a/package/wolftpm/wolftpm.hash
+++ b/package/wolftpm/wolftpm.hash
@@ -1,2 +1,4 @@
 # Hash from https://github.com/wolfSSL/wolfTPM/archive/refs/tags/v2.3.1.tar.gz
 sha256  f0d7c095491ac2cc9e44aa4ac3c22febf15942ef080431d8b43a9d0312ca6567  wolftpm-2.3.1.tar.gz
+# Locally calculated
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
