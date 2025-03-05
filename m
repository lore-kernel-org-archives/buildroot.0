Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3B2C19F32
	for <buildroot@archiver.kernel.org>; Wed,  5 Mar 2025 18:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 383A44076A;
	Wed,  5 Mar 2025 18:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZII6WyNXgmZ; Wed,  5 Mar 2025 18:56:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FB9140859
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FB9140859;
	Wed,  5 Mar 2025 18:56:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 929A5E2E
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 18:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6390D6081A
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 18:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HrJpUnIfOOSS for <buildroot@buildroot.org>;
 Wed,  5 Mar 2025 18:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1FE760720
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1FE760720
 for <buildroot@buildroot.org>; Wed,  5 Mar 2025 18:56:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 866C8875E8; Wed,  5 Mar 2025 18:56:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 5 Mar 2025 19:55:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a031b51637622570609807418d47d8441fdf2501
X-Git-Newrev: 630c20a2b2ad78fa590e80456be9a38484781685
X-Patchwork-Hint: ignore
Message-Id: <20250305185621.866C8875E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: mention glibc / uclibc-ng bumps
 for 2025.02-rc1
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

commit: https://git.buildroot.net/buildroot/commit/?id=630c20a2b2ad78fa590e80456be9a38484781685
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGES b/CHANGES
index cfd963a03e..e8b2eb312a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -10,6 +10,8 @@
 
         - gdb 16.1 added, gdb 15.1 becomes the default.
 
+        - glibc 2.41, uclibc-ng 1.0.51
+
         - Synopsys external ARC toolchains marked as broken as they
           are not "bare" toolchains, causing various build issues
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
