Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD56E732C5
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 12:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64BDF83367;
	Thu, 28 Sep 2023 12:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64BDF83367
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QaMOFIkYGplp; Thu, 28 Sep 2023 12:41:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5692E83AAB;
	Thu, 28 Sep 2023 12:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5692E83AAB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C9E91BF98E
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 12:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07C8B4060D
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 12:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07C8B4060D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mth_hok6O_pl for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 12:41:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2EBF4033F
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 12:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2EBF4033F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D120682AD8; Thu, 28 Sep 2023 12:41:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 14:40:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d15bc66b9a809427b6bc1c7f5d6d3e661acb4b3f
X-Git-Newrev: bf284bcfbaa7f031713afcc4c4e33d54724b6f57
X-Patchwork-Hint: ignore
Message-Id: <20230928124109.D120682AD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/putty: bump version to 0.79
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf284bcfbaa7f031713afcc4c4e33d54724b6f57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bug fixes mostly.

Link: https://www.chiark.greenend.org.uk/~sgtatham/putty/changes.html
Signed-off-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/putty/putty.hash | 8 ++++----
 package/putty/putty.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/putty/putty.hash b/package/putty/putty.hash
index c691a4f975..05c1a9eea6 100644
--- a/package/putty/putty.hash
+++ b/package/putty/putty.hash
@@ -1,7 +1,7 @@
-# Hashes from: http://the.earth.li/~sgtatham/putty/0.78/{sha1,sha256,sha512}sums
-sha1  198f01db6bea708e480fb11dd23026eda7b3f49f  putty-0.78.tar.gz
-sha256  274e01bcac6bd155dfd647b2f18f791b4b17ff313753aa919fcae2e32d34614f  putty-0.78.tar.gz
-sha512  d7a3e2eabd5f1f65fc0f3f1ee0789c30fbe891b57f63ddeac0b92befcb6aecd4a748f04a21c76ee42d992deb77c2e1a0454a71cc620ef26fbf23af660bd84bb5  putty-0.78.tar.gz
+# Hashes from: http://the.earth.li/~sgtatham/putty/0.79/{sha1,sha256,sha512}sums
+sha1  c40c3ce9fd334c40e64c6b33ee7e1096dad52701  putty-0.79.tar.gz
+sha256  428cc8666fbb938ebf4ac9276341980dcd70de395b33164496cf7995ef0ef0d8  putty-0.79.tar.gz
+sha512  4f10f870b229c89e928921d3b350955ce1c1170a062e7943d9cc8dbd83389d82a9b844623541605f0db5a429d545c2d188bf8e384c6515466fae69b216120983  putty-0.79.tar.gz
 
 # Locally calculated
 sha256  7b10c93f0d582e820a9e6f8c6abbcff54192e41e60644f4d09b96b14fdbc74f8  LICENCE
diff --git a/package/putty/putty.mk b/package/putty/putty.mk
index 82b7464bb4..d3c8d923f0 100644
--- a/package/putty/putty.mk
+++ b/package/putty/putty.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PUTTY_VERSION = 0.78
+PUTTY_VERSION = 0.79
 PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
 PUTTY_LICENSE = MIT
 PUTTY_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
