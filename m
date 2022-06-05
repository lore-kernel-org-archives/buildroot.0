Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37308C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 21:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE88C84181;
	Sun,  5 Jun 2022 21:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJ46nJUHweQ1; Sun,  5 Jun 2022 21:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF88C84172;
	Sun,  5 Jun 2022 21:55:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05F941BF290
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0C1960B3C
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1fFixHyHnXG for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 21:55:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45A4360782
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 21:55:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 80C5486C4E; Sun,  5 Jun 2022 21:43:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jun 2022 23:54:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b461b6562789f5889fceb3139d2c7668d2e7417b
X-Git-Newrev: 19736185d498787e3dfee8e95287ff63523b20ea
X-Patchwork-Hint: ignore
Message-Id: <20220605214330.80C5486C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libbpf: bump to
 version 0.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=19736185d498787e3dfee8e95287ff63523b20ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

License hash changed due to year/owner addition:
https://github.com/libbpf/libbpf/commit/9c44c8a8e01cf86bc801c3b72324358d5ea99e50

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libbpf/libbpf.hash | 4 ++--
 package/libbpf/libbpf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
index 06adc09885..23908ded7c 100644
--- a/package/libbpf/libbpf.hash
+++ b/package/libbpf/libbpf.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  5083588ce5a3a620e395ee1e596af77b4ec5771ffc71cff2af49dfee38c06361  libbpf-0.7.0.tar.gz
+sha256  f4480242651a93c101ece320030f6b2b9b437f622f807719c13cb32569a6d65a  libbpf-0.8.0.tar.gz
 sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
-sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
+sha256  e1638b9a0c68ca90fad3df1d6b4e430804d2fbdc15e58d02cffddfae38953bbf  LICENSE.BSD-2-Clause
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index f50a82b581..987d1145f1 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBPF_VERSION = 0.7.0
+LIBBPF_VERSION = 0.8.0
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
