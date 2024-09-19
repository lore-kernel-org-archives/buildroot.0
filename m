Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF1CCE8D61
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECB0C41502;
	Thu, 19 Sep 2024 09:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXPJZAGefvff; Thu, 19 Sep 2024 09:19:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9D87433A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9D87433A0;
	Thu, 19 Sep 2024 09:19:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 434171BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 578C784396
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OddQPeNHb68H for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F7E8849E0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F7E8849E0
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CFBE83C66; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:49 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1de8bd900678358c9ed689944671f071acbff6f8
X-Git-Newrev: 9ed698bf6737ac405eb1be20b9dd06cc414212de
X-Patchwork-Hint: ignore
Message-Id: <20240919091607.3CFBE83C66@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/exiv2: fix
 'information see' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ed698bf6737ac405eb1be20b9dd06cc414212de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 987cfd586ed6eb65250fd243393d7f33fdc403ab)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exiv2/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exiv2/Config.in b/package/exiv2/Config.in
index 3e3e502751..8407c25b41 100644
--- a/package/exiv2/Config.in
+++ b/package/exiv2/Config.in
@@ -39,6 +39,6 @@ config BR2_PACKAGE_EXIV2_LENSDATA
 
 	  This database comes from a thirdparty and is free to use in
 	  non-commercial, GPL or open source software only.
-	  For more informations src/nikonmn_int.cpp.
+	  For more information see src/nikonmn_int.cpp.
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
