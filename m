Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F36BC4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:32:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A5F6108B
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 20:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30A5F6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08B4280D8A;
	Mon, 13 Sep 2021 20:32:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vL1PWjjHZ-L5; Mon, 13 Sep 2021 20:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FA5C80DB2;
	Mon, 13 Sep 2021 20:32:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A7BB21BF322
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97EAD40301
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 20:32:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkqTjYmsMzdw for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 20:32:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED64B402FF
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 20:32:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9354B8A650; Mon, 13 Sep 2021 20:30:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 22:29:19 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 71a05397057e417b4d274d6be0a90e700fc54e50
X-Git-Newrev: cf41704cd86e1877eb59ee7013336467669991be
X-Patchwork-Hint: ignore
Message-Id: <20210913203017.9354B8A650@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/protobuf: update
 github url
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf41704cd86e1877eb59ee7013336467669991be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

protobuf moved from the google org to protocolbuffers in 2018.
There is a redirect but we should use the official url.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 107103ef91289b93d692657321c2546fcca60408)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/protobuf/protobuf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index df708819cb..9a8b8aa8cf 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -9,7 +9,7 @@
 # as they share the same version/site variables.
 PROTOBUF_VERSION = 3.14.0
 PROTOBUF_SOURCE = protobuf-cpp-$(PROTOBUF_VERSION).tar.gz
-PROTOBUF_SITE = https://github.com/google/protobuf/releases/download/v$(PROTOBUF_VERSION)
+PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
 PROTOBUF_LICENSE_FILES = LICENSE
 PROTOBUF_CPE_ID_VENDOR = google
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
