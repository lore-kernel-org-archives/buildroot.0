Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF7FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 619C640B64;
	Thu, 27 Jan 2022 07:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ecRQsTmqfEs8; Thu, 27 Jan 2022 07:55:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52A2D40B52;
	Thu, 27 Jan 2022 07:55:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC3951BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DAE7340B52
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 77k78rJlVKNc for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:54:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15F1240B41
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:54:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ABDC28284B; Thu, 27 Jan 2022 07:47:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 08:54:35 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: c17eeadab3aaa04ac0e97bf803b280220cd4f96c
X-Git-Newrev: acb675ec4c3c776713a9fb671aa0a1372b293174
X-Patchwork-Hint: ignore
Message-Id: <20220127074754.ABDC28284B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libeastl: drop
 duplicated sentence
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

commit: https://git.buildroot.net/buildroot/commit/?id=acb675ec4c3c776713a9fb671aa0a1372b293174
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Drop duplicated sentence from Config.in

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 59bbe7cc7418d61a5d2963f1d30e558c3111a95e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libeastl/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libeastl/Config.in b/package/libeastl/Config.in
index 7609434519..5abea8f810 100644
--- a/package/libeastl/Config.in
+++ b/package/libeastl/Config.in
@@ -13,7 +13,6 @@ config BR2_PACKAGE_LIBEASTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	help
 	  EASTL stands for Electronic Arts Standard Template
-	  Library. EASTL stands for Electronic Arts Standard Template
 	  Library. It is a C++ template library of containers,
 	  algorithms, and iterators useful for runtime and tool
 	  development across multiple platforms.  It is an extensive
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
