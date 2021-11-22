Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17D3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 20:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7ADE44026A;
	Mon, 22 Nov 2021 20:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oRAsm0UYL5m1; Mon, 22 Nov 2021 20:04:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 806764035D;
	Mon, 22 Nov 2021 20:04:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1099B1BF2C3
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 20:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00C6080D40
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 20:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id InVU2QhrfaLU for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 20:04:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F03FF80D3D
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 20:04:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9A4C28EC3E; Mon, 22 Nov 2021 19:59:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 21:03:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 98372c54447076fe9acf5dd4c9d6a465f3f88f0f
X-Git-Newrev: 8f3e2a6678e173782748e3981a4bcfb06fb7f980
X-Patchwork-Hint: ignore
Message-Id: <20211122195949.9A4C28EC3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: fix typo in
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH in the help text
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
Content-Type: multipart/mixed; boundary="===============0665817031092966282=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0665817031092966282==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8f3e2a6678e173782748e3981a4bcfb06fb7f980
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

"Path to to out-of-tree..." -> "Path to the out-of-tree..."

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index d35dacc756..0f677d1e4e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -411,7 +411,7 @@ config BR2_LINUX_KERNEL_INTREE_DTS_NAME
 config BR2_LINUX_KERNEL_CUSTOM_DTS_PATH
 	string "Out-of-tree Device Tree Source file paths"
 	help
-	  Path to to out-of-tree device tree source files.
+	  Path to the out-of-tree device tree source files.
 	  You can provide a list of dts paths to copy and
 	  build, separated by spaces.
 

--===============0665817031092966282==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0665817031092966282==--
