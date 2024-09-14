Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8C6C02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B32484700;
	Sat, 14 Sep 2024 08:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpN-mDX2eXt4; Sat, 14 Sep 2024 08:23:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87F2984705
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87F2984705;
	Sat, 14 Sep 2024 08:23:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85E0D1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74D70846C0
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEHMRw8RSSuB for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BFAD8457E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BFAD8457E
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40BCF86F51; Sat, 14 Sep 2024 08:22:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 10:06:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30bc9d9b1b86a0682f72f96a715381d0e221ef51
X-Git-Newrev: c186db4741b30ae02f700e93649b7b04d5bf1ea2
X-Patchwork-Hint: ignore
Message-Id: <20240914082254.40BCF86F51@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/icu: fix typos in help text and
 patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=c186db4741b30ae02f700e93649b7b04d5bf1ea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/icu/0002-workaround-toolchain-bugs.patch | 2 +-
 package/icu/Config.in                            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/icu/0002-workaround-toolchain-bugs.patch b/package/icu/0002-workaround-toolchain-bugs.patch
index b5f25d0a13..f6b124cc2a 100644
--- a/package/icu/0002-workaround-toolchain-bugs.patch
+++ b/package/icu/0002-workaround-toolchain-bugs.patch
@@ -1,7 +1,7 @@
 Workaround toolchain bugs
 
 Many of ARM Sourcery CodeBench toolchain have a bug when compiling
-icu's translit.cpp source file. The bug is trigerred when there is a
+icu's translit.cpp source file. The bug is triggered when there is a
 combination of "-W -Wall" and "-Os", and causes an internal compiler
 error. The bug has been reported to Mentor Graphics.
 
diff --git a/package/icu/Config.in b/package/icu/Config.in
index 8b410bfdb6..4ed662e887 100644
--- a/package/icu/Config.in
+++ b/package/icu/Config.in
@@ -21,7 +21,7 @@ config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
 	help
 	  This option allows to define the path to a custom data
 	  library generated with http://apps.icu-project.org/datacustom/
-	  Make sure you select the appropiate version to match the one
+	  Make sure you select the appropriate version to match the one
 	  provided by buildroot.
 	  Leave empty to not use this functionality.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
