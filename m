Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA6EC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93B8260BD8;
	Sun, 14 Aug 2022 19:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93B8260BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ooacWajB10yD; Sun, 14 Aug 2022 19:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2BC560B9A;
	Sun, 14 Aug 2022 19:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2BC560B9A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5D81BF30C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3637C409FF
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3637C409FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MyBLSdJTgkZu for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:21:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BA67409FD
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BA67409FD
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9FF0687542; Sun, 14 Aug 2022 19:06:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 21:20:35 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 048c6a5adf9640bd874fc380113553ca94e4cf83
X-Git-Newrev: b562565c5d5e2881b37ed18841446bc7ae7b7df5
X-Patchwork-Hint: ignore
Message-Id: <20220814190648.9FF0687542@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] utils/readme.txt: Fix
 typo "get-developers"
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

commit: https://git.buildroot.net/buildroot/commit/?id=b562565c5d5e2881b37ed18841446bc7ae7b7df5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fix typo on line 23 `get-developpers` to `get-developers`

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b58e2cde5ccc955eb02f627688f49cc7af5f23a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
