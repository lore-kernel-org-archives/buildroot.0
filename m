Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45608ECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 15:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D01BA818CA;
	Mon, 29 Aug 2022 15:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D01BA818CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tsJeDxPeQNWS; Mon, 29 Aug 2022 15:47:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1891818C0;
	Mon, 29 Aug 2022 15:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1891818C0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98EF51BF28E
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 15:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70048407D7
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 15:47:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70048407D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 088zFqubheME for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 15:47:09 +0000 (UTC)
X-Greylist: delayed 00:32:42 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 013394086D
Received: from mail.h8u.de (mail.h8u.de [95.156.226.87])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 013394086D
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 15:47:08 +0000 (UTC)
Received: from [192.168.255.242] (helo=svolli.dynxs.de)
 by mail.h8u.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <buildroot@svol.li>) id 1oSgT0-0008Qb-KD
 for buildroot@buildroot.org; Mon, 29 Aug 2022 17:14:23 +0200
Received: from localhost ([127.0.0.1] ident=svolli)
 by svolli.dynxs.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <buildroot@svol.li>) id 1oSgT0-0001IG-Bs
 for buildroot@buildroot.org; Mon, 29 Aug 2022 17:14:22 +0200
Date: Mon, 29 Aug 2022 17:14:22 +0200 (CEST)
From: Sven Oliver Moll <buildroot@svol.li>
X-X-Sender: svolli@defender.svolli.xa
To: buildroot@buildroot.org
Message-ID: <alpine.DEB.2.20.2208291701140.18923@defender.svolli.xa>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.168.255.242
X-SA-Exim-Rcpt-To: buildroot@buildroot.org
X-SA-Exim-Mail-From: buildroot@svol.li
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.h8u.de)
Subject: [Buildroot] [PATCH 1/1] package/most: bump version to 5.2.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Signed-off-by: Sven Oliver Moll <svolli@svolli.de>
---
  package/most/most.hash | 4 ++--
  package/most/most.mk   | 2 +-
  2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/most/most.hash b/package/most/most.hash
index db0eb6db59..5c0fd5751c 100644
--- a/package/most/most.hash
+++ b/package/most/most.hash
@@ -1,6 +1,6 @@
  # From https://www.jedsoft.org/releases/most/
-sha1  db811669a6b22c15478c957b439b5e4483ce1c95  most-5.1.0.tar.gz
+sha1  322073ee6e8c45ce084f4fccd08d3f026aa1f66d  most-5.2.0.tar.gz
  # Locally computed
-sha256  db805d1ffad3e85890802061ac8c90e3c89e25afb184a794e03715a3ed190501  most-5.1.0.tar.gz
+sha256  9455aeb8f826fa8385c850dc22bf0f22cf9069b3c3423fba4bf2c6f6226d9903  most-5.2.0.tar.gz
  sha256  1b2a567f289f66a143c56353e7b3d4fa5862514a5e3c5cfdf8b02ee5e5aaa953  COPYING
  sha256  47ad1c3f9b94d6ec42d9bee6c5df980c5c2daa5b9d22113545ae6a3f21ca2f52  COPYRIGHT
diff --git a/package/most/most.mk b/package/most/most.mk
index 28d82cddf1..24627c046a 100644
--- a/package/most/most.mk
+++ b/package/most/most.mk
@@ -5,7 +5,7 @@
  ################################################################################

  MOST_SITE = http://www.jedsoft.org/releases/most
-MOST_VERSION = 5.1.0
+MOST_VERSION = 5.2.0
  MOST_LICENSE = GPL-2.0+
  MOST_LICENSE_FILES = COPYING COPYRIGHT
  MOST_DEPENDENCIES = slang
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
