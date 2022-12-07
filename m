Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2121BC352A1
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 13:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B129F40276;
	Wed,  7 Dec 2022 13:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B129F40276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tswYQXMYXGy; Wed,  7 Dec 2022 13:40:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBB5240286;
	Wed,  7 Dec 2022 13:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBB5240286
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 07CBD1BF955
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D581E40214
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D581E40214
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7m6HfLqnLqem for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 13:39:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF68E401D2
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 13:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF68E401D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABA2A85DE2; Wed,  7 Dec 2022 13:39:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Dec 2022 14:35:15 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: c885c005cefa760e5a0e54b51ff2aac54b5df0a4
X-Git-Newrev: e101c2edd67be39b8aea95a6386f4663c6fbaf39
X-Patchwork-Hint: ignore
Message-Id: <20221207133943.ABA2A85DE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] docs/manual: fixed some
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

commit: https://git.buildroot.net/buildroot/commit/?id=e101c2edd67be39b8aea95a6386f4663c6fbaf39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Fixed some spelling mistakes of countable nouns.

Signed-off-by: Zikui Zhao <zhaozikui@eswincomputing.com>
Reviewed-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a34dcba9ebcda5a1dcb95b332486454776cd305b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
