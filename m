Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CEBCF3963
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 19:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8438340E0C;
	Thu, 19 Sep 2024 19:58:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pk1xLqPuj0K6; Thu, 19 Sep 2024 19:58:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 514A541498
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 514A541498;
	Thu, 19 Sep 2024 19:58:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5680D1BF292
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 450F56F4A3
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 19:58:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AuvPbZaK39yb for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6393F61B39
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6393F61B39
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E96382B5B; Thu, 19 Sep 2024 19:58:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:56:13 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c412bac1098444228b49dc129a0205213ec2524d
X-Git-Newrev: cd0361c0fe624dfd4628f81430cb067f414b020d
X-Patchwork-Hint: ignore
Message-Id: <20240919195837.4E96382B5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/icu: fix typos in
 help text and patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd0361c0fe624dfd4628f81430cb067f414b020d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c186db4741b30ae02f700e93649b7b04d5bf1ea2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
