Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177A1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 05:20:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5600160F70
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 05:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5600160F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0ECC402B7;
	Tue, 21 Sep 2021 05:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FabTpF9API4F; Tue, 21 Sep 2021 05:20:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02F1E4018B;
	Tue, 21 Sep 2021 05:20:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1ADD61BF285
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 05:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A67681000
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 05:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rFvg9eAp8Ld for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 05:20:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A89180F8B
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 05:20:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B45458B8A5; Tue, 21 Sep 2021 05:18:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 21:10:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94da7ebeda2f7f3d661b05f1c8402b9369f904ad
X-Git-Newrev: 3b84d5fa4c4aba0324825846baec7eb29deebf1c
X-Patchwork-Hint: ignore
Message-Id: <20210921051847.B45458B8A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libupnp: bump to version 1.14.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b84d5fa4c4aba0324825846baec7eb29deebf1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/pupnp/pupnp/blob/release-1.14.10/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libupnp/libupnp.hash | 2 +-
 package/libupnp/libupnp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libupnp/libupnp.hash b/package/libupnp/libupnp.hash
index f7fdb6d521..1c8a302682 100644
--- a/package/libupnp/libupnp.hash
+++ b/package/libupnp/libupnp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7b66ac4a86bc0e218e2771ac274b2945bc4154bf9054e57b14afb67c26ac7c24  libupnp-1.14.7.tar.bz2
+sha256  dc417f5ef0a9182d76b6cf38bdf863e2fb1ee3c353c56fa82e354edef7ba50f2  libupnp-1.14.10.tar.bz2
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 7457d2644a..ef2b724efa 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUPNP_VERSION = 1.14.7
+LIBUPNP_VERSION = 1.14.10
 LIBUPNP_SOURCE = libupnp-$(LIBUPNP_VERSION).tar.bz2
 LIBUPNP_SITE = \
 	http://downloads.sourceforge.net/project/pupnp/release-$(LIBUPNP_VERSION)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
