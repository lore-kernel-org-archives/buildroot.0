Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC28DC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 19:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6164A41185;
	Fri, 29 Jul 2022 19:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6164A41185
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_drEQupooYb; Fri, 29 Jul 2022 19:47:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75BC241051;
	Fri, 29 Jul 2022 19:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75BC241051
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5BEA1C11A5
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BC9183FAA
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BC9183FAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vs8Ocx9Dt65f for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 19:47:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBAAC83FA8
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBAAC83FA8
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7A14F86934; Fri, 29 Jul 2022 19:33:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 21:46:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cceb19b00c7ba76b41b6595cb93b760e0458adf
X-Git-Newrev: 54f983ad63c155944f4f053af9bfce3360dabf7f
X-Patchwork-Hint: ignore
Message-Id: <20220729193309.7A14F86934@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libqmi: bump version to 1.30.8
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=54f983ad63c155944f4f053af9bfce3360dabf7f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index ef2da77a2a..dee2a94d93 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
-sha256  82ddd3f77c602b1e0c11d3e41d0563ede11f95036ebfcf929bc89157b13928e6  libqmi-1.30.4.tar.gz
+sha256  b2e0285690f94fe6d0cc3c422514117b187c8ddb90133c2900993e13343f5a5e  libqmi-1.30.8.tar.gz
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index b33e2fdc47..6b7f45729e 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQMI_VERSION = 1.30.4
+LIBQMI_VERSION = 1.30.8
 LIBQMI_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
