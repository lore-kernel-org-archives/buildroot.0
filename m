Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1600E71068
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 12:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C12A83C2C;
	Thu, 21 Sep 2023 12:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C12A83C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IpvNLG0Yrm3d; Thu, 21 Sep 2023 12:50:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEA878200E;
	Thu, 21 Sep 2023 12:50:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEA878200E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01EE61BF3AD
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD0EA40A54
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 12:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD0EA40A54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vREdK5qqjDSl for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 12:50:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28433409BD
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 12:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28433409BD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1194487454; Thu, 21 Sep 2023 12:50:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Sep 2023 14:50:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40a2d729fd330e671624a587cee4eed1a36b9a9c
X-Git-Newrev: 50827a45ee0eb3f4fa27e10a166c44953f653724
X-Patchwork-Hint: ignore
Message-Id: <20230921125019.1194487454@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/multipath-tools: update hash of
 README.md
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=50827a45ee0eb3f4fa27e10a166c44953f653724
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 9ca60c004d69e1f38000e3a74151b0a90aca7f21 forgot to update hash of
README.md (multipathc added with
https://github.com/opensvc/multipath-tools/commit/f220ab6678184b156b800c2885c0147acc9b2aa8)

Fixes:
 - http://autobuild.buildroot.org/results/633ceb38996af7c95331ebe878ae8ba8a4b9b7de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/multipath-tools/multipath-tools.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index 158f0faa96..06aa5ccc80 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -4,4 +4,4 @@ sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENS
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1
-sha256  b8b4369c539d6a61ad2a5a359a1ecdfb9f630a89590216d490314e19bf07aa0c  README.md
+sha256  5887418b2e0e595da5aca08b2dff25298f20618f9894d5e26ce852d9d1ae90c4  README.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
