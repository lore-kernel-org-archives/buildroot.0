Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8608DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 20:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24E2881338;
	Sun, 27 Feb 2022 20:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hVqK21-buA7F; Sun, 27 Feb 2022 20:18:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 587EE812FE;
	Sun, 27 Feb 2022 20:18:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29A2A1BF2AA
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:18:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 257E6812E6
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:18:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-ZH7264xiuO for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 20:18:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 453A9812D1
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 20:18:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C2C958275A; Sun, 27 Feb 2022 20:10:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 21:13:54 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 8ab26921c23da19f38a7f1e40a7e758546b5e58b
X-Git-Newrev: e3fdd722744ba0403e2faafbd34038ba0a6eb7b9
X-Patchwork-Hint: ignore
Message-Id: <20220227201037.C2C958275A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] docs/manual: fix "+size =
 +" latex formatting
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3fdd722744ba0403e2faafbd34038ba0a6eb7b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 46beca0656505e9a9d4d5d17d22f40550ac487c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/writing-rules.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 28cb0fe4f1..7e2b5f909c 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -184,7 +184,7 @@ image sdimage.img {
 * Every node(+section+, +partition+, +file+, +subnode+) must have an open
   curly bracket on the same line of the node's name, while the closing one
   must be on a newline and after it a newline must be added except for the
-  last one node. Same goes for its option, for example option +size = +.
+  last one node. Same goes for its option, for example option +size+ +=+.
 
 * Every +option+(i.e. +image+, +offset+, +size+) must have the +=+
   assignment one space from it and one space from the value specified.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
