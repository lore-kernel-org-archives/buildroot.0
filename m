Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E03FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 14:58:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90C8B6103B
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 14:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90C8B6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62DBD40236;
	Sat, 18 Sep 2021 14:58:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBqiAfGRqhMg; Sat, 18 Sep 2021 14:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B875B40229;
	Sat, 18 Sep 2021 14:58:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CC411BF5A3
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 14:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B63983F8B
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 14:58:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 82XLsKhg4PbF for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 14:58:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8FB683F89
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 14:58:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 53E8B87ACC; Sat, 18 Sep 2021 14:56:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 16:57:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30479788f18d4a625687b3228a3b527dab63c239
X-Git-Newrev: 1c140f14ade74acbc554c21bc32486f2b4545bfe
X-Patchwork-Hint: ignore
Message-Id: <20210918145632.53E8B87ACC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bison: bump version to 3.8.1
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1c140f14ade74acbc554c21bc32486f2b4545bfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1] and [2].

[1] https://lists.gnu.org/archive/html/info-gnu/2021-09/msg00006.html
[2] https://fossies.org/linux/bison/ChangeLog

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/bison/bison.hash | 4 ++--
 package/bison/bison.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bison/bison.hash b/package/bison/bison.hash
index f4abe4c661..04b6ca03e4 100644
--- a/package/bison/bison.hash
+++ b/package/bison/bison.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature from
-# http://mirror.keystealth.org/gnu/bison/bison-3.7.6.tar.xz.sig
-sha256  67d68ce1e22192050525643fc0a7a22297576682bef6a5c51446903f5aeef3cf  bison-3.7.6.tar.xz
+# http://mirror.keystealth.org/gnu/bison/bison-3.8.1.tar.xz.sig
+sha256  31fc602488aad6bdecf0ccc556e0fc72fc57cdc595cf92398f020e0cf4980f15  bison-3.8.1.tar.xz
 # License files, locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 26db307e20..8413233063 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BISON_VERSION = 3.7.6
+BISON_VERSION = 3.8.1
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
