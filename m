Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A62DC78820
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFD0B42CA8;
	Fri, 20 Sep 2024 10:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYI-YMdtXYwC; Fri, 20 Sep 2024 10:35:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B899C42C9C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B899C42C9C;
	Fri, 20 Sep 2024 10:35:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DE5F1BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A771884C32
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:34:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKkehL1YQEns for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:34:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 962E284C4D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 962E284C4D
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92F9483DFA; Fri, 20 Sep 2024 10:34:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:34:09 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b422e8ffba5d12a0ad5dd2bcb49b929bd5af71fa
X-Git-Newrev: bad659bee2a132a1dd45eb0e74bb22f4b6802d2d
X-Patchwork-Hint: ignore
Message-Id: <20240920103452.92F9483DFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/nodejs-src: fix
 convenient typo in patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=bad659bee2a132a1dd45eb0e74bb22f4b6802d2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 28a53f8f55019f67a6f840cb4cfb1eb14028f8d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch b/package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
index 25c26b43bd..ffb8e67a64 100644
--- a/package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
+++ b/package/nodejs/nodejs-src/0004-lib-internal-modules-cjs-loader.js-adjust-default-pa.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] lib/internal/modules/cjs/loader.js: adjust default path to
 
 NPM installs modules in /usr/lib/node_modules/, but by default NodeJS
 searches for them only in /usr/lib/node/. We could also set the
-NODE_PATH environment variable, but it is more convienient to have
+NODE_PATH environment variable, but it is more convenient to have
 NodeJS configured by default to find modules where they are installed.
 
 This issue is discussed at
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
