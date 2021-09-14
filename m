Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 927F3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 13:02:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63472610E6
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 13:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63472610E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F46A40359;
	Tue, 14 Sep 2021 13:02:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KGr2vURnkyc8; Tue, 14 Sep 2021 13:02:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20D2C40353;
	Tue, 14 Sep 2021 13:02:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 887E21BF2F6
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 13:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 779FE607E5
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 13:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cfyTq3PQTZpc for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 13:01:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBA17607D3
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 13:01:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DC6108B38A; Tue, 14 Sep 2021 12:59:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 14:56:27 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9481e9f8af11b0922076244bdddb73583e3f9f44
X-Git-Newrev: 885eec4448c4c02459c3a14402381d99de570e7d
X-Patchwork-Hint: ignore
Message-Id: <20210914125931.DC6108B38A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/gd: bump to
 version 2.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=885eec4448c4c02459c3a14402381d99de570e7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 970b2ca3cc3f927f679c871eeadb22ec110b0ed5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gd/gd.hash | 2 +-
 package/gd/gd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gd/gd.hash b/package/gd/gd.hash
index 5aec317f2d..3fd4ca0eb5 100644
--- a/package/gd/gd.hash
+++ b/package/gd/gd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ecd9155b9a417fb3f837f29e5966323796de247789163761dd72dbf83bfcac58  libgd-2.3.0.tar.xz
+sha256  9767917d9f818faec4ddd763fe4a4ad9f6322c3d25da290ab2ea3e2ce4b52a7b  libgd-2.3.1.tar.xz
 sha256  4d80b4af6c38d7a65128c881623dee2a5daee6b3a6ccab74a5cdfa0dfda96da7  COPYING
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index 6de7b73836..cb4f70e7a2 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GD_VERSION = 2.3.0
+GD_VERSION = 2.3.1
 GD_SOURCE = libgd-$(GD_VERSION).tar.xz
 GD_SITE = https://github.com/libgd/libgd/releases/download/gd-$(GD_VERSION)
 GD_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
