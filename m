Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04EFC47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABD5041897;
	Wed, 28 Feb 2024 21:27:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M09yq1UZO1Ik; Wed, 28 Feb 2024 21:27:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BC2E4187C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BC2E4187C;
	Wed, 28 Feb 2024 21:27:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13FCA1BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9B54405B6
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jDGFF3FtsG7c for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B88734026F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B88734026F
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B473187CA0; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:15:57 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: e480566f8069a3a08863e65f8a6200aff6bf7da8
X-Git-Newrev: 9c4cb225d3c1a1535420cbc8adaa2f8858491986
X-Patchwork-Hint: ignore
Message-Id: <20240228212552.B473187CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x]
 package/rauc-hawkbit-updater: drop RAUC_HAWKBIT_UPDATER_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c4cb225d3c1a1535420cbc8adaa2f8858491986
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

cpe:2.3:a:pengutronix:rauc-hawkbit-updater added by commit
928b7219cd7079864eadadc66dbff21c5cd72804 has never been a valid CPE ID
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:pengutronix:rauc-hawkbit-updater

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ed40db6dfba553df8571fcb96c29b8f20dc43dca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
