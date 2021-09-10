Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99391C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 13:08:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F14D461167
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 13:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F14D461167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C8656139A;
	Fri, 10 Sep 2021 13:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dov-czE40t5v; Fri, 10 Sep 2021 13:08:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16FF660EAA;
	Fri, 10 Sep 2021 13:08:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE0D01BF317
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 13:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8AE8406F5
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 13:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jbB5gNFTicwk for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 13:07:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75AE7406A4
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 13:07:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C0D1588D19; Fri, 10 Sep 2021 13:06:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 15:06:46 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 920e704204cc2cffdb6ede155b1d0a56ec57278f
X-Git-Newrev: cd258e78a0d8172ba37f60d65163fce4a81f9267
X-Patchwork-Hint: ignore
Message-Id: <20210910130619.C0D1588D19@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] Config.in.legacy: drop
 2021.08 entry duplicate
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cd258e78a0d8172ba37f60d65163fce4a81f9267
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Drop 2021.08 entry duplicate added with commit
531b2a10cda6bae78ecc141c9fe48f2024f71dbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e5ff29c4a286037b1e083de1dd9f5935edafd623)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 68c9f3ca49..6f71575f8a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -224,8 +224,6 @@ config BR2_PACKAGE_PHP_EXT_XMLRPC
 	  The XMLRPC php extension was removed.
 	  See: https://wiki.php.net/rfc/unbundle_xmlprc
 
-comment "Legacy options removed in 2021.08"
-
 config BR2_GCC_VERSION_8_X
 	bool "gcc 8.x support removed"
 	select BR2_LEGACY
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
