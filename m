Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD33CE8D61
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2715241348;
	Thu, 19 Sep 2024 09:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id meX0yE0cc4Ml; Thu, 19 Sep 2024 09:15:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A00C4412B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A00C4412B0;
	Thu, 19 Sep 2024 09:15:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 10EBD1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A100A84941
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q-oQGV6dNM4X for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B82A584291
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B82A584291
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B521583C4D; Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:10 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: f0027556593aacb12136ff572b9b54d2a4af9d02
X-Git-Newrev: a5b3306b0495a4f8c4e7a48d501e96c981d65938
X-Patchwork-Hint: ignore
Message-Id: <20240919091451.B521583C4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 docs/manual/using-buildroot-toolchain.adoc: fix overridden typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5b3306b0495a4f8c4e7a48d501e96c981d65938
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Overridden is with double-r-double-d.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d729696451c899b8db149f9f6346db3f1b678ad5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/using-buildroot-toolchain.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/using-buildroot-toolchain.adoc b/docs/manual/using-buildroot-toolchain.adoc
index 09408ef05a..fd9dda753b 100644
--- a/docs/manual/using-buildroot-toolchain.adoc
+++ b/docs/manual/using-buildroot-toolchain.adoc
@@ -16,7 +16,7 @@ Alternatively, Buildroot can also export the toolchain and the development
 files of all selected packages, as an SDK, by running the command
 +make sdk+. This generates a tarball of the content of the host directory
 +output/host/+, named +<TARGET-TUPLE>_sdk-buildroot.tar.gz+ (which can be
-overriden by setting the environment variable +BR2_SDK_PREFIX+) and
+overridden by setting the environment variable +BR2_SDK_PREFIX+) and
 located in the output directory +output/images/+.
 
 This tarball can then be distributed to application developers, when
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
