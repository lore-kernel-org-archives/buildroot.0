Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5CDC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:04:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BB4F60F93
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BB4F60F93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2619C605BF;
	Tue,  3 Aug 2021 23:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uRr-WAA4PXUP; Tue,  3 Aug 2021 23:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C79A605BB;
	Tue,  3 Aug 2021 23:04:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24E411BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4346F40655
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LnTY_mX_UG38 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E13A74063C
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3FEA9873E2; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Jun 2021 18:43:45 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4428c5bc2f25df600a028945d30ac60b93886c65
X-Git-Newrev: 72fdd27b87942ac7f99730afe02b58638d105677
X-Patchwork-Hint: ignore
Message-Id: <20210803210951.3FEA9873E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fb-test-app: bump
 version to 1.3.1 and update project URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=72fdd27b87942ac7f99730afe02b58638d105677
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- bump version to 1.1.1
- update project URL

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/fb-test-app/fb-test-app.hash | 2 +-
 package/fb-test-app/fb-test-app.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fb-test-app/fb-test-app.hash b/package/fb-test-app/fb-test-app.hash
index 06611db799..3068caf278 100644
--- a/package/fb-test-app/fb-test-app.hash
+++ b/package/fb-test-app/fb-test-app.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6baf6b45968d0bb9a5527c6c4bf18661e9f9eb9be973a6d1952c38168c90d58f  fb-test-app-rosetta-1.1.0.tar.gz
+sha256  45d490ed78a6e4425d9a760e81e99dc503af01704e17ab5bf186b87a31c5e3db  fb-test-app-rosetta-1.1.1.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
index 1ab7b2f219..1be59a4207 100644
--- a/package/fb-test-app/fb-test-app.mk
+++ b/package/fb-test-app/fb-test-app.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FB_TEST_APP_VERSION = rosetta-1.1.0
-FB_TEST_APP_SITE = $(call github,prpplague,fb-test-app,$(FB_TEST_APP_VERSION))
+FB_TEST_APP_VERSION = rosetta-1.1.1
+FB_TEST_APP_SITE = $(call github,andy-shev,fb-test-app,$(FB_TEST_APP_VERSION))
 FB_TEST_APP_LICENSE = GPL-2.0
 FB_TEST_APP_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
