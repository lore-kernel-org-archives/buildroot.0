Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35970E77180
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 22:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75A1D60E41;
	Mon,  9 Dec 2024 22:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cR1psrlHpnO1; Mon,  9 Dec 2024 22:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F4BA6084C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F4BA6084C;
	Mon,  9 Dec 2024 22:43:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D5F12ED2
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43CCC40289
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AqWkkxl0T32F for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 22:42:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FCFD4029C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FCFD4029C
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 22:42:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2AAB586B5E; Mon,  9 Dec 2024 22:42:28 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Dec 2024 23:34:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34c671688741410a4eb4d83b38874dee00e9ebb9
X-Git-Newrev: 900bf91d104d412853ccc6970cad752c3d217699
X-Patchwork-Hint: ignore
Message-Id: <20241209224228.2AAB586B5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vim: fix 'highlighting' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=900bf91d104d412853ccc6970cad752c3d217699
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/vim/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vim/Config.in b/package/vim/Config.in
index 1469be8dbe..16cf35e1b4 100644
--- a/package/vim/Config.in
+++ b/package/vim/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_VIM_RUNTIME
 	bool "install runtime"
 	default y
 	help
-	  Install VIM runtime (syntax highlighing + macros).
+	  Install VIM runtime (syntax highlighting + macros).
 	  This option adds about 11MB of data to /usr/share/
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
