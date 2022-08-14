Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E23C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C29CC60C05;
	Sun, 14 Aug 2022 19:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C29CC60C05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qPlkmJaKaHNP; Sun, 14 Aug 2022 19:25:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A8D260BB2;
	Sun, 14 Aug 2022 19:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A8D260BB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 763EC1BF30C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51359402E4
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:25:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51359402E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fb16hWbo_Nsp for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:25:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F68A4029B
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F68A4029B
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id F0F0987582; Sun, 14 Aug 2022 19:11:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 21:25:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b5710ae3b256924fe0fb5c8c9dc06fb3ac34179
X-Git-Newrev: 69cbdbe8877f5ee1e51d05cfe71b636635df9c3c
X-Patchwork-Hint: ignore
Message-Id: <20220814191126.F0F0987582@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-txdbus: drop comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=69cbdbe8877f5ee1e51d05cfe71b636635df9c3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit a2ba9e7db9bd5fabff738147f73039fc8d4f1b3d forgot to drop comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-txdbus/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-txdbus/Config.in b/package/python-txdbus/Config.in
index f3ea4c78d6..e299596611 100644
--- a/package/python-txdbus/Config.in
+++ b/package/python-txdbus/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_TXDBUS
 	bool "python-txdbus"
 	# python-twisted -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	# python-twisted -> python-cryptography
 	select BR2_PACKAGE_PYTHON_TWISTED # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
