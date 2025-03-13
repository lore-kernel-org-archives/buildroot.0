Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7B2C35FF1
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 20:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93EB4417B0;
	Thu, 13 Mar 2025 20:49:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qQhXdDTXVHx; Thu, 13 Mar 2025 20:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 086F94179D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 086F94179D;
	Thu, 13 Mar 2025 20:49:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15776EA
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7581401A2
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:49:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5XszcPCe2eu for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 20:48:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0534409DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0534409DC
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:48:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2AE987FC1; Thu, 13 Mar 2025 20:48:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Mar 2025 21:38:15 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 9b3d080b62bf6790d6183c93ab5482513ab6f5a0
X-Git-Newrev: a6c50d8c8d37da249385b48bf85371f284283329
X-Patchwork-Hint: ignore
Message-Id: <20250313204858.D2AE987FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] DEVELOPERS: update email
 address for Andreas Naumann
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a6c50d8c8d37da249385b48bf85371f284283329
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Update my email address in the DEVELOPERS file.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fee61e3d8db2b76fddf4b3e86c43a5ec4cab7c55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b0b5860bfa..87658eee3a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -177,7 +177,7 @@ F:	package/wine/
 N:	Andreas Klinger <ak@it-klinger.de>
 F:	package/ply/
 
-N:	Andreas Naumann <ANaumann@ultratronik.de>
+N:	Andreas Naumann <dev@andin.de>
 F:	package/evemu/
 F:	package/libevdev/
 F:	package/pkg-qmake.mk
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
