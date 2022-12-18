Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D60C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5722A4F0CA;
	Mon, 20 Feb 2023 22:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5722A4F0CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SHm4xQ4Sa01q; Mon, 20 Feb 2023 22:30:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36FDF4F0C6;
	Mon, 20 Feb 2023 22:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36FDF4F0C6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0CEB91BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC622416E9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC622416E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wpqy8XJuyRzw for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A1DA416E4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A1DA416E4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07A9486495; Mon, 20 Feb 2023 20:52:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 16:48:34 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f9ad317507cf8564200b88dda2463406d0171122
X-Git-Newrev: 66c2d6d4b43776d4afb62b985a082bf2d75cb708
X-Patchwork-Hint: ignore
Message-Id: <20230220205213.07A9486495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/vuejs-router: fix
 license hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=66c2d6d4b43776d4afb62b985a082bf2d75cb708
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 2fce36d928082685d7f77c3587e15b7827ce0b42 forgot to update LICENSE
hash (update in year:
https://github.com/vuejs/router/commit/ed238db64b2a605f785ee4e2f847a6788c06a2ea)

Fixes:
 - http://autobuild.buildroot.org/results/beac411246342a9445495bc7c8f6a7e7369b9c53

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vuejs-router/vuejs-router.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
index 147e730f20..b48e59ef48 100644
--- a/package/vuejs-router/vuejs-router.hash
+++ b/package/vuejs-router/vuejs-router.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256  437558a84b99d0d89743d4897ec16a90a96a1d3a6786e697a8808a044bcb9b8f  vue-router-4.1.6.tgz
-sha256  9c0015250f592a09d7787efc07152afcf661fff6bda2554359f6d00987828c02  LICENSE
+sha256  91a2845c4db44e7497b514b98634a674c737986ad0db81599307cf733bf850b2  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
