Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F146CE7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC14D83A4B;
	Thu, 21 Sep 2023 19:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC14D83A4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z54DmCz8RNdG; Thu, 21 Sep 2023 19:01:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F20E48231C;
	Thu, 21 Sep 2023 19:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F20E48231C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 68B701BF360
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 428CE8231C
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 428CE8231C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DvItBkcn5ldD for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:01:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8495D82177
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8495D82177
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74BCE874D0; Thu, 21 Sep 2023 19:01:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 20:59:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90cfb81b510f9cae3bf2972b9cd5a362cbd4fa12
X-Git-Newrev: ba3c548562300e2956de1ae610aefb32e7cc24f2
X-Patchwork-Hint: ignore
Message-Id: <20230921190104.74BCE874D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grep: bump to version 3.11
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ba3c548562300e2956de1ae610aefb32e7cc24f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No security fixes introduced in the latest version.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/grep/grep.hash | 4 ++--
 package/grep/grep.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 142d15644d..a0028a4e2f 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# https://ftp.gnu.org/gnu/grep/grep-3.10.tar.xz.sig
+# https://ftp.gnu.org/gnu/grep/grep-3.11.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  24efa5b595fb5a7100879b51b8868a0bb87a71c183d02c4c602633b88af6855b  grep-3.10.tar.xz
+sha256  1db2aedde89d0dea42b16d9528f894c8d15dae4e190b59aecc78f5a951276eab  grep-3.11.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 2f3b405f93..61900bb957 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 3.10
+GREP_VERSION = 3.11
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
