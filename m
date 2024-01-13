Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CCEC4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9C9341F9D;
	Sat, 13 Jan 2024 13:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9C9341F9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tUp58DwVOQy5; Sat, 13 Jan 2024 13:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1161F41F85;
	Sat, 13 Jan 2024 13:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1161F41F85
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D89241BF325
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B2564014B
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B2564014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9B77680nw_Lp for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C89D40217
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C89D40217
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1534D85E2A; Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 14:19:52 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: cdde416765f3bee7726dad1ed32578eeede3c0fd
X-Git-Newrev: 011c962a7563a2087740e5a55724d85f0554a939
X-Patchwork-Hint: ignore
Message-Id: <20240113133412.1534D85E2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/rng-tools: update
 help text website reference
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

commit: https://git.buildroot.net/buildroot/commit/?id=011c962a7563a2087740e5a55724d85f0554a939
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

We switched to new upstream since commit f9e9c6349afe0
("package/rng-tools: bump to 6.7"). Update the website URL as well.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 717fe9dc396b3982a02306e8685d8338ae2ebbf6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
