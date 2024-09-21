Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2216CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F74741DD6;
	Sat, 21 Sep 2024 18:49:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tyKr_BogJxb; Sat, 21 Sep 2024 18:49:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A31D641DE0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A31D641DE0;
	Sat, 21 Sep 2024 18:49:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F34A1BF869
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B618640289
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9-Lbt4HY6Gr3 for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00B804010D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00B804010D
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:48:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED8B683D9A; Sat, 21 Sep 2024 18:48:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 20:19:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed2cb54252b5eec9ba66ed29fe5539c4c4d3958c
X-Git-Newrev: 37574ab12a46602c31c103a82b8ef6a58968dfc7
X-Patchwork-Hint: ignore
Message-Id: <20240921184811.ED8B683D9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/readme.txt: fix 'typos' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=37574ab12a46602c31c103a82b8ef6a58968dfc7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/readme.txt b/utils/readme.txt
index 6488d13c75..b5862f1fb9 100644
--- a/utils/readme.txt
+++ b/utils/readme.txt
@@ -14,7 +14,7 @@ brmake
 check-package
     a script that checks the coding style across the buildroot tree. It
     checks package's Config.in and .mk files, runs shellcheck for all shell
-    scripts, flake8 for python files, checks for typoes, etc.
+    scripts, flake8 for python files, checks for typos, etc.
     It checks the .checkpackageignore file if errors should be ignored and
     errors if there's a file listed that doesn't produce an error.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
