Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FEDC77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 19:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6A5D6FEAD;
	Mon, 10 Apr 2023 19:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6A5D6FEAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AkkAnYph-ZKM; Mon, 10 Apr 2023 19:41:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2E286FED7;
	Mon, 10 Apr 2023 19:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2E286FED7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 271811C3BA7
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA6C3613FE
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA6C3613FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id enBiuGrWS5br for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1373D613FF
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1373D613FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03B4183DBE; Mon, 10 Apr 2023 19:37:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 21:19:19 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 8406e06af3aaaaa2db8f71b815eb1e540796957b
X-Git-Newrev: 737d2217530992f9cf6d0d2e575d9105485b4a9f
X-Patchwork-Hint: ignore
Message-Id: <20230410193723.03B4183DBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libosmium: fix
 double space in Config.in comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=737d2217530992f9cf6d0d2e575d9105485b4a9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e81ca405164fbef1c43fc01aa2f95f67090d3bde)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libosmium/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libosmium/Config.in b/package/libosmium/Config.in
index 3a4c64e9d2..825e2b7e33 100644
--- a/package/libosmium/Config.in
+++ b/package/libosmium/Config.in
@@ -13,6 +13,6 @@ config BR2_PACKAGE_LIBOSMIUM
 
 	  https://osmcode.org/libosmium/
 
-comment "libosmium needs a toolchain w/ C++,  wchar, threads, gcc >= 4.7"
+comment "libosmium needs a toolchain w/ C++, wchar, threads, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
