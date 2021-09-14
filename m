Return-Path: <SRS0=SwR/=OE=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EC7C433FE
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 06:15:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF80F60F36
	for <buildroot@archiver.kernel.org>; Tue, 14 Sep 2021 06:15:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF80F60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9C8480E23;
	Tue, 14 Sep 2021 06:15:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sg0yga1dglWX; Tue, 14 Sep 2021 06:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB11380E3D;
	Tue, 14 Sep 2021 06:15:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 268861BF990
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 06:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1717480E08
 for <buildroot@lists.busybox.net>; Tue, 14 Sep 2021 06:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZoFRpbD-v4n for <buildroot@lists.busybox.net>;
 Tue, 14 Sep 2021 06:14:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B84880C2D
 for <buildroot@buildroot.org>; Tue, 14 Sep 2021 06:14:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 051C58AF44; Tue, 14 Sep 2021 06:13:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Sep 2021 08:13:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7919e68a60c6055bb2a729b5aeb6d47e7bbe924
X-Git-Newrev: 141c4726c226b0e187c527ce320f897ef71f1311
X-Patchwork-Hint: ignore
Message-Id: <20210914061300.051C58AF44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fdk-aac: bump to version 2.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=141c4726c226b0e187c527ce320f897ef71f1311
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/mstorsjo/fdk-aac/releases/tag/v2.0.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fdk-aac/fdk-aac.hash | 8 ++++----
 package/fdk-aac/fdk-aac.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/fdk-aac/fdk-aac.hash b/package/fdk-aac/fdk-aac.hash
index 6b41e66a61..b10d5f92b1 100644
--- a/package/fdk-aac/fdk-aac.hash
+++ b/package/fdk-aac/fdk-aac.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/opencore-amr/files/fdk-aac/
-sha1 575e90e85321c5be44dcf743a40ea57ab0835928  fdk-aac-2.0.1.tar.gz
-md5 e8b0b38e837df455b8a1ba75417ff0ad  fdk-aac-2.0.1.tar.gz
+sha1  579b34e8174b4feb21a9c598695f5ff4a7ceef8c  fdk-aac-2.0.2.tar.gz
+md5  b41222194b31f570b3132bd622a9aef6  fdk-aac-2.0.2.tar.gz
 # Locally computed:
-sha256 840133aa9412153894af03b27b03dde1188772442c316a4ce2a24ed70093f271  fdk-aac-2.0.1.tar.gz
-sha256 95ec80da40b4af12ad4c4f3158c9cfb80f2479f3246e4260cb600827cc8c7836  NOTICE
+sha256  c9e8630cf9d433f3cead74906a1520d2223f89bcd3fa9254861017440b8eb22f  fdk-aac-2.0.2.tar.gz
+sha256  95ec80da40b4af12ad4c4f3158c9cfb80f2479f3246e4260cb600827cc8c7836  NOTICE
diff --git a/package/fdk-aac/fdk-aac.mk b/package/fdk-aac/fdk-aac.mk
index 92753b5e08..c66f6df797 100644
--- a/package/fdk-aac/fdk-aac.mk
+++ b/package/fdk-aac/fdk-aac.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FDK_AAC_VERSION = 2.0.1
+FDK_AAC_VERSION = 2.0.2
 FDK_AAC_SITE = http://downloads.sourceforge.net/project/opencore-amr/fdk-aac
 FDK_AAC_LICENSE = fdk-aac license
 FDK_AAC_LICENSE_FILES = NOTICE
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
