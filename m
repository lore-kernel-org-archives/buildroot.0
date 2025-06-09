Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C439BC61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 20:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87EAE613CA;
	Mon,  9 Jun 2025 20:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TsrthSDLce-a; Mon,  9 Jun 2025 20:46:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D21E3614BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D21E3614BC;
	Mon,  9 Jun 2025 20:46:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C36A1F2
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 20:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D618614BC
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 20:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qGSmpgkOYY0D for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 20:46:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4033613CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4033613CA
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 20:46:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B12568012F; Mon,  9 Jun 2025 20:46:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 9 Jun 2025 22:45:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c32f8a99bbc695da9c4a77210a4c9d44fec413a6
X-Git-Newrev: fa3549dca7b93ea3cb1728fe4108315cf904b4fa
X-Patchwork-Hint: ignore
Message-Id: <20250609204605.B12568012F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Kickoff 2025.08 cycle
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa3549dca7b93ea3cb1728fe4108315cf904b4fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a0ad100980..26db176674 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.05
+export BR2_VERSION := 2025.08-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1749500000
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
