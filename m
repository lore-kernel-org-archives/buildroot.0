Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AB8E95A95
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 15:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577486126D;
	Mon,  9 Oct 2023 15:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 577486126D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXGiKmcaXqxh; Mon,  9 Oct 2023 15:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52F9661274;
	Mon,  9 Oct 2023 15:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52F9661274
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 424A91BF364
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C3D041521
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C3D041521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id syIL1ECxGUdw for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 15:06:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57FE141478
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 15:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57FE141478
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41B188445E; Mon,  9 Oct 2023 15:06:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 9 Oct 2023 17:03:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 083e65a67c84f83a3403c92c51d89f8c94907c55
X-Git-Newrev: bfb1ced92b570cde70a53062067771225ee752c7
X-Patchwork-Hint: ignore
Message-Id: <20231009150615.41B188445E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/firewalld: bump version to 2.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfb1ced92b570cde70a53062067771225ee752c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/firewalld/firewalld.hash | 2 +-
 package/firewalld/firewalld.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/firewalld/firewalld.hash b/package/firewalld/firewalld.hash
index d8be3f7ba0..53bfed0347 100644
--- a/package/firewalld/firewalld.hash
+++ b/package/firewalld/firewalld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3be5a3caa36d1026c5b72d3f61dd963dccd953791b04af03d9946b24bef8391e  firewalld-1.3.2.tar.gz
+sha256  61022eec66fa7ea0561924dfe65d17bab5ec512b3559198a05048a32264612d1  firewalld-2.0.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index 13edba6d24..6b2813e54d 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FIREWALLD_VERSION = 1.3.2
+FIREWALLD_VERSION = 2.0.1
 FIREWALLD_SITE = $(call github,firewalld,firewalld,v$(FIREWALLD_VERSION))
 FIREWALLD_LICENSE = GPL-2.0
 FIREWALLD_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
