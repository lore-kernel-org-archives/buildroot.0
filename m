Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C47CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 08:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35C4660F4B;
	Thu, 27 Jan 2022 08:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MdVQehutiwiF; Thu, 27 Jan 2022 08:05:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 745D961098;
	Thu, 27 Jan 2022 08:05:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC46B1C1135
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 08:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AF906106B
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 08:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NTFA4sepO9Fj for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 08:05:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9376D60F4B
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 08:05:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 323B2827A2; Thu, 27 Jan 2022 07:58:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 08:57:43 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: acb675ec4c3c776713a9fb671aa0a1372b293174
X-Git-Newrev: 0b5d05b92c97053be8b45b2477e87f4c32791929
X-Patchwork-Hint: ignore
Message-Id: <20220127075826.323B2827A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libpri: add Linux
 in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b5d05b92c97053be8b45b2477e87f4c32791929
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Add "Linux" before kernel in comment to be consistent with other
packages and manual

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0730b8b8228391ec36ace6e1d1d0831590b8d0cf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
