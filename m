Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29320C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:57:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC0FE6103C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:57:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC0FE6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF6B460673;
	Tue,  3 Aug 2021 19:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sVIzQjcuJTdU; Tue,  3 Aug 2021 19:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 011C76061A;
	Tue,  3 Aug 2021 19:57:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B92B51BF2E4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:57:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B544D6061A
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:57:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V6sYLSYvqAHJ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 19:57:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DD9A605CF
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 19:57:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 81A618B355; Tue,  3 Aug 2021 19:57:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 21:43:47 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 525b98fd11976822fe15874a48ad272b9bc7dd3f
X-Git-Newrev: 71f5e2e92f2b27a257819d95bb828c864d552b4b
X-Patchwork-Hint: ignore
Message-Id: <20210803195719.81A618B355@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/pcre2: add
 PCRE2_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=71f5e2e92f2b27a257819d95bb828c864d552b4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:pcre:pcre2 is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Apcre%3Apcre2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c9bfe7b19efa18d3c23aaf2f42628ac48846c18c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre2/pcre2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index ddb53280f2..84a8413f8e 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -9,6 +9,7 @@ PCRE2_SITE = https://ftp.pcre.org/pub/pcre
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
 PCRE2_LICENSE_FILES = LICENCE
+PCRE2_CPE_ID_VENDOR = pcre
 PCRE2_INSTALL_STAGING = YES
 PCRE2_CONFIG_SCRIPTS = pcre2-config
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
