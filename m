Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFDDC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 22:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C94D583F4C;
	Fri, 12 Jul 2024 22:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V1LofaCg--pT; Fri, 12 Jul 2024 22:10:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEE4283F98
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEE4283F98;
	Fri, 12 Jul 2024 22:10:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E91051BF427
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3A55606A6
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 22:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F4v7dPmXxEdE for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 22:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B50460656
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B50460656
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 22:10:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C14282BD9; Fri, 12 Jul 2024 22:10:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 00:09:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5ff56ef06c46bc870cc677d34cec2639852c823
X-Git-Newrev: 91cd9488005e7f0fce7ead126f1e637deefcaf02
X-Patchwork-Hint: ignore
Message-Id: <20240712221044.0C14282BD9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/btrfs-progs: update Kconfig
 package homepage URL
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=91cd9488005e7f0fce7ead126f1e637deefcaf02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The btrfs-progs homepage [1] show a banner:

    OBSOLETE CONTENT
    This wiki has been archived and the content is no longer updated.

    NOTE: this wiki is archived and not updated anymore (02/2023).
    Contents will be migrated to https://btrfs.readthedocs.io

This commit updates the URL to the new one at [2].

[1] https://btrfs.wiki.kernel.org/index.php/Main_Page
[2] https://btrfs.readthedocs.io

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/btrfs-progs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/btrfs-progs/Config.in b/package/btrfs-progs/Config.in
index 35dfc39193..bae096061d 100644
--- a/package/btrfs-progs/Config.in
+++ b/package/btrfs-progs/Config.in
@@ -10,7 +10,7 @@ config BR2_PACKAGE_BTRFS_PROGS
 	help
 	  Btrfs filesystem utilities
 
-	  https://btrfs.wiki.kernel.org/index.php/Main_Page
+	  https://btrfs.readthedocs.io
 
 comment "btrfs-progs needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
