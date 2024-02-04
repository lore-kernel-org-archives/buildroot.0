Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00684C4828F
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 10:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A176885185;
	Sun,  4 Feb 2024 10:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A176885185
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fqW7cAL-L0mG; Sun,  4 Feb 2024 10:07:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2AE8851A7;
	Sun,  4 Feb 2024 10:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2AE8851A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F190F1BF41D
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBF3844BE3
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 10:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBF3844BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id peVVLa8tr8cZ for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 10:07:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4785E44A94
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 10:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4785E44A94
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3170C86892; Sun,  4 Feb 2024 10:07:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 11:06:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 380d4a75f5e3c2ae52ebc1afd409713fdb6ced37
X-Git-Newrev: ed40db6dfba553df8571fcb96c29b8f20dc43dca
X-Patchwork-Hint: ignore
Message-Id: <20240204100707.3170C86892@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc-hawkbit-updater: drop
 RAUC_HAWKBIT_UPDATER_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed40db6dfba553df8571fcb96c29b8f20dc43dca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:pengutronix:rauc-hawkbit-updater added by commit
928b7219cd7079864eadadc66dbff21c5cd72804 has never been a valid CPE ID
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:pengutronix:rauc-hawkbit-updater

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
index 10ba91abbb..a453f75a28 100644
--- a/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
+++ b/package/rauc-hawkbit-updater/rauc-hawkbit-updater.mk
@@ -9,7 +9,6 @@ RAUC_HAWKBIT_UPDATER_SITE = https://github.com/rauc/rauc-hawkbit-updater/release
 RAUC_HAWKBIT_UPDATER_SOURCE = rauc-hawkbit-updater-$(RAUC_HAWKBIT_UPDATER_VERSION).tar.xz
 RAUC_HAWKBIT_UPDATER_LICENSE = LGPL-2.1
 RAUC_HAWKBIT_UPDATER_LICENSE_FILES = LICENSE
-RAUC_HAWKBIT_UPDATER_CPE_ID_VENDOR = pengutronix
 RAUC_HAWKBIT_UPDATER_DEPENDENCIES = json-glib libcurl
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
