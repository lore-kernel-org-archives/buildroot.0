Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74892C77B7C
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 17:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC8F0409E2;
	Thu,  3 Jul 2025 17:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9iur3Ab7lO3s; Thu,  3 Jul 2025 17:11:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37A9A4098B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37A9A4098B;
	Thu,  3 Jul 2025 17:11:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 06F6C15F
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E195D83B8C
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGRwaBaZohIQ for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 17:11:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 178A283B84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 178A283B84
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 17:11:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12F1285C2F; Thu,  3 Jul 2025 17:11:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Jul 2025 19:06:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ea1225d4f73025e8ce42264835303a8790c0d01
X-Git-Newrev: d8523b00e08c6729e18f341c61c704eaf319d3af
X-Patchwork-Hint: ignore
Message-Id: <20250703171143.12F1285C2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gvfs: update website URL
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d8523b00e08c6729e18f341c61c704eaf319d3af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The website URL was outdated, resulting in an HTTP error 403 Forbidden

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gvfs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
index 68ad291436..720b8e6c20 100644
--- a/package/gvfs/Config.in
+++ b/package/gvfs/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_GVFS
 	  all applications using the gio API. It also supports exposing
 	  the gvfs mounts to non-gio applications using fuse.
 
-	  https://wiki.gnome.org/action/show/Projects/gvfs
+	  https://wiki.gnome.org/Projects/gvfs
 
 comment "gvfs needs a toolchain w/ wchar, threads, dynamic library"
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
