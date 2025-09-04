Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4004CA1015
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:33:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3930A6063E;
	Thu,  4 Sep 2025 16:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AnZnUjkGapJT; Thu,  4 Sep 2025 16:33:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2426A6063A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2426A6063A;
	Thu,  4 Sep 2025 16:33:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ECCFAE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8511840097
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TjtOM361UlkE for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A1C74006D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A1C74006D
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9843987E99; Thu,  4 Sep 2025 16:33:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:02:58 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 46d3fc2595313b4257df6ec8ff4f66029c377b8e
X-Git-Newrev: 14364c7384bb827fab81effd2d8e56fb403a6d22
X-Patchwork-Hint: ignore
Message-Id: <20250904163334.9843987E99@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] DEVELOPERS: upgrade
 Andreas Ziegler's email address
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=14364c7384bb827fab81effd2d8e56fb403a6d22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The old one lasted for 10 years, lately spam
levels reached a rather uncomfortable level ...

Signed-off-by: Andreas Ziegler <br015@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e13a3c95c111168b1bfe0ec9fdb0879a83490b18)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7e73d9b2bd..75caa50993 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -187,7 +187,7 @@ F:	package/pkg-qmake.mk
 F:	package/qt5/qt5opcua/
 F:	package/qt6/qt6opcua/
 
-N:	Andreas Ziegler <br015@umbiko.net>
+N:	Andreas Ziegler <br025@umbiko.net>
 F:	package/mpd/
 
 N:	Andrey Smirnov <andrew.smirnov@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
