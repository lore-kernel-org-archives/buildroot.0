Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E41C4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1769F407BD;
	Mon, 12 Feb 2024 21:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r0aoJpRqiGJf; Mon, 12 Feb 2024 21:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D22D407A6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D22D407A6;
	Mon, 12 Feb 2024 21:56:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9ECB41BF868
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BB0E40695
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:56:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47nQ36TlN9Ca for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B926440523
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B926440523
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:56:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A299C878D1; Mon, 12 Feb 2024 21:56:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 22:54:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 835c647375182da571bfb0170b7cd7750cad38e4
X-Git-Newrev: fa9893ad8fb94278d7e8b80cd3e795469223faf0
X-Patchwork-Hint: ignore
Message-Id: <20240212215607.A299C878D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnu-efi: bump to version 3.0.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=fa9893ad8fb94278d7e8b80cd3e795469223faf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For commit logs, see:
https://sourceforge.net/p/gnu-efi/code/ci/3.0.17/log/

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gnu-efi/gnu-efi.hash | 6 +++---
 package/gnu-efi/gnu-efi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index 251a99e5d7..7d98650991 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/gnu-efi/files
-md5  192d94e995ddd4ebdce4903adfd06039  gnu-efi-3.0.15.tar.bz2
-sha1  40c8a4715cf8c409a093c8d2ca9f5d5b24d73058  gnu-efi-3.0.15.tar.bz2
+md5  832496719182e7d6a4b12bc7c0b534d2  gnu-efi-3.0.17.tar.bz2
+sha1  9715285022124b231520d58b26709f5ab338e981  gnu-efi-3.0.17.tar.bz2
 # Locally computed
-sha256  931a257b9c5c1ba65ff519f18373c438a26825f2db7866b163e96d1b168f20ea  gnu-efi-3.0.15.tar.bz2
+sha256  7807e903349343a7a142ebb934703a2872235e89688cf586c032b0a1087bcaf4  gnu-efi-3.0.17.tar.bz2
 sha256  42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  README.efilib
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 686a14be01..8b9a6aa4c6 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 3.0.15
+GNU_EFI_VERSION = 3.0.17
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
