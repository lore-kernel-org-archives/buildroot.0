Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE734C4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F2724090E;
	Tue, 27 Dec 2022 20:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F2724090E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OkzMfH5zt93z; Tue, 27 Dec 2022 20:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81CDB408E8;
	Tue, 27 Dec 2022 20:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81CDB408E8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 457491BF5A4
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDEC540472
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDEC540472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHdpIZk7FLcd for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:03:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 676CA404AF
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 676CA404AF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5560986E75; Tue, 27 Dec 2022 20:03:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 20:59:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4b473917001fa1145bec2ab118fac97dab0fc26e
X-Git-Newrev: 9a58d1aa9eb3a83d07fd445875c79722b609a78b
X-Patchwork-Hint: ignore
Message-Id: <20221227200353.5560986E75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpwquality: bump to version 1.4.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=9a58d1aa9eb3a83d07fd445875c79722b609a78b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/libpwquality/libpwquality/blob/libpwquality-1.4.5/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpwquality/libpwquality.hash | 2 +-
 package/libpwquality/libpwquality.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpwquality/libpwquality.hash b/package/libpwquality/libpwquality.hash
index 1469bc0b7a..e64fb4bf50 100644
--- a/package/libpwquality/libpwquality.hash
+++ b/package/libpwquality/libpwquality.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d43baf23dc6887fe8f8e9b75cabaabc5f4bbbaa0f9eff44278d276141752a545  libpwquality-1.4.4.tar.bz2
+sha256  6fcf18b75d305d99d04d2e42982ed5b787a081af2842220ed63287a2d6a10988  libpwquality-1.4.5.tar.bz2
 sha256  aa44d09f651bf99b56253187c7778a240740c767d28453ab7fdc9804c842baee  COPYING
diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index d4f7a47120..ae6babbcae 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPWQUALITY_VERSION = 1.4.4
+LIBPWQUALITY_VERSION = 1.4.5
 LIBPWQUALITY_SOURCE = libpwquality-$(LIBPWQUALITY_VERSION).tar.bz2
 LIBPWQUALITY_SITE = https://github.com/libpwquality/libpwquality/releases/download/libpwquality-$(LIBPWQUALITY_VERSION)
 LIBPWQUALITY_LICENSE = BSD-3-Clause or GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
