Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FE1C6FD1C
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 22:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40D958403C;
	Wed, 22 Mar 2023 22:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40D958403C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DwLQO5-ePpgg; Wed, 22 Mar 2023 22:44:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7612684002;
	Wed, 22 Mar 2023 22:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7612684002
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A7A21BF95F
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E94578402C
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E94578402C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gCZbfIW8LCDu for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21C5484028
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21C5484028
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D4B88758B; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 23:38:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9d4b6a32fed767d7074febc1e3a9b19fbcfa9bc
X-Git-Newrev: 812083c1d35f84d85a7e1a61ec00cf1162ebd64a
X-Patchwork-Hint: ignore
Message-Id: <20230322224400.0D4B88758B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grep: bump version to 3.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=812083c1d35f84d85a7e1a61ec00cf1162ebd64a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.gnu.org/archive/html/info-gnu/2023-03/msg00001.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grep/grep.hash | 4 ++--
 package/grep/grep.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 6f3bca89ad..c83e4653c3 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# http://ftp.gnu.org/gnu/grep/grep-3.8.tar.xz.sig
+# https://ftp.gnu.org/gnu/grep/grep-3.9.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  498d7cc1b4fb081904d87343febb73475cf771e424fb7e6141aff66013abc382  grep-3.8.tar.xz
+sha256  abcd11409ee23d4caf35feb422e53bbac867014cfeed313bb5f488aca170b599  grep-3.9.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 318e00940d..309987010f 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 3.8
+GREP_VERSION = 3.9
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
