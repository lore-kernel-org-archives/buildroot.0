Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F66CC6FA82
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 07:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7AEB4093E;
	Tue, 13 Sep 2022 07:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7AEB4093E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clNzTKUIks01; Tue, 13 Sep 2022 07:39:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73B5940934;
	Tue, 13 Sep 2022 07:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73B5940934
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33C3C1BF313
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 07:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C9F660E24
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 07:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C9F660E24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HzhBK5otrMRU for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 07:39:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 867F560E21
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 867F560E21
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 07:39:54 +0000 (UTC)
Received: from mail.qult.net (unknown [78.193.33.39])
 by smtp6-g21.free.fr (Postfix) with ESMTPS id C207A7802D6
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 09:39:50 +0200 (CEST)
Received: from zenon.in.qult.net ([192.168.64.1])
 by mail.qult.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1oY0WM-000800-CO
 for buildroot@buildroot.org; Tue, 13 Sep 2022 09:39:50 +0200
Received: from ig by zenon.in.qult.net with local (Exim 4.95)
 (envelope-from <ignacy.gawedzki@green-communications.fr>)
 id 1oY0WL-003Kew-Sy for buildroot@buildroot.org;
 Tue, 13 Sep 2022 09:39:49 +0200
Date: Tue, 13 Sep 2022 09:39:49 +0200
From: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
To: buildroot@buildroot.org
Message-ID: <20220913073949.scbyhv3sb3qqqi6w@zenon.in.qult.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Buildroot] [PATCH v2] package/chartjs: bump to version 3.9.1
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
 package/chartjs/chartjs.hash | 4 ++--
 package/chartjs/chartjs.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

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
index 2748a94d36..585b4be285 100644
--- a/package/chartjs/chartjs.mk
+++ b/package/chartjs/chartjs.mk
@@ -4,8 +4,9 @@
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
-- =

2.34.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
