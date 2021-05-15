Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4BDC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:34:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5565D60F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5565D60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 325254058B;
	Tue,  3 Aug 2021 21:34:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gTElWSutYsE3; Tue,  3 Aug 2021 21:34:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C1F14056E;
	Tue,  3 Aug 2021 21:34:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 170B11BF9C2
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CDAC40475
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HmC0gbooyZOk for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A38B40001
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 715FC87BB7; Tue,  3 Aug 2021 21:09:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 May 2021 14:18:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 75d795c4930ea2bd4ebd70d8efea747624bb1b01
X-Git-Newrev: 38fb1ad2a00d7584e2a7fdc1b966e9fa7e844e11
X-Patchwork-Hint: ignore
Message-Id: <20210803210937.715FC87BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gstreamer1/gstreamer1:
 add CPE variables
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

commit: https://git.buildroot.net/buildroot/commit/?id=38fb1ad2a00d7584e2a7fdc1b966e9fa7e844e11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

cpe:2.3:a:gstreamer_project:gstreamer is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agstreamer_project%3Agstreamer

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gstreamer1/gstreamer1/gstreamer1.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
index 99846c1be5..171ea2b8e3 100644
--- a/package/gstreamer1/gstreamer1/gstreamer1.mk
+++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
@@ -10,6 +10,8 @@ GSTREAMER1_SITE = https://gstreamer.freedesktop.org/src/gstreamer
 GSTREAMER1_INSTALL_STAGING = YES
 GSTREAMER1_LICENSE_FILES = COPYING
 GSTREAMER1_LICENSE = LGPL-2.0+, LGPL-2.1+
+GSTREAMER1_CPE_ID_VENDOR = gstreamer_project
+GSTREAMER1_CPE_ID_PRODUCT = gstreamer
 
 GSTREAMER1_CONF_OPTS = \
 	-Dexamples=disabled \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
