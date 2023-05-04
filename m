Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8C9C77B78
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 20:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C4B1427A5;
	Thu,  4 May 2023 20:41:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C4B1427A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Q2GQW1kvNvu; Thu,  4 May 2023 20:41:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 242DF42739;
	Thu,  4 May 2023 20:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 242DF42739
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA1781BF3B8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C8404270A
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C8404270A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ivPa0eYb2kXX for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 20:41:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43FB142799
 for <buildroot@buildroot.org>; Thu,  4 May 2023 20:41:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43FB142799
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1212C85DAD; Thu,  4 May 2023 20:41:08 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 4 May 2023 22:30:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ee49d6272b7046c0d961da0b3950e0f78b89a0b
X-Git-Newrev: 689ce0eb80842135c7834434784b89935d93ed8d
X-Patchwork-Hint: ignore
Message-Id: <20230504204108.1212C85DAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/edid-decode: bump version to
 2d44e1b
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

commit: https://git.buildroot.net/buildroot/commit/?id=689ce0eb80842135c7834434784b89935d93ed8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/edid-decode/edid-decode.hash | 2 +-
 package/edid-decode/edid-decode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edid-decode/edid-decode.hash b/package/edid-decode/edid-decode.hash
index 65d6c71079..8bece94911 100644
--- a/package/edid-decode/edid-decode.hash
+++ b/package/edid-decode/edid-decode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c1a6222083c59f0499b3e43c159aee7e4c6c07d33b790d490a13fd62942fa9b5  edid-decode-188950472c19492547e298b27f9da0d72cf826df-br1.tar.gz
+sha256  a8774f1d3eb031ffa4ecb85135b47ad28afeeaa7cf9e8410c5b51a29b83bbfdd  edid-decode-2d44e1b01c7ed7d65b20ecdce62d354841832201-br1.tar.gz
 sha256  9bc7ab961e9a07dc84eaa0210af388def56d024357e79671fb89fe27d073eed7  LICENSE
diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
index 7e463c02b1..cd0bdfa0f0 100644
--- a/package/edid-decode/edid-decode.mk
+++ b/package/edid-decode/edid-decode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EDID_DECODE_VERSION = 188950472c19492547e298b27f9da0d72cf826df
+EDID_DECODE_VERSION = 2d44e1b01c7ed7d65b20ecdce62d354841832201
 EDID_DECODE_SITE = git://linuxtv.org/edid-decode.git
 EDID_DECODE_LICENSE = MIT
 EDID_DECODE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
