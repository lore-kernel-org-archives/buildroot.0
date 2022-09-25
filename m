Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29479C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 08:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA83782896;
	Sun, 25 Sep 2022 08:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA83782896
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mybMsKqs-aBa; Sun, 25 Sep 2022 08:49:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5945827A5;
	Sun, 25 Sep 2022 08:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5945827A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 983071BF4DD
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72F19827A5
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 08:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72F19827A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8c5wenJQNuhF for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 08:49:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 426E7827A0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 426E7827A0
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 08:49:46 +0000 (UTC)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id 0612B78037F
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 10:49:44 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1ocNKZ-0003Vv-OJ
 for buildroot@buildroot.org; Sun, 25 Sep 2022 10:49:43 +0200
Received: from ig by zenon.in.qult.net with local (Exim 4.95)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1ocNKZ-00549L-1Z for buildroot@buildroot.org;
 Sun, 25 Sep 2022 10:49:43 +0200
Date: Sun, 25 Sep 2022 10:49:43 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: buildroot@buildroot.org
Message-ID: <20220925084943.sere4idtgtsuc4c6@zenon.in.qult.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH v5] package/chartjs: bump to version 3.9.1
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/chartjs/Chart.js/releases/tag/v3.9.1

License file has updated copyright years to 2014-2022.

Signed-off-by: Ignacy Gaw=EAdzki <ignacy.gawedzki@green-communications.fr>
---
 package/chartjs/chartjs.hash |  4 ++--
 package/chartjs/chartjs.mk   | 11 ++++-------
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/chartjs/chartjs.hash b/package/chartjs/chartjs.hash
index f8614ec385..3f8da92715 100644
--- a/package/chartjs/chartjs.hash
+++ b/package/chartjs/chartjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9ef3697e279a585c79730f35dba16ad4e24ddeed49a150adb341c31f191fb78e  =
chartjs-2.9.4.tar.gz
-sha256  7b43caae91f31b18dc81fae6e0f7aa1acbecaa6d84e3249905cbe15308307d67  =
LICENSE.md
+sha256  111e0751796f087a51e94dfed910ccfb1278fd30e584a6e48514dba9ae7e72c6  =
chart.js-3.9.1.tgz
+sha256  5a0877ad6d818529be4f33009d0942cdf7e2ed7656156f4aba7308459a546030  =
package/LICENSE.md
diff --git a/package/chartjs/chartjs.mk b/package/chartjs/chartjs.mk
index 2748a94d36..5ed4b3d9c3 100644
--- a/package/chartjs/chartjs.mk
+++ b/package/chartjs/chartjs.mk
@@ -4,20 +4,17 @@
 #
 ##########################################################################=
######
 =

-CHARTJS_VERSION =3D 2.9.4
-CHARTJS_SITE =3D $(call github,chartjs,Chart.js,v$(CHARTJS_VERSION))
+CHARTJS_VERSION =3D 3.9.1
+CHARTJS_SITE =3D https://registry.npmjs.org/chart.js/-
+CHARTJS_SOURCE =3D chart.js-$(CHARTJS_VERSION).tgz
 CHARTJS_LICENSE =3D MIT
 CHARTJS_LICENSE_FILES =3D LICENSE.md
 CHARTJS_CPE_ID_VENDOR =3D chartjs
 CHARTJS_CPE_ID_PRODUCT =3D chart.js
 =

 define CHARTJS_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 0644 -D $(@D)/dist/Chart.min.css \
-		$(TARGET_DIR)/var/www/chartjs/css/Chart.css
-	$(INSTALL) -m 0644 -D $(@D)/dist/Chart.min.js \
+	$(INSTALL) -m 0644 -D $(@D)/dist/chart.min.js \
 		$(TARGET_DIR)/var/www/chartjs/js/Chart.js
-	$(INSTALL) -m 0644 -D $(@D)/dist/Chart.bundle.min.js \
-		$(TARGET_DIR)/var/www/chartjs/js/Chart.bundle.js
 endef
 =

 $(eval $(generic-package))
-- =

2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
