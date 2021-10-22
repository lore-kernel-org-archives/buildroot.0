Return-Path: <SRS0=MwHx=PK=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814C5C433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:50:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D13E6103E
	for <buildroot@archiver.kernel.org>; Fri, 22 Oct 2021 18:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D13E6103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EA5C4023E;
	Fri, 22 Oct 2021 18:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SyD3E6Sltasr; Fri, 22 Oct 2021 18:50:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15E43401C1;
	Fri, 22 Oct 2021 18:50:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7368C1C1135
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6155E4023E
 for <buildroot@lists.busybox.net>; Fri, 22 Oct 2021 18:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uy47XMUrYGSN for <buildroot@lists.busybox.net>;
 Fri, 22 Oct 2021 18:49:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DD6E400F5
 for <buildroot@buildroot.org>; Fri, 22 Oct 2021 18:49:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EBD44884A4; Fri, 22 Oct 2021 18:46:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Oct 2021 20:30:27 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: b8bc852f63a71f977a4eadd67e30d0a1242fc982
X-Git-Newrev: da9b4f5fe555e3f57446c70fd7b2439f10a560b1
X-Patchwork-Hint: ignore
Message-Id: <20211022184639.EBD44884A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/cryptsetup: bump
 to version 2.3.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=da9b4f5fe555e3f57446c70fd7b2439f10a560b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Stable bug-fix release with minor extensions.

All users of cryptsetup 2.x and later should upgrade to this version.

https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.3.6/docs/v2.3.5-ReleaseNotes
https://gitlab.com/cryptsetup/cryptsetup/-/blob/v2.3.6/docs/v2.3.6-ReleaseNotes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d6eb905376d0af595b01aa8007cac1d4de7175b7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 package/cryptsetup/cryptsetup.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index 3b58345611..0aa3f79df7 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/cryptsetup/v2.3/sha256sums.asc
-sha256  9d16eebb96b53b514778e813019b8dd15fea9fec5aafde9fae5febf59df83773  cryptsetup-2.3.4.tar.xz
+sha256  b296b7a21ea576c2b180611ccb19d06aec8dddaedf7c704b0c6a81210c25635f  cryptsetup-2.3.6.tar.xz
 sha256  45670cce8b6a0ddd66c8016cd8ccef6cd71f35717cbacc7f1e895b3855207b33  COPYING
 sha256  8c33cc37871654ec7ed87e6fbb896c8cf33ef5ef05b1611a5aed857596ffafa5  COPYING.LGPL
diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index b816dc2f22..3cf6c8a301 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CRYPTSETUP_VERSION_MAJOR = 2.3
-CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).4
+CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).6
 CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
 CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
 CRYPTSETUP_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
