Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B6AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 13:08:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 581B261167
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 13:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 581B261167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0902E4074D;
	Fri, 10 Sep 2021 13:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pEc7U_ASQF6I; Fri, 10 Sep 2021 13:08:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF1DF40797;
	Fri, 10 Sep 2021 13:08:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 518591BF317
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 13:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41B9284AA6
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 13:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ICvvUE9iwKj9 for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 13:08:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47B0584A8D
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 13:08:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 95BA788D1C; Fri, 10 Sep 2021 13:06:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 15:04:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f127cc420884adbd42f174ffa9973af01aa827b
X-Git-Newrev: e5ff29c4a286037b1e083de1dd9f5935edafd623
X-Patchwork-Hint: ignore
Message-Id: <20210910130632.95BA788D1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in.legacy: drop 2021.08 entry
 duplicate
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5ff29c4a286037b1e083de1dd9f5935edafd623
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop 2021.08 entry duplicate added with commit
531b2a10cda6bae78ecc141c9fe48f2024f71dbc

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
