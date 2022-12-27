Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3032AC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0395838D7;
	Mon, 20 Feb 2023 23:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0395838D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nqo2qeanxjBQ; Mon, 20 Feb 2023 23:27:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0161838CC;
	Mon, 20 Feb 2023 23:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0161838CC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C90D1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE62761381
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE62761381
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eL9bPPCWJM-G for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1168612C3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1168612C3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB904828C8; Mon, 20 Feb 2023 20:52:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 20:59:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4b473917001fa1145bec2ab118fac97dab0fc26e
X-Git-Newrev: 9a58d1aa9eb3a83d07fd445875c79722b609a78b
X-Patchwork-Hint: ignore
Message-Id: <20230220205215.EB904828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libpwquality: bump to
 version 1.4.5
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
