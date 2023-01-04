Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C896C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBCAB826E5;
	Mon, 20 Feb 2023 23:03:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBCAB826E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WBLJs2nhRSez; Mon, 20 Feb 2023 23:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FEA2826C1;
	Mon, 20 Feb 2023 23:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FEA2826C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C7B21BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29F8041728
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29F8041728
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qDX9vd2M11b5 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7997541717
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7997541717
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6951986495; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:25:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f6e88fff91dd4702c725f47fb4fdd1a00b228f64
X-Git-Newrev: f1f5e9f15063443bae1b80af072c7a5b0ab91d24
X-Patchwork-Hint: ignore
Message-Id: <20230220205224.6951986495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/readline: bump to
 version 8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1f5e9f15063443bae1b80af072c7a5b0ab91d24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/readline/readline.hash | 4 ++--
 package/readline/readline.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/readline/readline.hash b/package/readline/readline.hash
index b0530a2d72..627746d821 100644
--- a/package/readline/readline.hash
+++ b/package/readline/readline.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature from
-# https://ftp.gnu.org/gnu/readline/readline-8.1.2.tar.gz.sig
-sha256  7589a2381a8419e68654a47623ce7dfcb756815c8fee726b98f90bf668af7bc6  readline-8.1.2.tar.gz
+# https://ftp.gnu.org/gnu/readline/readline-8.2.tar.gz.sig
+sha256  3feb7171f16a84ee82ca18a36d7b9be109a52c04f492a053331d7d1095007c35  readline-8.2.tar.gz
 
 # Hash for license file
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/readline/readline.mk b/package/readline/readline.mk
index b1fd181b78..66812dee77 100644
--- a/package/readline/readline.mk
+++ b/package/readline/readline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-READLINE_VERSION = 8.1.2
+READLINE_VERSION = 8.2
 READLINE_SITE = $(BR2_GNU_MIRROR)/readline
 READLINE_INSTALL_STAGING = YES
 READLINE_DEPENDENCIES = ncurses host-autoconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
