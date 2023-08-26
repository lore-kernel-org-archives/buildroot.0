Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDF3C83F11
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54167405BF;
	Sat, 26 Aug 2023 18:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54167405BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ru4TDDUw1waO; Sat, 26 Aug 2023 18:48:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B7C2405D6;
	Sat, 26 Aug 2023 18:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B7C2405D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CDD7C1BF37C
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4C9081F49
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4C9081F49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3RjpoGdciozE for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:48:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E979A81F31
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E979A81F31
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5C2A863F6; Sat, 26 Aug 2023 18:48:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 19:37:42 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 1e87afecbbe05e787be123ed379993e26b827ce7
X-Git-Newrev: 96466e31910a1b1f59686d962e7714a706b18cbd
X-Patchwork-Hint: ignore
Message-Id: <20230826184802.D5C2A863F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/samba4: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=96466e31910a1b1f59686d962e7714a706b18cbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
