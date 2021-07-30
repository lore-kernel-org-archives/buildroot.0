Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05D72C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:10:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9AAB61050
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 14:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B9AAB61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 785F740379;
	Fri, 30 Jul 2021 14:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HoBOU03ATypW; Fri, 30 Jul 2021 14:10:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 787A4401D8;
	Fri, 30 Jul 2021 14:10:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE2E81BF377
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8891C60682
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 14:09:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1BWlJjM3TzW for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 14:09:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC4B6606CA
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 14:09:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6564286446; Fri, 30 Jul 2021 13:34:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 16:01:48 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 99d04b1e03b5856d1cbcd6bb90a8cc4e2cced22b
X-Git-Newrev: 5d050e12e4e65a068b9d9907978bf383c135d8b1
X-Patchwork-Hint: ignore
Message-Id: <20210730133421.6564286446@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/pango: bump to
 version 1.48.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d050e12e4e65a068b9d9907978bf383c135d8b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Bugfix release. For details, see the NEWS file:
https://github.com/GNOME/pango/blob/1.48.7/NEWS

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 98caa3077bf780fc0d2cc0b978214fbf2f7fd2a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pango/pango.hash | 2 +-
 package/pango/pango.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 3d6167058e..94568a68ef 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
 # From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.48/pango-1.48.4.sha256sum
-sha256  418913fb062071a075846244989d4a67aa5c80bf0eae8ee4555a092fd566a37a  pango-1.48.4.tar.xz
+sha256  28a82f6a6cab60aa3b75a90f04197ead2d311fa8fe8b7bfdf8666e2781d506dc  pango-1.48.7.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index cc09e3a64d..2a4a9f49da 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.48
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).4
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).7
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
