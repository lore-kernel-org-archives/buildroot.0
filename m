Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E88C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1557605A6;
	Mon,  5 Dec 2022 12:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1557605A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnA9TZc750o8; Mon,  5 Dec 2022 12:13:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23F0260593;
	Mon,  5 Dec 2022 12:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23F0260593
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0EC581BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 439A2408EC
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 439A2408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x2Wt2FrtIVhB for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 24D8D40570
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 24D8D40570
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DB7B85B9E; Mon,  5 Dec 2022 11:26:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 10:24:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dda1c73bf32a030f340d5a703413704d8d663fad
X-Git-Newrev: e3d2082b35220c7a36922205a7f96783dc587d20
X-Patchwork-Hint: ignore
Message-Id: <20221205112610.1DB7B85B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: remove patch numbering
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3d2082b35220c7a36922205a7f96783dc587d20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

commit e37c110 ("package/gnuradio: bump version to 3.10.4.0")
included two numbered patches. Those are generating
"make check-package" warnings.

Fixes:
    make check-package
    package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch:4: generate your patches with 'git format-patch -N'
    package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch:4: generate your patches with 'git format-patch -N'

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-blocks-Including-missing-vector-in-blockinterleaver.patch      | 2 +-
 .../0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch b/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
index f805e300af..39b8c0b51e 100644
--- a/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
+++ b/package/gnuradio/0001-blocks-Including-missing-vector-in-blockinterleaver.patch
@@ -1,7 +1,7 @@
 From 45fe4ac55ad88b6793d225e676205c30388ec138 Mon Sep 17 00:00:00 2001
 From: Ryan Volz <ryan.volz@gmail.com>
 Date: Fri, 16 Sep 2022 21:05:51 -0400
-Subject: [PATCH 1/2] blocks: Including missing <vector> in blockinterleaver.
+Subject: [PATCH] blocks: Including missing <vector> in blockinterleaver.
 
 Signed-off-by: Ryan Volz <ryan.volz@gmail.com>
 [Retrieved (and backported) from:
diff --git a/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch b/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
index d551793be5..f1ad77580f 100644
--- a/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
+++ b/package/gnuradio/0002-blocks-blockinterleaving.h-add-missing-cstddef-heade.patch
@@ -1,7 +1,7 @@
 From 901c2ad1ac88908a2e6db5615d5af39a218d826d Mon Sep 17 00:00:00 2001
 From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 Date: Fri, 23 Sep 2022 08:41:26 +0200
-Subject: [PATCH 2/2] blocks/blockinterleaving.h: add missing cstddef header
+Subject: [PATCH] blocks/blockinterleaving.h: add missing cstddef header
  (required for size_t)
 
 Fix build failure like:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
