Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE52CE8D63
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47C3F4170E;
	Thu, 19 Sep 2024 09:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szKig2x0rfHA; Thu, 19 Sep 2024 09:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D959041745
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D959041745;
	Thu, 19 Sep 2024 09:16:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F9D51BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3F7984948
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UgEdzPPZUGYB for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D76A84993
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D76A84993
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AA9E83C4D; Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:37 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 75feb672cb92affebfcdd2ed3920eb4ef18e6fdb
X-Git-Newrev: c2c336ce64a821426c829dfb073eb7c5c1070dc9
X-Patchwork-Hint: ignore
Message-Id: <20240919091453.5AA9E83C4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/gtest: fix
 explanation typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2c336ce64a821426c829dfb073eb7c5c1070dc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e9beedc3d4151dfaca41922e98d0a6a9f0ce690e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gtest/gtest.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index c252ede818..832c494ff5 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -18,7 +18,7 @@ GTEST_CPE_ID_PRODUCT = google_test
 # gtest.
 # So, force to build gtest as a static library.
 #
-# For further details, refer to the explaination given in the README file from
+# For further details, refer to the explanation given in the README file from
 # the gtest sources.
 GTEST_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
