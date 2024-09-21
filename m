Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97515CF9C64
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67EE141DE0;
	Sat, 21 Sep 2024 18:49:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2KoPo-ZQVPeI; Sat, 21 Sep 2024 18:49:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CBAF423A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CBAF423A9;
	Sat, 21 Sep 2024 18:49:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C79A81BF59E
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC029606E0
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgX9-gaD0yrG for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47B6B6067E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47B6B6067E
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 442B883D95; Sat, 21 Sep 2024 18:48:12 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 20:39:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca4eca4bfa7e1b2603de7834433eb29e86ed1e01
X-Git-Newrev: b0a9bc9ce75c80c67bcc8330841bbcb6ee9b9998
X-Patchwork-Hint: ignore
Message-Id: <20240921184812.442B883D95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/kconfig: fix 'multiple' typo in
 patch description
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0a9bc9ce75c80c67bcc8330841bbcb6ee9b9998
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../patches/18-merge-config.sh-create-temporary-files-in-tmp.patch      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/kconfig/patches/18-merge-config.sh-create-temporary-files-in-tmp.patch b/support/kconfig/patches/18-merge-config.sh-create-temporary-files-in-tmp.patch
index f2a261f308..053366e2fb 100644
--- a/support/kconfig/patches/18-merge-config.sh-create-temporary-files-in-tmp.patch
+++ b/support/kconfig/patches/18-merge-config.sh-create-temporary-files-in-tmp.patch
@@ -5,7 +5,7 @@ Date: Mon, 7 Dec 2015 12:08:45 -0200
     merge_config.sh: create temporary files in /tmp
 
     Creating temporary files in /tmp (or the path pointed by $TMPDIR) allows the
-    buildroot top directory to be read-only and shareable between multible builds.
+    buildroot top directory to be read-only and shareable between multiple builds.
     This follows what other scripts do, e.g. check-kernel-headers.sh.
 
     Signed-off-by: Henrique Marks <henrique.marks@datacom.ind.br>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
