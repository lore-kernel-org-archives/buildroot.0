Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C324C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07859448AC;
	Mon, 20 Feb 2023 21:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07859448AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ChnMLNmjji7B; Mon, 20 Feb 2023 21:39:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9E574B530;
	Mon, 20 Feb 2023 21:39:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9E574B530
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3467C1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71464610FD
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71464610FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qov3bERdLPUf for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89CB3610EF
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89CB3610EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73000828C8; Mon, 20 Feb 2023 20:51:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 2 Dec 2022 20:41:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5bbc20154e2291b967b7fc66ca4f85a2b47dcfd1
X-Git-Newrev: a34dcba9ebcda5a1dcb95b332486454776cd305b
X-Patchwork-Hint: ignore
Message-Id: <20230220205154.73000828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/manual: fixed some
 spelling mistakes
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

commit: https://git.buildroot.net/buildroot/commit/?id=a34dcba9ebcda5a1dcb95b332486454776cd305b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixed some spelling mistakes of countable nouns.

Signed-off-by: Zikui Zhao <zhaozikui@eswincomputing.com>
Reviewed-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/customize-directory-structure.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/customize-directory-structure.txt b/docs/manual/customize-directory-structure.txt
index a3a7ad4cb9..1249421da2 100644
--- a/docs/manual/customize-directory-structure.txt
+++ b/docs/manual/customize-directory-structure.txt
@@ -27,10 +27,10 @@ to you.
 |           +-- post_image.sh
 |           +-- rootfs_overlay/
 |           |   +-- etc/
-|           |   +-- <some file>
+|           |   +-- <some files>
 |           +-- patches/
 |               +-- foo/
-|               |   +-- <some patch>
+|               |   +-- <some patches>
 |               +-- libbar/
 |                   +-- <some other patches>
 |
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
