Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7102C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 14:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68A9060E66;
	Mon,  8 Aug 2022 14:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68A9060E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fntiBaGhdrXY; Mon,  8 Aug 2022 14:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C5BE60E3A;
	Mon,  8 Aug 2022 14:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C5BE60E3A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6A7411BF2A5
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 53C5E817BA
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 14:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53C5E817BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oj0XgekBbDzG for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 14:28:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96F67817A3
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 14:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96F67817A3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EC40786FBF; Mon,  8 Aug 2022 14:14:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 16:28:25 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 3736acba6c0339081561dcfe9cde25fa6cf7d474
X-Git-Newrev: f36b3571320e3411e555f284fa6f89e6555ea8cd
X-Patchwork-Hint: ignore
Message-Id: <20220808141436.EC40786FBF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/assimp: add
 ASSIMP_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=f36b3571320e3411e555f284fa6f89e6555ea8cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

cpe:2.3:a:assimp:assimp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aassimp%3Aassimp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6f9283d696820dab746a97a0411bf6d83bd424c7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/assimp/assimp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 42440f0fa9..79865673ac 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -8,6 +8,7 @@ ASSIMP_VERSION = 5.2.1
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
+ASSIMP_CPE_ID_VENDOR = assimp
 ASSIMP_DEPENDENCIES = zlib
 ASSIMP_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
