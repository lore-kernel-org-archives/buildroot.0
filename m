Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8158BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 18 Dec 2022 15:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 226188141B;
	Sun, 18 Dec 2022 15:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 226188141B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zcvcz8VAqAR4; Sun, 18 Dec 2022 15:51:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B17481411;
	Sun, 18 Dec 2022 15:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B17481411
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7715B1BF279
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 15:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52D1F60648
 for <buildroot@lists.busybox.net>; Sun, 18 Dec 2022 15:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52D1F60648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zgmHrWH_yDxe for <buildroot@lists.busybox.net>;
 Sun, 18 Dec 2022 15:51:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DD5A60615
 for <buildroot@buildroot.org>; Sun, 18 Dec 2022 15:51:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DD5A60615
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 795DD86942; Sun, 18 Dec 2022 15:51:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 16:48:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9ad317507cf8564200b88dda2463406d0171122
X-Git-Newrev: 66c2d6d4b43776d4afb62b985a082bf2d75cb708
X-Patchwork-Hint: ignore
Message-Id: <20221218155152.795DD86942@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vuejs-router: fix license hash
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
