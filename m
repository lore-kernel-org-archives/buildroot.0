Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167EBC02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 08:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB1B2847F8;
	Sat, 14 Sep 2024 08:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ln4Az5ewNoSr; Sat, 14 Sep 2024 08:23:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAE1D847F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAE1D847F5;
	Sat, 14 Sep 2024 08:23:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6A3C1BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C75D403EB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 08:22:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sijXM7rIlZw7 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26E31404B2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26E31404B2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 232F086F59; Sat, 14 Sep 2024 08:22:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 10:19:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c805d1e7c7a7de0b88157e08860fb3bc3ae3b50d
X-Git-Newrev: 339c50ecdc47cae80f6079721eafeb053df6e1ef
X-Patchwork-Hint: ignore
Message-Id: <20240914082255.232F086F59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: fix overridden typo in
 patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=339c50ecdc47cae80f6079721eafeb053df6e1ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch b/package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch
index 7b3abea307..90dffad96e 100644
--- a/package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch
+++ b/package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Bug 1801182 - Allow overriding OS_ARCH, OS_TEST and
  OS_RELEASE in Makefile
 
 Starting from Make 4.3.91 simple expanded variables can't be safely
-overriden via command line anymore, so let's use conditional expanded
+overridden via command line anymore, so let's use conditional expanded
 variables to override OS_ARCH, OS_TEST and OS_RELEASE.
 
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
