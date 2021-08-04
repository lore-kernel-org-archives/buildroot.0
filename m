Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46817C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:05:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D2D60F94
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 14:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10D2D60F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE6C240679;
	Wed,  4 Aug 2021 14:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WMeiqLBpgp8C; Wed,  4 Aug 2021 14:05:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7747B40590;
	Wed,  4 Aug 2021 14:05:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D3CB31BF5E9
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3C9040590
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 14:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MN0MkjHGVq0E for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 14:05:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BF23404DB
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 14:05:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C7D128773E; Wed,  4 Aug 2021 14:05:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 16:05:16 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: cbd09bce7a8c9bbfe134aac99744c1e39e210a90
X-Git-Newrev: 6bf89eb14b146573b4aa6baed29a04d8630bfc56
X-Patchwork-Hint: ignore
Message-Id: <20210804140511.C7D128773E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/ripgrep: add
 RIPGREP_CPE_ID_VENDOR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6bf89eb14b146573b4aa6baed29a04d8630bfc56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:ripgrep_project:ripgrep is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aripgrep_project%3Aripgrep

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 28d198c0b876c34947988101c805ef1ecf215b9c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ripgrep/ripgrep.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ripgrep/ripgrep.mk b/package/ripgrep/ripgrep.mk
index 9dd8d58de1..313f73624d 100644
--- a/package/ripgrep/ripgrep.mk
+++ b/package/ripgrep/ripgrep.mk
@@ -8,6 +8,7 @@ RIPGREP_VERSION = 0.8.1
 RIPGREP_SITE = $(call github,burntsushi,ripgrep,$(RIPGREP_VERSION))
 RIPGREP_LICENSE = MIT
 RIPGREP_LICENSE_FILES = LICENSE-MIT
+RIPGREP_CPE_ID_VENDOR = ripgrep_project
 
 RIPGREP_DEPENDENCIES = host-rustc
 RIPGREP_CARGO_ENV = CARGO_HOME=$(HOST_DIR)/share/cargo
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
