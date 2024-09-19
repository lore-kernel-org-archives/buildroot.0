Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CF3CE8D62
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71757416A2;
	Thu, 19 Sep 2024 09:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-QVbnaI67Gt; Thu, 19 Sep 2024 09:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60B4D415D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60B4D415D4;
	Thu, 19 Sep 2024 09:16:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4991BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31E1284715
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68Eg-UmBdiSS for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7F4184942
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D7F4184942
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C24DF80D9D; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:26 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 657687322bdefa8ebb55f3121920bc223c30a498
X-Git-Newrev: 4365f248359a404c351a70b689939d09901cf042
X-Patchwork-Hint: ignore
Message-Id: <20240919091452.C24DF80D9D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 package/falcosecurity-libs: fix which typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=4365f248359a404c351a70b689939d09901cf042
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6ce119ca021c69339739781b8321a7870fb18d7e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/falcosecurity-libs/falcosecurity-libs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/falcosecurity-libs/falcosecurity-libs.mk b/package/falcosecurity-libs/falcosecurity-libs.mk
index 4245f9581a..3783b8421b 100644
--- a/package/falcosecurity-libs/falcosecurity-libs.mk
+++ b/package/falcosecurity-libs/falcosecurity-libs.mk
@@ -44,7 +44,7 @@ define FALCOSECURITY_LIBS_LINUX_CONFIG_FIXUPS
 endef
 
 # falcosecurity-libs creates the module Makefile from a template, which contains
-# a single place-holder, KBUILD_FLAGS, wich is only replaced with debug flags,
+# a single place-holder, KBUILD_FLAGS, which is only replaced with debug flags,
 # which we don't care about here.
 # So, just replace the place-holder with the only meaningful value: nothing.
 # For the DRIVER_NAME, we set it to FALCOSECURITY_LIBS_DRIVER_NAME.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
