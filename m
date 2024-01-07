Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80DA4C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 16:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E651400D0;
	Sun,  7 Jan 2024 16:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E651400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gw02jgLElpDY; Sun,  7 Jan 2024 16:23:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 223FC401C2;
	Sun,  7 Jan 2024 16:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 223FC401C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5C361BF38B
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CAD01415E5
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 16:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CAD01415E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TuFApVa8Iad3 for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 16:22:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ABA9415E6
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 16:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ABA9415E6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57AAF8475F; Sun,  7 Jan 2024 16:22:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Jan 2024 12:29:46 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 95b06923757d380c07a78d0e97dcc28246d71421
X-Git-Newrev: 32b652d878167864f4ca8349f81faf5070714def
X-Patchwork-Hint: ignore
Message-Id: <20240107162200.57AAF8475F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/transmission:
 bump version to 4.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=32b652d878167864f4ca8349f81faf5070714def
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Release notes:
https://github.com/transmission/transmission/releases/tag/4.0.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fdeb41bda6c3f56012264cf38a8d3ae466f04320)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 74b3a654b5..ed600c7699 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  15f7b4318fdfbffb19aa8d9a6b0fd89348e6ef1e86baa21a0806ffd1893bd5a6  transmission-4.0.4.tar.xz
+sha256  fd68ff114a479200043c30c7e69dba4c1932f7af36ca4c5b5d2edcb5866e6357  transmission-4.0.5.tar.xz
 # Locally calculated
 sha256  f56732960a61ecf3b9637404eef1a39221d2006336a98792b7b65a79f155449c  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index efb46c0feb..f1130aeadd 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.0.4
+TRANSMISSION_VERSION = 4.0.5
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
