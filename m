Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83D1C0502C
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 07:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4698A60BDF;
	Sat, 27 Aug 2022 07:51:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4698A60BDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GCXFKkccNgJy; Sat, 27 Aug 2022 07:51:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5471C60C15;
	Sat, 27 Aug 2022 07:51:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5471C60C15
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 023471BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDD2E404E9
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 07:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDD2E404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pFbJdE0Vt1LH for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 07:51:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46D9340017
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 07:51:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46D9340017
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1F93087632; Sat, 27 Aug 2022 07:36:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Aug 2022 09:47:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae2807821d897c16141d003f646475fee9e77cba
X-Git-Newrev: 71283535b6aa8187ad7963687ae961f41ca3c0b4
X-Patchwork-Hint: ignore
Message-Id: <20220827073608.1F93087632@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dbus-broker: add
 DBUS_BROKER_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=71283535b6aa8187ad7963687ae961f41ca3c0b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:dbus-broker_project:dbus-broker is a valid CPE identifier for
this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adbus-broker_project%3Adbus-broker

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dbus-broker/dbus-broker.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dbus-broker/dbus-broker.mk b/package/dbus-broker/dbus-broker.mk
index 22c5e8d8b7..85c3f75a3b 100644
--- a/package/dbus-broker/dbus-broker.mk
+++ b/package/dbus-broker/dbus-broker.mk
@@ -23,6 +23,7 @@ DBUS_BROKER_LICENSE_FILES = \
 	subprojects/c-stdaux/AUTHORS subprojects/c-stdaux/README.md \
 	subprojects/c-utf8/AUTHORS subprojects/c-utf8/README.md
 
+DBUS_BROKER_CPE_ID_VENDOR = dbus-broker_project
 DBUS_BROKER_DEPENDENCIES = expat systemd
 DBUS_BROKER_CONF_OPTS = -Dlauncher=true
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
