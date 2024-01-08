Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58887C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 20:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07630417FB;
	Mon,  8 Jan 2024 20:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07630417FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWZGj5VvI4Wt; Mon,  8 Jan 2024 20:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68B0A41B8C;
	Mon,  8 Jan 2024 20:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68B0A41B8C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AAA751BF8B4
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 829E8405A8
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 829E8405A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aexHSvLlWgru for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 20:38:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9869D40132
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 20:38:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9869D40132
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8141484BD8; Mon,  8 Jan 2024 20:38:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 8 Jan 2024 21:35:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a34f0c02f18533abe56a497b6208fbc0401b2538
X-Git-Newrev: 717fe9dc396b3982a02306e8685d8338ae2ebbf6
X-Patchwork-Hint: ignore
Message-Id: <20240108203836.8141484BD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rng-tools: update help text
 website reference
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

commit: https://git.buildroot.net/buildroot/commit/?id=717fe9dc396b3982a02306e8685d8338ae2ebbf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We switched to new upstream since commit f9e9c6349afe0
("package/rng-tools: bump to 6.7"). Update the website URL as well.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rng-tools/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
index be3f078a0b..7f08fa25fb 100644
--- a/package/rng-tools/Config.in
+++ b/package/rng-tools/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_RNG_TOOLS
 	help
 	  Daemon to use hardware random number generators.
 
-	  http://sourceforge.net/projects/gkernel/
+	  https://github.com/nhorman/rng-tools
 
 if BR2_PACKAGE_RNG_TOOLS
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
