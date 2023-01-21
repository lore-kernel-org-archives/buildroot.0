Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1159CC27C76
	for <buildroot@archiver.kernel.org>; Sat, 21 Jan 2023 13:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C128082C84;
	Sat, 21 Jan 2023 13:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C128082C84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jH4CZ_ewussY; Sat, 21 Jan 2023 13:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E869A819BC;
	Sat, 21 Jan 2023 13:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E869A819BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B208D1BF847
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C329E41CA8
 for <buildroot@lists.busybox.net>; Sat, 21 Jan 2023 13:16:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C329E41CA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7UE9BI4OI89C for <buildroot@lists.busybox.net>;
 Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2D5C41CD7
 for <buildroot@buildroot.org>; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2D5C41CD7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A61BA86946; Sat, 21 Jan 2023 13:16:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:59:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 86b0605de12023c930f530ebb32125556d265a0e
X-Git-Newrev: 002774d8ba08b69127a7b3921d628472305c7c09
X-Patchwork-Hint: ignore
Message-Id: <20230121131610.A61BA86946@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mobile-broadband-provider-info:
 switch to https download
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

commit: https://git.buildroot.net/buildroot/commit/?id=002774d8ba08b69127a7b3921d628472305c7c09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../mobile-broadband-provider-info/mobile-broadband-provider-info.hash  | 2 +-
 .../mobile-broadband-provider-info/mobile-broadband-provider-info.mk    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
index c3d7fe2c28..b0c0db1b84 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
@@ -1,4 +1,4 @@
-# http://ftp.acc.umu.se/pub/GNOME/sources/mobile-broadband-provider-info/20190618/mobile-broadband-provider-info-20190618.sha256sum
+# https://download.gnome.org/sources/mobile-broadband-provider-info/20190618/mobile-broadband-provider-info-20190618.sha256sum
 sha256  c22d64a565d1975b9eecb6ed2eeaef18634bc6f385c8137d05e845d8fb3cce5b  mobile-broadband-provider-info-20190618.tar.xz
 # Locally computed
 sha256  3d510b215a33087b9ceb9592da21575ea1f9f98bd4d983a38e65fe851a552174  COPYING
diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
index 2986f92f69..ca6a8387c5 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20190618
-MOBILE_BROADBAND_PROVIDER_INFO_SITE = http://ftp.gnome.org/pub/GNOME/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
+MOBILE_BROADBAND_PROVIDER_INFO_SITE = https://download.gnome.org/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
 MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION).tar.xz
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE = Public domain
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
