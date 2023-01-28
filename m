Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EF9C636CB
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 21:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4457240620;
	Sat, 28 Jan 2023 21:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4457240620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AkdJIPfWdAZW; Sat, 28 Jan 2023 21:19:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 810574049D;
	Sat, 28 Jan 2023 21:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 810574049D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F3011BF3C0
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6792D4049D
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 21:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6792D4049D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UW-OhMRL1VtU for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 21:19:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70594400AC
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 21:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70594400AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BE9C87D85; Sat, 28 Jan 2023 21:19:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 22:14:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b43579e9453a4e4f0d25d902634ebd9f1721dfc
X-Git-Newrev: e75f402ba6dbba26f4f35e0b064b269d75c9f6f2
X-Patchwork-Hint: ignore
Message-Id: <20230128211903.5BE9C87D85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mobile-broadband-provider-info:
 bump version to 20221107
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

commit: https://git.buildroot.net/buildroot/commit/?id=e75f402ba6dbba26f4f35e0b064b269d75c9f6f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../mobile-broadband-provider-info.hash                               | 4 ++--
 .../mobile-broadband-provider-info/mobile-broadband-provider-info.mk  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
index b0c0db1b84..c965f5c783 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/mobile-broadband-provider-info/20190618/mobile-broadband-provider-info-20190618.sha256sum
-sha256  c22d64a565d1975b9eecb6ed2eeaef18634bc6f385c8137d05e845d8fb3cce5b  mobile-broadband-provider-info-20190618.tar.xz
+# https://download.gnome.org/sources/mobile-broadband-provider-info/20221107/mobile-broadband-provider-info-20221107.sha256sum
+sha256  d93392566c347a96eed95da8c66a5da0dd94f4115cfb3a305ff2682c64cfd810  mobile-broadband-provider-info-20221107.tar.xz
 # Locally computed
 sha256  3d510b215a33087b9ceb9592da21575ea1f9f98bd4d983a38e65fe851a552174  COPYING
diff --git a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
index ca6a8387c5..2744844951 100644
--- a/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
+++ b/package/mobile-broadband-provider-info/mobile-broadband-provider-info.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20190618
+MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20221107
 MOBILE_BROADBAND_PROVIDER_INFO_SITE = https://download.gnome.org/sources/mobile-broadband-provider-info/$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION)
 MOBILE_BROADBAND_PROVIDER_INFO_SOURCE = mobile-broadband-provider-info-$(MOBILE_BROADBAND_PROVIDER_INFO_VERSION).tar.xz
 MOBILE_BROADBAND_PROVIDER_INFO_LICENSE = Public domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
