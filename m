Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C27C2BD09
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 20:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB37A60628;
	Fri, 28 Jun 2024 20:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yja0fmQ9QndW; Fri, 28 Jun 2024 20:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1B3F60699
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1B3F60699;
	Fri, 28 Jun 2024 20:23:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A6541BF3BA
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 20:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68E0D60699
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 20:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQT03P0btPAe for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 20:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CCAB60628
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CCAB60628
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 20:23:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 667F2835E3; Fri, 28 Jun 2024 20:23:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 22:22:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4928032d6c58ff64b0aa4af1874aed7c3aa43842
X-Git-Newrev: d09597bbaeaff551d8968dd17f85f2f65ffa515e
X-Patchwork-Hint: ignore
Message-Id: <20240628202352.667F2835E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cpulimit: Refresh patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=d09597bbaeaff551d8968dd17f85f2f65ffa515e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure that
/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch applies
cleanly without any fuzz by refreshing it.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
Tested-by: Yann E. MORIN <yann.morin@orange.com>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch b/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
index fa32e3ede2..c0a457cdfd 100644
--- a/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
+++ b/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
@@ -35,8 +35,8 @@ index 06d73a6f3541..d4f6fab3385c 100644
  #include <signal.h>
 +#include <libgen.h>
  
- #include <assert.h>
- 
+ #if defined(__APPLE__) || defined(__FREEBSD__)
+ #include <libgen.h>
 -- 
 2.25.1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
