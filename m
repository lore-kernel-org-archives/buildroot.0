Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD444EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A70D421D0;
	Fri, 28 Jul 2023 20:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A70D421D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4bowoNNnwPcF; Fri, 28 Jul 2023 20:10:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E4ED42172;
	Fri, 28 Jul 2023 20:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E4ED42172
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 994F11BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72E3D4013D
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72E3D4013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cag7NAjk1bZr for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:10:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A048E400CF
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A048E400CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F10183957; Fri, 28 Jul 2023 20:10:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:09:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d536197234c75d301448369ef47415c79e38a974
X-Git-Newrev: c4f4ae1f15e5686aff4448d62386f3a3e68ef405
X-Patchwork-Hint: ignore
Message-Id: <20230728201025.8F10183957@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: remove patch numbering
 within patch
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c4f4ae1f15e5686aff4448d62386f3a3e68ef405
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  package/libopenssl/0006-Add-linux-x86-latomic-target.patch:4: generate your patches with 'git format-patch -N'

In:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/4763324039

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libopenssl/0006-Add-linux-x86-latomic-target.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/0006-Add-linux-x86-latomic-target.patch b/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
index f47eb1d268..a59db73314 100644
--- a/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
+++ b/package/libopenssl/0006-Add-linux-x86-latomic-target.patch
@@ -1,7 +1,7 @@
 From c80a60dca209813c33ab3d2794bc32d84c12d033 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd@kuhls.net>
 Date: Fri, 28 Jul 2023 17:11:25 +0200
-Subject: [PATCH 1/1] Add linux-x86-latomic target
+Subject: [PATCH] Add linux-x86-latomic target
 
 Upstream: https://github.com/openssl/openssl/pull/21590
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
