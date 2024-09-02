Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2EACD342A
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 11:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BC866082C;
	Mon,  2 Sep 2024 11:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1HhLowVjRMI; Mon,  2 Sep 2024 11:18:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73C1D60819
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C1D60819;
	Mon,  2 Sep 2024 11:18:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B32CF1BF8A8
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 11:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A091F40475
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 11:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5lJEms24_JY for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 11:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99240405EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 99240405EB
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 11:18:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8431986994; Mon,  2 Sep 2024 11:18:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Sep 2024 13:15:39 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: b60d6dafb741c7b3ee7aac49a1442f9983452ae4
X-Git-Newrev: 6199d507c3490fccb9b0789ca69a79a96bf165d7
X-Patchwork-Hint: ignore
Message-Id: <20240902111844.8431986994@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gcc: renumber
 11.4.0 patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=6199d507c3490fccb9b0789ca69a79a96bf165d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Patch 0009 should be numbered 0008.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...uild-warning.patch => 0008-libiberty-Darwin-Fix-a-build-warning.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch b/package/gcc/11.4.0/0008-libiberty-Darwin-Fix-a-build-warning.patch
similarity index 100%
rename from package/gcc/11.4.0/0009-libiberty-Darwin-Fix-a-build-warning.patch
rename to package/gcc/11.4.0/0008-libiberty-Darwin-Fix-a-build-warning.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
