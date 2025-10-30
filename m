Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D2DCCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D55F441155;
	Thu, 30 Oct 2025 08:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XeKK5kA6sQfr; Thu, 30 Oct 2025 08:10:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5D7D41157
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5D7D41157;
	Thu, 30 Oct 2025 08:10:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F7B6707
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FBD4612E8
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sf_NE7INj11 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DE76611C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DE76611C3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58F3F879FB; Thu, 30 Oct 2025 08:10:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 08:55:57 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 952abe662215b25edcbacd325566db2026dff90a
X-Git-Newrev: 95c4ddcfb5f8ce88187c68d8eaa856dfbbafb17e
X-Patchwork-Hint: ignore
Message-Id: <20251030081039.58F3F879FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/waffle: fix
 website reference
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

commit: https://git.buildroot.net/buildroot/commit/?id=95c4ddcfb5f8ce88187c68d8eaa856dfbbafb17e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

http://www.waffle-gl.org yields "403 Forbidden".
Switch to freedesktop.org subdomain.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9d188bd4231816993de51b38894701788459b593)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/waffle/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/waffle/Config.in b/package/waffle/Config.in
index 79cb4ca2ed..c8661e1a0b 100644
--- a/package/waffle/Config.in
+++ b/package/waffle/Config.in
@@ -44,4 +44,4 @@ config BR2_PACKAGE_WAFFLE
 	  [1] http://piglit.freedesktop.org
 	  [2] http://github.com/apitrace/apitrace#readme
 
-	  http://www.waffle-gl.org
+	  https://waffle.freedesktop.org/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
