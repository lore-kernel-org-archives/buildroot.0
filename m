Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5870C35FF1
	for <buildroot@archiver.kernel.org>; Thu, 13 Mar 2025 20:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85ABD41787;
	Thu, 13 Mar 2025 20:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POZwe3IXwye5; Thu, 13 Mar 2025 20:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5542D417A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5542D417A9;
	Thu, 13 Mar 2025 20:47:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 547A4118
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38CF3405A3
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:47:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBrtr5Iqb9s5 for <buildroot@buildroot.org>;
 Thu, 13 Mar 2025 20:47:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54DBC40486
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54DBC40486
 for <buildroot@buildroot.org>; Thu, 13 Mar 2025 20:47:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41CC587FAD; Thu, 13 Mar 2025 20:47:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Mar 2025 21:42:52 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: be2a4ed89abc4e8476bc3e6fb4726790a220546a
X-Git-Newrev: e2e59f88911f726dec223a8eae487c20d1bfac94
X-Patchwork-Hint: ignore
Message-Id: <20250313204703.41CC587FAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: update email
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2e59f88911f726dec223a8eae487c20d1bfac94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Update my email address in the DEVELOPERS file.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fee61e3d8db2b76fddf4b3e86c43a5ec4cab7c55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index ace35117d6..dc7b445064 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -166,7 +166,7 @@ F:	package/wine/
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
