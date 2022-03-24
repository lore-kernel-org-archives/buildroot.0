Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4CCC433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 21:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35F34843F7;
	Thu, 24 Mar 2022 21:16:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GPvxVPoyLVQl; Thu, 24 Mar 2022 21:16:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 559718448A;
	Thu, 24 Mar 2022 21:16:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E2751BF313
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0947A41064
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 21:15:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jSyqnkYRQXTv for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 21:15:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E01F941088
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 21:15:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D647585C5B; Thu, 24 Mar 2022 21:06:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 24 Mar 2022 21:51:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f617bbbf9fff6e436ae1b86f8af4d127e17fa08
X-Git-Newrev: f318c729f0776a8a51c9832e9d431c57edfd7990
X-Patchwork-Hint: ignore
Message-Id: <20220324210619.D647585C5B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbdplus: bump to version 0.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f318c729f0776a8a51c9832e9d431c57edfd7990
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://code.videolan.org/videolan/libbdplus/-/blob/0.2.0/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libbdplus/libbdplus.hash | 6 +++---
 package/libbdplus/libbdplus.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libbdplus/libbdplus.hash b/package/libbdplus/libbdplus.hash
index 6abc0e4970..2445af6e82 100644
--- a/package/libbdplus/libbdplus.hash
+++ b/package/libbdplus/libbdplus.hash
@@ -1,5 +1,5 @@
-# From http://download.videolan.org/pub/videolan/libbdplus/0.1.2/libbdplus-0.1.2.tar.bz2.sha512
-sha512	e00e7bc9f52b9275646593b753ba646b052255be94a7241965f4dbe4734f8f6a072973ed4b9997957f939236b0633897c295749f79e232188430795be5b5087b	libbdplus-0.1.2.tar.bz2
+# From http://download.videolan.org/pub/videolan/libbdplus/0.2.0/libbdplus-0.2.0.tar.bz2.sha512
+sha512  172e4932fb5540fbdb5b86e1d42cfaddf60b81416d2de50c8add83fb7f1bd7c296c975fd84a6ec42566977086dccfe07db5ce696038862bc75c6494c647998d6  libbdplus-0.2.0.tar.bz2
 
 # Hash for license file:
-sha256	592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c	COPYING
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/libbdplus/libbdplus.mk b/package/libbdplus/libbdplus.mk
index b0e8b1488d..600cb6b545 100644
--- a/package/libbdplus/libbdplus.mk
+++ b/package/libbdplus/libbdplus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBDPLUS_VERSION = 0.1.2
+LIBBDPLUS_VERSION = 0.2.0
 LIBBDPLUS_SITE = http://download.videolan.org/pub/videolan/libbdplus/$(LIBBDPLUS_VERSION)
 LIBBDPLUS_SOURCE = libbdplus-$(LIBBDPLUS_VERSION).tar.bz2
 LIBBDPLUS_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
