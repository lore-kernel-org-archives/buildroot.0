Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB21C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30CCA84014;
	Thu, 14 Apr 2022 20:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fgnbrCJodtUm; Thu, 14 Apr 2022 20:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42E0C83FE1;
	Thu, 14 Apr 2022 20:25:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A90A21BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96208409E0
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:24:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ku9LttDkQWWp for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:24:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F34A140142
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:24:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 96C7183D1C; Thu, 14 Apr 2022 20:15:09 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 22:23:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4bd8bbe9fb7e5c34e6062004de53948eff78e6c9
X-Git-Newrev: b7db306b4d341223bb856222a1edf57d96684592
X-Patchwork-Hint: ignore
Message-Id: <20220414201509.96C7183D1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zlib-ng: remove double empty line
 (check-package)
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

commit: https://git.buildroot.net/buildroot/commit/?id=b7db306b4d341223bb856222a1edf57d96684592
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/zlib-ng/zlib-ng.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index dd1723ac86..938acd4181 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -29,5 +29,4 @@ else
 ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
 endif
 
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
