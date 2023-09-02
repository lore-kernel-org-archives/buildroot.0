Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB6AEC873C
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 648BD83EA7;
	Thu,  7 Sep 2023 15:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 648BD83EA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nCl4N_iXg7T1; Thu,  7 Sep 2023 15:41:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C89583C6B;
	Thu,  7 Sep 2023 15:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C89583C6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0977B1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE5A241D83
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE5A241D83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 08755JbEzHnp for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C02A41DC6
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C02A41DC6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A05E86A1F; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 09:36:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94d48acba3a787dd20fb53bcd759a2cf96e779fc
X-Git-Newrev: ff6fae8bc1e995681cc906c4595205b5dc3f5586
X-Patchwork-Hint: ignore
Message-Id: <20230907145134.5A05E86A1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: bump to version 1.4.71
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff6fae8bc1e995681cc906c4595205b5dc3f5586
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
 - https://www.lighttpd.net/2023/5/10/1.4.70/
 - https://www.lighttpd.net/2023/5/27/1.4.71/

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lighttpd/lighttpd.hash | 4 ++--
 package/lighttpd/lighttpd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lighttpd/lighttpd.hash b/package/lighttpd/lighttpd.hash
index 29bf5124b6..a86ebf2f68 100644
--- a/package/lighttpd/lighttpd.hash
+++ b/package/lighttpd/lighttpd.hash
@@ -1,4 +1,4 @@
-# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.69.sha512sum
-sha512  9d174c8e0a192b4eb8218a9f76b0bd42f90030228600bb7bbe35ebb9e7bbaea36ee2732535c5cc6dab171294817837bfa26074ff84a37832dd89f57488b4071f  lighttpd-1.4.69.tar.xz
+# From https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.71.sha512sum
+sha512  c1388b563b9cf9dcab0a57bec42b09b2cb5e1932bc137ae5f957d1bf3932ddd8f5f188002a7b9a00f0a92ba3779b21ecbea2ccffa91e686b6660c9cc455d6598  lighttpd-1.4.71.tar.xz
 # Locally calculated
 sha256  5c98cad2fbaf5c5e2562bcbab401a7c557c1bb1bac9914ecc63730925052fb13  COPYING
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index ca2035b6b3..bc0dbcbf45 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIGHTTPD_VERSION_MAJOR = 1.4
-LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).69
+LIGHTTPD_VERSION = $(LIGHTTPD_VERSION_MAJOR).71
 LIGHTTPD_SOURCE = lighttpd-$(LIGHTTPD_VERSION).tar.xz
 LIGHTTPD_SITE = http://download.lighttpd.net/lighttpd/releases-$(LIGHTTPD_VERSION_MAJOR).x
 LIGHTTPD_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
