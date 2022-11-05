Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4B9C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EF7741B98;
	Mon, 20 Feb 2023 20:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EF7741B98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ObfR9rUdbVvk; Mon, 20 Feb 2023 20:54:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EA2041CEB;
	Mon, 20 Feb 2023 20:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EA2041CEB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 263321BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75B3040C0F
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75B3040C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id agLocbmjBDz0 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5037C40BAA
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5037C40BAA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DD6186494; Mon, 20 Feb 2023 20:51:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 13:27:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0b17cd017e8b946d718c81f0e38fd570e6a6bc0d
X-Git-Newrev: 4721367debff67d2a4fddb3a5d72796ebbb401f8
X-Patchwork-Hint: ignore
Message-Id: <20230220205146.4DD6186494@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gawk: renumber
 remaining patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=4721367debff67d2a4fddb3a5d72796ebbb401f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit aaba432e2cae (package/gawk: drop incorrect patch) was sent on the
list before e6942ad11ff0 (package/gawk: fix double free during kernel
build) was applied. But when aaba432e2cae was eventually applied, the
remaining patch was not renumbered.

Fix that now.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...g-with-Node_elem_new.patch => 0001-Fix-a-bug-with-Node_elem_new.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/gawk/0002-Fix-a-bug-with-Node_elem_new.patch b/package/gawk/0001-Fix-a-bug-with-Node_elem_new.patch
similarity index 100%
rename from package/gawk/0002-Fix-a-bug-with-Node_elem_new.patch
rename to package/gawk/0001-Fix-a-bug-with-Node_elem_new.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
