Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B652AC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 15:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85CDC60EDD;
	Wed,  3 Jul 2024 15:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bvm1HUGB6tFe; Wed,  3 Jul 2024 15:04:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8FD660EE5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8FD660EE5;
	Wed,  3 Jul 2024 15:04:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB92E1BF2FC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98BF340352
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 15:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzChCMCHqdmW for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 15:04:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BC4E40296
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BC4E40296
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 15:04:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 607F583CE7; Wed,  3 Jul 2024 15:04:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 17:04:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a45d68b3c40ddcefd14b4346fc42649e433e90ff
X-Git-Newrev: 4dbfae96b9232eb5aae8d9ce9cc583b02607246d
X-Patchwork-Hint: ignore
Message-Id: <20240703150449.607F583CE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: update Mind logo
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4dbfae96b9232eb5aae8d9ce9cc583b02607246d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Mind logo changed more than a year ago, it is time to move with the
times and update it on the Buildroot website as well!

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 docs/website/images/mind-logo.png | Bin 10214 -> 39378 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/docs/website/images/mind-logo.png b/docs/website/images/mind-logo.png
index ecc3fa09e6..5570d8f45e 100644
Binary files a/docs/website/images/mind-logo.png and b/docs/website/images/mind-logo.png differ
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
