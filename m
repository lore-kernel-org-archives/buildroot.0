Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B99AC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:01:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 561F160EE9
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 561F160EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A5C48440D;
	Wed,  4 Aug 2021 01:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CN-hsrvI6Cca; Wed,  4 Aug 2021 01:01:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65AA884406;
	Wed,  4 Aug 2021 01:01:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 748A81BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1C7F41464
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2AG8AeNOkLp for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6576D414B4
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B96D087C2D; Tue,  3 Aug 2021 21:10:24 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 00:02:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c7981035bd03b22f544278b4d039361b5295d7eb
X-Git-Newrev: dbf8047f64f081ffbc97b67dd891690632377692
X-Patchwork-Hint: ignore
Message-Id: <20210803211024.B96D087C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkcs11-helper: bump to
 version 1.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbf8047f64f081ffbc97b67dd891690632377692
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/OpenSC/pkcs11-helper/releases/tag/pkcs11-helper-1.27

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkcs11-helper/pkcs11-helper.hash | 2 +-
 package/pkcs11-helper/pkcs11-helper.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pkcs11-helper/pkcs11-helper.hash b/package/pkcs11-helper/pkcs11-helper.hash
index 276ed2e221..d707bcf914 100644
--- a/package/pkcs11-helper/pkcs11-helper.hash
+++ b/package/pkcs11-helper/pkcs11-helper.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e5e2eefeda6c3db3d8862b42b180a6a5b2f41285f35b0ad0d622c6767683fd84  pkcs11-helper-1.26.tar.gz
+sha256  653730f0c561bbf5941754c0783976113589b2dc64a0661c908dc878bfa4e58b  pkcs11-helper-1.27.0.tar.bz2
 sha256  808705ac1daafe07a76431929575c5712a8693977a39ec9102aed25f030754d9  COPYING
 sha256  865496cf23a6c792739ff2f9ea11e95ac99db89cfe3780a295b4e1495a9c19fe  COPYING.BSD
 sha256  cd2e7d63a11058f19c58b06fb8c759140ce70788369dce6e6e9db40d3475021e  COPYING.GPL
diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index a651be98bb..805e000759 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PKCS11_HELPER_VERSION = 1.26
-PKCS11_HELPER_SITE = $(call github,OpenSC,pkcs11-helper,pkcs11-helper-$(PKCS11_HELPER_VERSION))
+PKCS11_HELPER_VERSION = 1.27
+PKCS11_HELPER_SOURCE = pkcs11-helper-$(PKCS11_HELPER_VERSION).0.tar.bz2
+PKCS11_HELPER_SITE = https://github.com/OpenSC/pkcs11-helper/releases/download/pkcs11-helper-$(PKCS11_HELPER_VERSION)
 PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
 PKCS11_HELPER_LICENSE_FILES = COPYING COPYING.BSD COPYING.GPL
 PKCS11_HELPER_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
