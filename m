Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F088C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:23:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0213760F70
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0213760F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA20480F22;
	Sun, 24 Oct 2021 13:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hrJsmWbHQ4W2; Sun, 24 Oct 2021 13:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 211AF80F1E;
	Sun, 24 Oct 2021 13:23:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 229721BF2F2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FC244015B
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hqwgwOUA-UxS for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:23:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A9EB40132
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 13:23:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B19B588594; Sun, 24 Oct 2021 13:20:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 15:10:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7cdfec3f779d164fca835c172b278f9faee04559
X-Git-Newrev: 1d1a17083b1d588a6fb55f18dc617b5f6b7a6b1d
X-Patchwork-Hint: ignore
Message-Id: <20211024132022.B19B588594@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flite: bump to version 2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d1a17083b1d588a6fb55f18dc617b5f6b7a6b1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch site to github to get latest release

https://github.com/festvox/flite/releases/tag/v2.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flite/flite.hash | 2 +-
 package/flite/flite.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/flite/flite.hash b/package/flite/flite.hash
index f21a21d186..35ec61960a 100644
--- a/package/flite/flite.hash
+++ b/package/flite/flite.hash
@@ -1,4 +1,4 @@
 # locally computed hash
-sha256  c73c3f6a2ea764977d6eaf0a287722d1e2066b4697088c552e342c790f3d2b85  flite-2.1-release.tar.bz2
+sha256  ab1555fe5adc3f99f1d4a1a0eb1596d329fd6d74f1464a0097c81f53c0cf9e5c  flite-2.2.tar.gz
 # License files, locally calculated
 sha256  d31bceaf2823d56a8c9400f7bde3b17140e739e991eb4f203bdcf9827754ab59  COPYING
diff --git a/package/flite/flite.mk b/package/flite/flite.mk
index fd5f4ec172..79b2288fe3 100644
--- a/package/flite/flite.mk
+++ b/package/flite/flite.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-FLITE_VERSION = 2.1
-FLITE_SOURCE = flite-$(FLITE_VERSION)-release.tar.bz2
-FLITE_SITE = http://www.festvox.org/flite/packed/flite-$(FLITE_VERSION)
+FLITE_VERSION = 2.2
+FLITE_SITE = $(call github,festvox,flite,v$(FLITE_VERSION))
 FLITE_LICENSE = BSD-4-Clause
 FLITE_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
