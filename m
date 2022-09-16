Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC5CECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E891341628;
	Fri, 16 Sep 2022 11:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E891341628
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VA604VYHdrRV; Fri, 16 Sep 2022 11:53:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E28641627;
	Fri, 16 Sep 2022 11:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E28641627
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CCC401BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B60464161B
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B60464161B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N1p6FsYpcFWv for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:47:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E29BE41140
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:47:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E29BE41140
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D16CF83CC5; Fri, 16 Sep 2022 11:47:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:15:04 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: ba1169a88cb462ad1aad7d0aa7fe4192e1a46e7d
X-Git-Newrev: 3540195bd6da98341cd980bbc2eaca9575ec49e9
X-Patchwork-Hint: ignore
Message-Id: <20220916114713.D16CF83CC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/tclap: fix typo
 on help
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

commit: https://git.buildroot.net/buildroot/commit/?id=3540195bd6da98341cd980bbc2eaca9575ec49e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

libary -> library

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 16c1cdef65351d6f99f37000c4421c74515ae9b4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tclap/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tclap/Config.in b/package/tclap/Config.in
index 560cf33174..64b0b74c8a 100644
--- a/package/tclap/Config.in
+++ b/package/tclap/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_TCLAP
 	  This is a small, flexible library that provides a simple
 	  interface for defining and accessing command line
 	  arguments. It was initially inspired by the user friendly
-	  CLAP libary. The difference is that this library is
+	  CLAP library. The difference is that this library is
 	  templatized, so the argument class is type independent. Type
 	  independence avoids identical-except-for-type objects, such
 	  as IntArg, FloatArg, and StringArg. While the library is not
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
