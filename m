Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E57CE8D61
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9827A41294;
	Thu, 19 Sep 2024 09:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrHG9a2fZD7A; Thu, 19 Sep 2024 09:17:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 584CE41821
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 584CE41821;
	Thu, 19 Sep 2024 09:17:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C43A51BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C70BE8472A
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMaaOM_yycdL for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FEFA8493C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FEFA8493C
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BCF980D9D; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:24 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 82b82594e8d0697e03539c883657aaa4f13fb808
X-Git-Newrev: 5ba2961cc91325bc06e529dd2a1d6049b6eb6e61
X-Patchwork-Hint: ignore
Message-Id: <20240919091452.9BCF980D9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/elftosb: fix
 typos in patch descriptions
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ba2961cc91325bc06e529dd2a1d6049b6eb6e61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a4c81a7a07a5fae6ab99188aee8539a8b9a5a0e3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/elftosb/0001-fixes-includes.patch     | 2 +-
 package/elftosb/0002-force-cxx-compiler.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/elftosb/0001-fixes-includes.patch b/package/elftosb/0001-fixes-includes.patch
index eaf8ebad98..ba84d126bc 100644
--- a/package/elftosb/0001-fixes-includes.patch
+++ b/package/elftosb/0001-fixes-includes.patch
@@ -1,4 +1,4 @@
-This patch uses system include files instead of a hard coded system path to fixe
+This patch uses system include files instead of a hard coded system path to fix
 potential compilation failure on systems that do not populate system header
 files in /usr/include/..
 
diff --git a/package/elftosb/0002-force-cxx-compiler.patch b/package/elftosb/0002-force-cxx-compiler.patch
index efa92d1171..2dc0394f86 100644
--- a/package/elftosb/0002-force-cxx-compiler.patch
+++ b/package/elftosb/0002-force-cxx-compiler.patch
@@ -19,7 +19,7 @@ Thus, elftosb should either:
 - use gcc and link against libc and libm;
 - or use g++ and link against libstdc++.
 
-Because elftosb is written in C++, this patch implement the sencond option, using
+Because elftosb is written in C++, this patch implement the second option, using
 g++ and linking against libstdc++.
 
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
