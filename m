Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191A2CCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E07524109A;
	Thu, 30 Oct 2025 08:22:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id riCgzXWjdbnP; Thu, 30 Oct 2025 08:22:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 162824110B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 162824110B;
	Thu, 30 Oct 2025 08:22:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D5742A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F202640C98
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqQPLRFPYPLz for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:22:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 659D240B95
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 659D240B95
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:22:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63BD587A0E; Thu, 30 Oct 2025 08:22:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:18:20 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 3356a881d446f2cb429a7694c0915ff735941ca3
X-Git-Newrev: b85603261767b4bf1f2f6b24e0f4dd55add8acb4
X-Patchwork-Hint: ignore
Message-Id: <20251030082229.63BD587A0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] DEVELOPERS: add Dario
 Binacchi for libgphoto2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b85603261767b4bf1f2f6b24e0f4dd55add8acb4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2726d965cdaa28c7c21929f4b0aff431304e5e3e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2a428601e2..79a4fd96f9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -803,6 +803,7 @@ F:	package/empty/
 F:	package/iana-assignments/
 F:	package/inih/
 F:	package/less/
+F:	package/libgphoto2/
 F:	package/pocketpy/
 F:	package/sscep/
 F:	package/tinyinit/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
