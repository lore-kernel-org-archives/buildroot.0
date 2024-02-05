Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0CAC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 196A881F39;
	Mon,  5 Feb 2024 22:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 196A881F39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f11-WvXm-U0Z; Mon,  5 Feb 2024 22:55:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72A2981F0B;
	Mon,  5 Feb 2024 22:55:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72A2981F0B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E063E1BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C10D940B5B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C10D940B5B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3hbHI8xJNHG for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:55:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D97A440589
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D97A440589
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4B1486EB1; Mon,  5 Feb 2024 22:55:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 23:49:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70601ca41c2bb67d056a4c6e5710647385acda29
X-Git-Newrev: 420d34a8ad20bc1aefb7ca0c50e7d2beae1d85ec
X-Patchwork-Hint: ignore
Message-Id: <20240205225539.C4B1486EB1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: remove unused import from
 sample_python_crossbar
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

commit: https://git.buildroot.net/buildroot/commit/?id=420d34a8ad20bc1aefb7ca0c50e7d2beae1d85ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/tests/package/sample_python_crossbar.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_crossbar.py b/support/testing/tests/package/sample_python_crossbar.py
index 8160a37219..3695fe92c0 100644
--- a/support/testing/tests/package/sample_python_crossbar.py
+++ b/support/testing/tests/package/sample_python_crossbar.py
@@ -1,4 +1,3 @@
-import os
 import crossbar
 
 crossbar.run(["version"])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
