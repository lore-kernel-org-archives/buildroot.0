Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C955EEB64DD
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D71940260;
	Thu,  6 Jul 2023 11:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D71940260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epY-cbDG6Sc8; Thu,  6 Jul 2023 11:53:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7741541574;
	Thu,  6 Jul 2023 11:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7741541574
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 390181BF97D
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BFFE40886
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BFFE40886
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id grNZSAtc0gor for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:51:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B1D5415C0
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B1D5415C0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED097868F2; Thu,  6 Jul 2023 11:51:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:49:37 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 741c5b325f2ed20a8b761ec821b4d45b3beac3c3
X-Git-Newrev: 6b95c89a0455f9ce5ae059f99d16f4c05bb03d1e
X-Patchwork-Hint: ignore
Message-Id: <20230706115153.ED097868F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/samba4: update
 patch 0004
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b95c89a0455f9ce5ae059f99d16f4c05bb03d1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fix typo in title, add upstream URL

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 95b7465e746c9d51929e9dd6896ec9940188b3b5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
