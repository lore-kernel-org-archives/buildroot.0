Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83B0C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 20:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 59B8C405CB;
	Mon, 27 Jun 2022 20:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59B8C405CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmJAgt-Ot7mT; Mon, 27 Jun 2022 20:44:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6A95409A6;
	Mon, 27 Jun 2022 20:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6A95409A6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 806ED1BF2B0
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B216740612
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 20:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B216740612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cp7V6eOHWz29 for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 20:44:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE3B640289
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 20:44:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE3B640289
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B6CE0875B3; Mon, 27 Jun 2022 20:31:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 22:39:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 154727350ee1959651b8e933f692b81fc5c24022
X-Git-Newrev: 7601ca8a6280bb17b96c9a8728a506cae9554f18
X-Patchwork-Hint: ignore
Message-Id: <20220627203135.B6CE0875B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/speex: bump to version 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7601ca8a6280bb17b96c9a8728a506cae9554f18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update COPYING hash (trailing white space removed:
  https://gitlab.xiph.org/xiph/speex/-/commit/1e64d72bbfd86695eb72e2c122506e071894cb1a)
- Update indentation in hash file (two spaces)

https://gitlab.xiph.org/xiph/speex/-/tags/Speex-1.2.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/speex/speex.hash | 6 ++----
 package/speex/speex.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/speex/speex.hash b/package/speex/speex.hash
index f5235d6262..5a2f942e82 100644
--- a/package/speex/speex.hash
+++ b/package/speex/speex.hash
@@ -1,6 +1,4 @@
 # From https://downloads.xiph.org/releases/speex/SHA256SUMS.txt
-sha256 eaae8af0ac742dc7d542c9439ac72f1f385ce838392dc849cae4536af9210094  speex-1.2.0.tar.gz
-# From https://downloads.xiph.org/releases/speex/MD5SUMS
-md5 8ab7bb2589110dfaf0ed7fa7757dc49c  speex-1.2.0.tar.gz
+sha256  4b44d4f2b38a370a2d98a78329fefc56a0cf93d1c1be70029217baae6628feea  speex-1.2.1.tar.gz
 # Locally computed
-sha256 671bb5d8fd3c6b05a2e831d90f978ac27965c92bd8ea6d16b3df76e3440c0e9f  COPYING
+sha256  2654a4264b2bfe298dedc508748d140111840c315cc8eb646a3a68c13fa75b01  COPYING
diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 674be78ff8..6d61e93833 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SPEEX_VERSION = 1.2.0
+SPEEX_VERSION = 1.2.1
 SPEEX_SITE = https://downloads.xiph.org/releases/speex
 SPEEX_LICENSE = BSD-3-Clause
 SPEEX_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
