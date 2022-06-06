Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C127C43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 237F740B00;
	Mon,  6 Jun 2022 12:27:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLw_RgLpIJcw; Mon,  6 Jun 2022 12:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 498EA40A9E;
	Mon,  6 Jun 2022 12:26:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDB741BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFC8583F0E
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kVY5BCugpoO5 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:26:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E83AA840B2
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:26:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C2C7086D04; Mon,  6 Jun 2022 12:15:07 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 14:26:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7532fc1bcd35f034754a467cb1dd39ecc8839b36
X-Git-Newrev: 638341dbbebba0b47403e1f3508c3f6f8802737f
X-Patchwork-Hint: ignore
Message-Id: <20220606121507.C2C7086D04@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memcached: remove patch numbering
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

commit: https://git.buildroot.net/buildroot/commit/?id=638341dbbebba0b47403e1f3508c3f6f8802737f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package:
package/memcached/0002-check-for-sys-auxv.h.patch:4: generate your patches with 'git format-patch -N'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/memcached/0002-check-for-sys-auxv.h.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/memcached/0002-check-for-sys-auxv.h.patch b/package/memcached/0002-check-for-sys-auxv.h.patch
index 49b12ef7d7..8c41bb4f01 100644
--- a/package/memcached/0002-check-for-sys-auxv.h.patch
+++ b/package/memcached/0002-check-for-sys-auxv.h.patch
@@ -1,7 +1,7 @@
 From 58b6de2135c10b64918f25c48f69f144d08a9c0d Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Fri, 3 Jun 2022 19:10:15 +0200
-Subject: [PATCH 2/2] check for sys/auxv.h
+Subject: [PATCH] check for sys/auxv.h
 
 Check for sys/auxv.h to avoid the following uclibc build failure on
 aarch64:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
