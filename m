Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C5DC636D3
	for <buildroot@archiver.kernel.org>; Sun, 12 Feb 2023 20:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53131813C5;
	Sun, 12 Feb 2023 20:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53131813C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8OnZaX9H1Uvm; Sun, 12 Feb 2023 20:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68E4F813BD;
	Sun, 12 Feb 2023 20:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68E4F813BD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14E361BF865
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3A28408E6
 for <buildroot@lists.busybox.net>; Sun, 12 Feb 2023 20:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3A28408E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6T2l8bkv1DAk for <buildroot@lists.busybox.net>;
 Sun, 12 Feb 2023 20:29:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04BF9408E1
 for <buildroot@buildroot.org>; Sun, 12 Feb 2023 20:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04BF9408E1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E190185789; Sun, 12 Feb 2023 20:29:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Feb 2023 21:27:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0dc2fa3865b0dbb2a6c103d6bc3bbc294ada604
X-Git-Newrev: 6dbf3909dd4816230001f0d71dd31d9e96939083
X-Patchwork-Hint: ignore
Message-Id: <20230212202900.E190185789@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zxing-cpp: update homepage
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

commit: https://git.buildroot.net/buildroot/commit/?id=6dbf3909dd4816230001f0d71dd31d9e96939083
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 456a7398316655ad0b669635f580e4887c24a700 decided to switch to an
active fork but forgot to update homepage in Config.in

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zxing-cpp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zxing-cpp/Config.in b/package/zxing-cpp/Config.in
index 6c17565d2a..2550dcf023 100644
--- a/package/zxing-cpp/Config.in
+++ b/package/zxing-cpp/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_ZXING_CPP
 	  implemented in Java, with ports to other languages. This
 	  compiles the C++ port.
 
-	  https://github.com/glassechidna/zxing-cpp
+	  https://github.com/zxing-cpp/zxing-cpp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
