Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F95DC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:46:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F9DB60F38
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F9DB60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A13E40628;
	Tue,  3 Aug 2021 23:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ye9Qh03xAXNm; Tue,  3 Aug 2021 23:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F7C1405FA;
	Tue,  3 Aug 2021 23:46:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 631B61BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E582840F38
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZVUIdtCpICC for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E0D4406A1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6B2CF8283F; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jul 2021 22:41:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2e10364e3b9d86f67549d34987f3b4ed160f01b7
X-Git-Newrev: d6fefd4f21b0d000caf3221846907ea2754bf3b0
X-Patchwork-Hint: ignore
Message-Id: <20210803211008.6B2CF8283F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/icu: bump version to
 69-1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6fefd4f21b0d000caf3221846907ea2754bf3b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes: http://site.icu-project.org/download/69

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/icu/icu.hash | 2 +-
 package/icu/icu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 80cdd7df0c..5ed7cc4217 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a9f2e3d8b4434b8e53878b4308bd1e6ee51c9c7042e2b1a376abefb6fbb29f2d  icu4c-68_1-src.tgz
+sha256  4cba7b7acd1d3c42c44bb0c14be6637098c7faf2b330ce876bc5f3b915d09745  icu4c-69_1-src.tgz
 sha256  7915b19db903070778581ae05d8bf4ea241b34a05deb51ca4f5cbb15ea1cbba3  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 4d67831c76..0a17c61462 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,7 +7,7 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 68-1
+ICU_VERSION = 69-1
 ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
 ICU_SITE = \
 	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
