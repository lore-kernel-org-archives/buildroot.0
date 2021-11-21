Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85793C433EF
	for <buildroot@archiver.kernel.org>; Sun, 21 Nov 2021 20:46:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FCEB40477;
	Sun, 21 Nov 2021 20:46:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQc_H4aht9Iz; Sun, 21 Nov 2021 20:46:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81C284046C;
	Sun, 21 Nov 2021 20:46:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C96C1BF3EB
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 666714046A
 for <buildroot@lists.busybox.net>; Sun, 21 Nov 2021 20:46:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-BVZqGu-gAa for <buildroot@lists.busybox.net>;
 Sun, 21 Nov 2021 20:46:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A38D64045D
 for <buildroot@buildroot.org>; Sun, 21 Nov 2021 20:46:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 81EBD8DC5E; Sun, 21 Nov 2021 20:41:44 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 21:46:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a479fdd86b57ce9fd239c250c09229b78272cc43
X-Git-Newrev: bb081e49239850ad6d20673403a273489cd566a0
X-Patchwork-Hint: ignore
Message-Id: <20211121204144.81EBD8DC5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/micropython: replace BSD-{1,
 3}-clause
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb081e49239850ad6d20673403a273489cd566a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace BSD-{1,3}-clause by BSD-{1,3}-Clause

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/micropython/micropython.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index c49ca23449..55c00ba08a 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -9,7 +9,7 @@ MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION)
 # Micropython has a lot of code copied from other projects, and also a number
 # of submodules for various libs. However, we don't even clone the submodules,
 # and most of the copied code is not used in the unix build.
-MICROPYTHON_LICENSE = MIT, BSD-1-clause, BSD-3-clause, Zlib
+MICROPYTHON_LICENSE = MIT, BSD-1-Clause, BSD-3-Clause, Zlib
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
