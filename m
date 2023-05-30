Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33096C77B73
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 19:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C563541B9B;
	Tue, 30 May 2023 19:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C563541B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O_3iih4QlEoN; Tue, 30 May 2023 19:55:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 920C7417EA;
	Tue, 30 May 2023 19:55:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 920C7417EA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A1551BF35F
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50F8440962
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50F8440962
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dDgqyV2L5cQQ for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 19:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83DAE40A0F
 for <buildroot@buildroot.org>; Tue, 30 May 2023 19:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83DAE40A0F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67B3F86AC1; Tue, 30 May 2023 19:54:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 21:53:50 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 21ae60c35f067ddaac03c70e2fa3fe279d695190
X-Git-Newrev: 1d55413b5a41a29df382308a7fa2a60daadadd2f
X-Patchwork-Hint: ignore
Message-Id: <20230530195443.67B3F86AC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/delve: bump to
 version 1.20.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d55413b5a41a29df382308a7fa2a60daadadd2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

https://github.com/go-delve/delve/releases/tag/v1.20.2

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f3bb3797af6247398850c56247d1dd724cfe5539)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/delve/delve.hash | 2 +-
 package/delve/delve.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/delve/delve.hash b/package/delve/delve.hash
index bf730b9047..105249f7f9 100644
--- a/package/delve/delve.hash
+++ b/package/delve/delve.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  39d2e3ae965abf5e71f3d8efbef368b1ee1d7154ea6604ec71d508350d419d03  delve-1.20.0.tar.gz
+sha256  58ad7a7fb42ae2ddd33e7d52dad688b249ca8a358eb73b9e48f91eda79e862a8  delve-1.20.2.tar.gz
 sha256  778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
diff --git a/package/delve/delve.mk b/package/delve/delve.mk
index b43d0f03c8..f261d240b2 100644
--- a/package/delve/delve.mk
+++ b/package/delve/delve.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DELVE_VERSION = 1.20.0
+DELVE_VERSION = 1.20.2
 DELVE_SITE = $(call github,go-delve,delve,v$(DELVE_VERSION))
 DELVE_LICENSE = MIT
 DELVE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
