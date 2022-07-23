Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7B0C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDE9761035;
	Sat, 23 Jul 2022 16:21:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDE9761035
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CvWYhuCxncOe; Sat, 23 Jul 2022 16:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0B1A60ECE;
	Sat, 23 Jul 2022 16:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0B1A60ECE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B4D81BF271
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83CC660ECE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:21:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 83CC660ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oDs3_DBPnBBV for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:21:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7A7460E79
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7A7460E79
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 96DB6846D4; Sat, 23 Jul 2022 16:08:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 18:21:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92f0ef5eaa74af28b2b7b7abbe021bce2aba4875
X-Git-Newrev: b58e2cde5ccc955eb02f627688f49cc7af5f23a1
X-Patchwork-Hint: ignore
Message-Id: <20220723160804.96DB6846D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/readme.txt: Fix typo "get-developers"
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

commit: https://git.buildroot.net/buildroot/commit/?id=b58e2cde5ccc955eb02f627688f49cc7af5f23a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo on line 23 `get-developpers` to `get-developers`

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/readme.txt b/utils/readme.txt
index 3064ecec32..3e8833c4ea 100644
--- a/utils/readme.txt
+++ b/utils/readme.txt
@@ -20,7 +20,7 @@ genrandconfig
     (http://autobuild.buildroot.org). It selects a random toolchain from
     support/config-fragments/autobuild and randomly selects packages to build.
 
-get-developpers
+get-developers
     a script to return the list of people interested in a specific part
     of Buildroot, so they can be Cc:ed on a mail. Accepts a patch as
     input, a package name or and architecture name.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
