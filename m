Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D1BC43217
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 21:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CD28607DE;
	Mon, 14 Nov 2022 21:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CD28607DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25Iry1Bk-56y; Mon, 14 Nov 2022 21:16:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C8CE60709;
	Mon, 14 Nov 2022 21:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C8CE60709
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E0C2E1BF296
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 21:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C923A402B1
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 21:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C923A402B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZlaSCrChzhyP for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 21:16:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10300400F8
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 21:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10300400F8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F26F783A85; Mon, 14 Nov 2022 21:16:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 14 Nov 2022 22:14:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3d6aa73ada756b8291a16413b36a952a8d93225d
X-Git-Newrev: 01fec1b37265fdbd2e89f0217bccd35275e32f98
X-Patchwork-Hint: ignore
Message-Id: <20221114211602.F26F783A85@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lttng-modules: bump to
 2.13.7
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
Content-Type: multipart/mixed; boundary="===============5800042357207639668=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5800042357207639668==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=01fec1b37265fdbd2e89f0217bccd35275e32f98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is the latest point release in the stable 2.13 branch (currently
the latest stable branch available).

Cc: Clément Léger <clement.leger@bootlin.com>
Reported-by: Clément Léger <clement.leger@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lttng-modules/lttng-modules.hash | 4 ++--
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index fb253c9bf6..e685cc3367 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-modules/lttng-modules-2.13.1.tar.bz2.sha256
-sha256  a7c86d91c9bbe66d27f025aa04b8cfc6d7785ed2fc7ef774930800ee44d7f343  lttng-modules-2.13.1.tar.bz2
+# From https://lttng.org/files/lttng-modules/lttng-modules-2.13.7.tar.bz2.sha256
+sha256  5a99679df7903160cbde3918fee5af90ffafc90fc96ccdefaa57cf230492b234  lttng-modules-2.13.7.tar.bz2
 
 # Hash for license files
 sha256  d72921266bc8452a8789f8a04a82755373990d00b7e0b0f1a8edb8f854e94d1c  LICENSES/LGPL-2.1
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 97cda53f08..416833f4ef 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.13.1
+LTTNG_MODULES_VERSION = 2.13.7
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPL-2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)

--===============5800042357207639668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5800042357207639668==--
