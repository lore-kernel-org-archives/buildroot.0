Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77EDC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 14:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72389424A2;
	Tue,  7 Jun 2022 14:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IYE0SopO-9l3; Tue,  7 Jun 2022 14:06:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AACC4249D;
	Tue,  7 Jun 2022 14:06:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A7B41BF397
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5807F6100D
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 14:05:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BAvXvQjZyDW1 for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 14:05:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A969613F4
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 14:05:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6B2DD86ABC; Tue,  7 Jun 2022 13:54:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Jun 2022 16:04:35 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c557229451a3999e984dbf55a029f9a4cbf43424
X-Git-Newrev: f9e69d1b0fcb75c0b3ae943f38c7a1a8de4719ad
X-Patchwork-Hint: ignore
Message-Id: <20220607135403.6B2DD86ABC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/memcached: remove
 patch numbering
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

commit: https://git.buildroot.net/buildroot/commit/?id=f9e69d1b0fcb75c0b3ae943f38c7a1a8de4719ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

check-package:
package/memcached/0002-check-for-sys-auxv.h.patch:4: generate your patches with 'git format-patch -N'

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 638341dbbebba0b47403e1f3508c3f6f8802737f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
