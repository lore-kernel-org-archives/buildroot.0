Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D55CF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1462260739;
	Sat, 12 Oct 2024 15:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MkGYM5Oi_x98; Sat, 12 Oct 2024 15:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8B71606B4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8B71606B4;
	Sat, 12 Oct 2024 15:03:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AC7F81BF47E
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7BB5402A4
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3bbsEkz1n7Mc for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D023E40160
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D023E40160
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:02:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8C5D85E20; Sat, 12 Oct 2024 15:02:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:00 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 2113a945cd1b18c7eccb33cdceebc25063e583b9
X-Git-Newrev: 8588985bb232061d59fc214d4d95d5df0dcf6171
X-Patchwork-Hint: ignore
Message-Id: <20241012150251.C8C5D85E20@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/qlibc: fix
 'consistent' typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=8588985bb232061d59fc214d4d95d5df0dcf6171
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Also add a missing article one line above.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Arnout: fix additional typo]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 4390361bb517db2e9764b512304f3de41458c666)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qlibc/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qlibc/Config.in b/package/qlibc/Config.in
index ad6f1fee55..cbdf5e15c1 100644
--- a/package/qlibc/Config.in
+++ b/package/qlibc/Config.in
@@ -8,8 +8,8 @@ config BR2_PACKAGE_QLIBC
 	  qLibc is currently one of the most functionally complete
 	  public licensed C/C++ libraries. The C/C++ library which
 	  includes all kinds of containers and general library
-	  routines. It provides ready-made set of common container
-	  APIs with consistant API look.
+	  routines. It provides a ready-made set of common container
+	  APIs with consistent API look.
 
 	  https://github.com/wolkykim/qlibc
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
