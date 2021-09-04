Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68C0C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:05:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77C3E604AC
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 21:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77C3E604AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51F5E4254B;
	Sat,  4 Sep 2021 21:05:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6tjWgklg3lAv; Sat,  4 Sep 2021 21:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B16B1404FE;
	Sat,  4 Sep 2021 21:05:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D87F1BF28F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48DA26059B
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 21:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WrHJ9uohIncz for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 21:03:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37C10605E0
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 21:03:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B5724884F4; Sat,  4 Sep 2021 21:02:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Sep 2021 22:58:44 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: d6d36d6bf267de882a375053bba7e9a17526a49e
X-Git-Newrev: d65ec878191fe6f21e9266b2e811f1a775c4f6a4
X-Patchwork-Hint: ignore
Message-Id: <20210904210214.B5724884F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libargtable2:
 update LIBARGTABLE2_VERSION
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

commit: https://git.buildroot.net/buildroot/commit/?id=d65ec878191fe6f21e9266b2e811f1a775c4f6a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Update LIBARGTABLE2_VERSION to reflect what is used by
https://release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5a3d1f34bcd5c5305b07ba268fa47d6c42a7f7ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libargtable2/libargtable2.mk | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libargtable2/libargtable2.mk b/package/libargtable2/libargtable2.mk
index 8215f552cd..d033e28f40 100644
--- a/package/libargtable2/libargtable2.mk
+++ b/package/libargtable2/libargtable2.mk
@@ -4,9 +4,11 @@
 #
 ################################################################################
 
-LIBARGTABLE2_VERSION = 13
-LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_VERSION).tar.gz
-LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-2.13
+LIBARGTABLE2_MAJOR_VERSION = 2
+LIBARGTABLE2_MINOR_VERSION = 13
+LIBARGTABLE2_VERSION = $(LIBARGTABLE2_MAJOR_VERSION).$(LIBARGTABLE2_MINOR_VERSION)
+LIBARGTABLE2_SOURCE = argtable2-$(LIBARGTABLE2_MINOR_VERSION).tar.gz
+LIBARGTABLE2_SITE = http://downloads.sourceforge.net/project/argtable/argtable/argtable-$(LIBARGTABLE2_VERSION)
 LIBARGTABLE2_INSTALL_STAGING = YES
 LIBARGTABLE2_CONF_OPTS = \
 	--disable-example \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
