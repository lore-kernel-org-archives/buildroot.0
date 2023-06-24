Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5843FEB64DC
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 14:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE6F66113C;
	Sat, 24 Jun 2023 14:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE6F66113C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NPSnXFkKC_Ho; Sat, 24 Jun 2023 14:30:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15E7161175;
	Sat, 24 Jun 2023 14:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15E7161175
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AAC871BF870
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 905BA417B6
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 905BA417B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7HbQM_zepmUY for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 14:30:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8900541725
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 14:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8900541725
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 746798455D; Sat, 24 Jun 2023 14:30:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 16:26:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfdf613e3bc709dc58d7490103220fa820e489be
X-Git-Newrev: 95b7465e746c9d51929e9dd6896ec9940188b3b5
X-Patchwork-Hint: ignore
Message-Id: <20230624143016.746798455D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: update patch 0004
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

commit: https://git.buildroot.net/buildroot/commit/?id=95b7465e746c9d51929e9dd6896ec9940188b3b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix typo in title, add upstream URL

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch b/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
index 7eb31e5d07..aa55c09891 100644
--- a/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
+++ b/package/samba4/0004-3rdparty-heindal-Use-perl-module-JSON-part-of-core-i.patch
@@ -1,15 +1,15 @@
 From bd8fc19c8383914b518a9d56f4c08fba3baeb967 Mon Sep 17 00:00:00 2001
 From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Date: Sun, 7 May 2023 11:02:26 +0200
-Subject: [PATCH] 3rdparty/heindal: Use perl module JSON, part of core, instead
- of JSON:PP package
+Subject: [PATCH] 3rdparty/heimdal: Use perl module JSON:PP, part of core, instead
+ of JSON package
 
 Downloaded from
 https://github.com/openwrt/packages/blob/master/net/samba4/patches/105-perl-json-pp.patch
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
-Upstream: unknown
+Upstream: https://github.com/heimdal/heimdal/pull/1176
 ---
  third_party/heimdal/cf/make-proto.pl | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
