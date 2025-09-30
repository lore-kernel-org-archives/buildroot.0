Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0494CCCD183
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 21:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9116614C7;
	Wed,  1 Oct 2025 21:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LeuUw7SrFqQa; Wed,  1 Oct 2025 21:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAF89614CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAF89614CA;
	Wed,  1 Oct 2025 21:00:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11B53D9F
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0BE5614C3
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eCUGItGWm5y for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04D62614C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04D62614C8
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 024C88131F; Wed,  1 Oct 2025 21:00:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:30:24 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: d2c6b391e79782349c50d61ab3e2dbe968ed3f00
X-Git-Newrev: dcd616e49702745c66fc4213a63676537200b1b4
X-Patchwork-Hint: ignore
Message-Id: <20251001210011.024C88131F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] DEVELOPERS: add Dario
 Binacchi for bc
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

commit: https://git.buildroot.net/buildroot/commit/?id=dcd616e49702745c66fc4213a63676537200b1b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d2bd4655259299fded94727e94a4fa4389113202)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5af0df1cf6..75470ca319 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -801,6 +801,7 @@ F:	package/aespipe/
 F:	package/armadillo/
 F:	package/atf/
 F:	package/babeld/
+F:	package/bc/
 F:	package/cmocka/
 F:	package/connman/
 F:	package/iana-assignments/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
