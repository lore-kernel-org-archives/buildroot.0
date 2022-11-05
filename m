Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2B5C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 12:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DAF640336;
	Sat,  5 Nov 2022 12:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DAF640336
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxlwp0l6wGrs; Sat,  5 Nov 2022 12:30:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 479D3400DC;
	Sat,  5 Nov 2022 12:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 479D3400DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 962B81BF82F
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 12:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77CA9400DC
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 12:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77CA9400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hCjZjkh1Q-xg for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 12:30:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74FDA4004D
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 12:30:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74FDA4004D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61069874A0; Sat,  5 Nov 2022 12:30:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 13:27:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b17cd017e8b946d718c81f0e38fd570e6a6bc0d
X-Git-Newrev: 4721367debff67d2a4fddb3a5d72796ebbb401f8
X-Patchwork-Hint: ignore
Message-Id: <20221105123003.61069874A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gawk: renumber remaining patch
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
