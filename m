Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153E6C25B75
	for <buildroot@archiver.kernel.org>; Wed, 29 May 2024 07:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C42096078E;
	Wed, 29 May 2024 07:19:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZH2K8ppJ3Pc; Wed, 29 May 2024 07:19:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F29E6073D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F29E6073D;
	Wed, 29 May 2024 07:19:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B434F1D3286
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 07:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0D13408E9
 for <buildroot@lists.busybox.net>; Wed, 29 May 2024 07:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67s5Q2xRGrFI for <buildroot@lists.busybox.net>;
 Wed, 29 May 2024 07:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6F9F406E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6F9F406E6
 for <buildroot@buildroot.org>; Wed, 29 May 2024 07:19:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B535287738; Wed, 29 May 2024 07:19:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 May 2024 08:48:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d235a0689a7d571a8b67c474644312989275d3e
X-Git-Newrev: 3beef4b0d41ec862fd89745bc9f496247af7bff7
X-Patchwork-Hint: ignore
Message-Id: <20240529071943.B535287738@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Alexander Mukhin for
 package/zfs
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

commit: https://git.buildroot.net/buildroot/commit/?id=3beef4b0d41ec862fd89745bc9f496247af7bff7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 52c9b84a9d..53ec6049a1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -122,6 +122,7 @@ F:	package/libest/
 
 N:	Alexander Mukhin <alexander.i.mukhin@gmail.com>
 F:	package/tinyproxy/
+F:	package/zfs/
 
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 F:	package/mini-snmpd/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
