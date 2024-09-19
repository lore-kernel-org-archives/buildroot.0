Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0642CE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68497432AE;
	Thu, 19 Sep 2024 09:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u9vkmKvSYW0c; Thu, 19 Sep 2024 09:17:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 335E1432B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 335E1432B5;
	Thu, 19 Sep 2024 09:17:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BAC01BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8ADD384775
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQrPH8kN7ZsS for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A95849DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8A95849DB
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E64A883C06; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:44 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 588c331e423e7206d54abdd0efbcdeca87386736
X-Git-Newrev: e5287283a092c6984a740e643d1ee7ef64ae4671
X-Patchwork-Hint: ignore
Message-Id: <20240919091606.E64A883C06@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/chocolate-doom:
 fix multiple typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5287283a092c6984a740e643d1ee7ef64ae4671
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8e6d5e49fe49192777f90116fbc8d0a125165eaa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../chocolate-doom/0001-Remove-redundant-demoextend-definition.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch b/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch
index bbfbdbb2d6..06bf54c583 100644
--- a/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch
+++ b/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch
@@ -4,7 +4,7 @@ Date: Sun, 15 Mar 2020 16:55:33 -0500
 Subject: [PATCH] Remove redundant demoextend definition
 
 GCC 10 enables -fno-common by default, which causes the linker to fail when
-there are multple definitions of a global variable.
+there are multiple definitions of a global variable.
 
 See https://gcc.gnu.org/gcc-10/porting_to.html
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
