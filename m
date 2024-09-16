Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A863C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 257DB60A8A;
	Mon, 16 Sep 2024 10:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bh67H-F-Z73J; Mon, 16 Sep 2024 10:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3254760A8E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3254760A8E;
	Mon, 16 Sep 2024 10:11:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9D4581BF95A
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89F6440B1E
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bR8K605MHKFF for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DA1740B12
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DA1740B12
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:11:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7922B837A0; Mon, 16 Sep 2024 10:11:35 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 12:08:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a84b7ef68b8551df3e7ba93d4d33e77ca9d40f4c
X-Git-Newrev: f32805c4edefe4ad904f8bc29422a6db6ecacd82
X-Patchwork-Hint: ignore
Message-Id: <20240916101135.7922B837A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-magic-wormhole: bump to
 version 0.15.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f32805c4edefe4ad904f8bc29422a6db6ecacd82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Drop no longer required python-six runtime dependency.

Add new python-iterable-io runtime dependency.

Add new python-zipstream-ng runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-Update-versioneer-to-0.29.patch           | 2185 --------------------
 package/python-magic-wormhole/Config.in            |    3 +-
 .../python-magic-wormhole.hash                     |    4 +-
 .../python-magic-wormhole/python-magic-wormhole.mk |    4 +-
 4 files changed, 6 insertions(+), 2190 deletions(-)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
