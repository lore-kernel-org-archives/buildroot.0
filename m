Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B277C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 14:15:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E43B1613D1
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 14:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E43B1613D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC4EF82BC4;
	Wed, 29 Sep 2021 14:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vv4HqYEt1Qmv; Wed, 29 Sep 2021 14:15:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 227BE82B97;
	Wed, 29 Sep 2021 14:15:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB4631BF426
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 14:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBA9A82BC8
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 14:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpD27J7xuc1s for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 14:15:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 211D382BC0
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 14:15:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 45A048D4A5; Wed, 29 Sep 2021 14:13:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 11:59:11 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 4109107eb9e4bde6eb3b29ce5eb894adf34fc2be
X-Git-Newrev: 7e93d664d9a63e4b804a40419830c2803c7af97b
X-Patchwork-Hint: ignore
Message-Id: <20210929141302.45A048D4A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/runc: bump to
 version 1.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e93d664d9a63e4b804a40419830c2803c7af97b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

https://github.com/opencontainers/runc/releases/tag/v1.0.2
https://github.com/opencontainers/runc/releases/tag/v1.0.1
https://github.com/opencontainers/runc/releases/tag/v1.0.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 21704ad112e0eb2be4692e5b81cb95a53ae48d95)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 6 +-----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index 598bd3067f..365beac21d 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  02dac7f1a0dcfe55dd9820df787adedf030060870354915e7bba86f8487ce93c  runc-1.0.0-rc95.tar.gz
+sha256  6c3cca4bbeb5d9b2f5e3c0c401c9d27bc8a5d2a0db8a2f6a06efd03ad3c38a33  runc-1.0.2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 62b9f09bf2..e77ef8111e 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,15 +4,11 @@
 #
 ################################################################################
 
-RUNC_VERSION_MAJOR = 1.0.0
-RUNC_VERSION_MINOR = rc95
-RUNC_VERSION = $(RUNC_VERSION_MAJOR)-$(RUNC_VERSION_MINOR)
+RUNC_VERSION = 1.0.2
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 RUNC_CPE_ID_VENDOR = linuxfoundation
-RUNC_CPE_ID_VERSION = $(RUNC_VERSION_MAJOR)
-RUNC_CPE_ID_UPDATE = $(RUNC_VERSION_MINOR)
 
 RUNC_LDFLAGS = -X main.version=$(RUNC_VERSION)
 RUNC_TAGS = cgo static_build
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
