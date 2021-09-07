Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3C9C433F5
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:56:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F24B604AC
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 13:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F24B604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D83E04021F;
	Tue,  7 Sep 2021 13:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29N8vDyFRBH5; Tue,  7 Sep 2021 13:56:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8647401E5;
	Tue,  7 Sep 2021 13:56:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12D241BF2CC
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3E2F60C15
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 13:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mP5EhFo_0eQb for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 13:56:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1C6B605DB
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 13:56:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0344E8881B; Tue,  7 Sep 2021 13:54:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Sep 2021 15:54:34 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 98fb8a6786463761521c757ff44a6f7a82856f29
X-Git-Newrev: 3aeaf1454379edcdb793d4c6f91cba126a790707
X-Patchwork-Hint: ignore
Message-Id: <20210907135433.0344E8881B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/c-ares: add
 C_ARES_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=3aeaf1454379edcdb793d4c6f91cba126a790707
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:c-ares_project:c-ares is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ac-ares_project%3Ac-ares

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2990d7dcb163a5618100a6985726b6820457a6d1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-ares/c-ares.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 761aa73280..71bfa110a1 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -10,6 +10,7 @@ C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
 C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = LICENSE.md
+C_ARES_CPE_ID_VENDOR = c-ares_project
 # We're patching configure.ac
 C_ARES_AUTORECONF = YES
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
