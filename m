Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC73C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 18:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AEF340556;
	Mon,  5 Feb 2024 18:22:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AEF340556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wk_w7Q9OelyQ; Mon,  5 Feb 2024 18:22:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A15C40593;
	Mon,  5 Feb 2024 18:22:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A15C40593
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6985B1BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D94540556
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 18:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D94540556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIFOAhtX6TzR for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 18:22:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 512B2404AF
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 18:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 512B2404AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DBB886DC6; Mon,  5 Feb 2024 18:22:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 19:22:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e97fc89e7ba75f5f664161916b44e727820a04a5
X-Git-Newrev: b64906f88880167cae7513b29b1608f5ca9fe6c6
X-Patchwork-Hint: ignore
Message-Id: <20240205182240.2DBB886DC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stella: bump to version 6.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=b64906f88880167cae7513b29b1608f5ca9fe6c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/stella/stella.hash | 2 +-
 package/stella/stella.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/stella/stella.hash b/package/stella/stella.hash
index 17d059226c..59c6806459 100644
--- a/package/stella/stella.hash
+++ b/package/stella/stella.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  babfcbb39abbd1a992cb1e6d3b2f508df7ed19cb9d0b5b5d624828bb98f97267  stella-6.7-src.tar.xz
+sha256  9ef880df87f2d3ffebfbad915247d1fd5a3aca41dfd6a754dcf7a142ac826752  stella-6.7.1-src.tar.xz
 sha256  e82dd017fea2c70a16726aa1d7c05c5b7597e10f7229511c1b110bf84cb507c0  Copyright.txt
 sha256  58530d09b6fcb91ae27071be0081af90e6c2d7fdf991d34a29e234a2a5e75455  License.txt
diff --git a/package/stella/stella.mk b/package/stella/stella.mk
index aa5da1996e..c48bb593a4 100644
--- a/package/stella/stella.mk
+++ b/package/stella/stella.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLA_VERSION = 6.7
+STELLA_VERSION = 6.7.1
 STELLA_SOURCE = stella-$(STELLA_VERSION)-src.tar.xz
 STELLA_SITE = https://github.com/stella-emu/stella/releases/download/$(STELLA_VERSION)
 STELLA_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
