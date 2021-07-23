Return-Path: <SRS0=JV6j=MP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D48E5C4338F
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 08:02:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5130B60E8E
	for <buildroot@archiver.kernel.org>; Fri, 23 Jul 2021 08:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5130B60E8E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2308D4017A;
	Fri, 23 Jul 2021 08:02:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R7bnQ96Qtf93; Fri, 23 Jul 2021 08:02:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5641640151;
	Fri, 23 Jul 2021 08:02:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3457E1BF4D8
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 08:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30A2660664
 for <buildroot@lists.busybox.net>; Fri, 23 Jul 2021 08:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SNmYBkqVwjgl for <buildroot@lists.busybox.net>;
 Fri, 23 Jul 2021 08:01:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FDD6600CA
 for <buildroot@buildroot.org>; Fri, 23 Jul 2021 08:01:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id BB5688880F; Fri, 23 Jul 2021 07:27:37 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 23 Jul 2021 10:00:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed12e2fbed3d4298ebff9da54fe56b91fa75c41e
X-Git-Newrev: fb58ce9735a42f3b250741bbb4994a75db4f7e09
X-Patchwork-Hint: ignore
Message-Id: <20210723072737.BB5688880F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libvirt: remove consecutive empty
 lines
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=fb58ce9735a42f3b250741bbb4994a75db4f7e09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1446469318
Fixes: fbf25acfbfd5a73b3560918bea081768abbe5723

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libvirt/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index 1d17fc1621..2f191882cc 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -37,7 +37,6 @@ config BR2_PACKAGE_LIBVIRT
 
 	  https://libvirt.org/
 
-
 if BR2_PACKAGE_LIBVIRT
 
 config BR2_PACKAGE_LIBVIRT_DAEMON
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
