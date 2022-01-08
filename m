Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857B1C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B02E408D4;
	Sat,  8 Jan 2022 17:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c3OHtG1UxIOp; Sat,  8 Jan 2022 17:39:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E952408CE;
	Sat,  8 Jan 2022 17:39:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64CB01BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 618E7605B3
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:39:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HZsIcJ3dQIMm for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:39:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0982605AE
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:39:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F35FB83242; Sat,  8 Jan 2022 17:33:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 18:39:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f8aab08e762742d753d5920718f31c629d0f8d7
X-Git-Newrev: 0730b8b8228391ec36ace6e1d1d0831590b8d0cf
X-Patchwork-Hint: ignore
Message-Id: <20220108173322.F35FB83242@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpri: add Linux in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=0730b8b8228391ec36ace6e1d1d0831590b8d0cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add "Linux" before kernel in comment to be consistent with other
packages and manual

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libpri/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpri/Config.in b/package/libpri/Config.in
index de2d96fcc4..0684d2ac83 100644
--- a/package/libpri/Config.in
+++ b/package/libpri/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBPRI
 
 	  http://www.asterisk.org/downloads/libpri
 
-comment "libpri needs a kernel to be built"
+comment "libpri needs a Linux kernel to be built"
 	depends on BR2_USE_MMU
 	depends on !BR2_LINUX_KERNEL
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
