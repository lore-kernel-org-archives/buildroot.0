Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3ADC47074
	for <buildroot@archiver.kernel.org>; Thu,  4 Jan 2024 21:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB3B0607F5;
	Thu,  4 Jan 2024 21:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB3B0607F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jOJG6ZC84-g0; Thu,  4 Jan 2024 21:29:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 363A461B32;
	Thu,  4 Jan 2024 21:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 363A461B32
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17C381BF414
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD1974007C
 for <buildroot@lists.busybox.net>; Thu,  4 Jan 2024 21:27:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD1974007C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xlw0S8dh7gEq for <buildroot@lists.busybox.net>;
 Thu,  4 Jan 2024 21:27:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C88342869
 for <buildroot@buildroot.org>; Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C88342869
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7667E84091; Thu,  4 Jan 2024 21:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jan 2024 22:23:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 620cd04da4ae7027923b7be2e071c59ed900897e
X-Git-Newrev: cd9eaf192035281aea1972d817a36a4708105e62
X-Patchwork-Hint: ignore
Message-Id: <20240104212747.7667E84091@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tvheadend: bump version
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd9eaf192035281aea1972d817a36a4708105e62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to upstream commit
https://github.com/tvheadend/tvheadend/commit/3cf5acdc714dc025b2246d2395478fcfd058afeb

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tvheadend/tvheadend.hash | 4 ++--
 package/tvheadend/tvheadend.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 5a9ec3df23..62c954234d 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  98a27a6a5ce2fc800df6d154534f494582418f6b24b3a1c30267785d191e50df  tvheadend-62adbebfd062d7b97829268274aad92df2033784.tar.gz
-sha256  54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
+sha256  99a2fd954d8e620029759f5a65dc09271c168cd047a6a152a0fe643de64823cf  tvheadend-b40a62b31e809523d2fe2f7f3f331cc55dfdbd0f.tar.gz
+sha256  16aaf037a2d00e6e7804de64619887fc7539f1ede99e3282c86dfbc61c2af63e  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 1d4e6ee30c..816ec6e161 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 62adbebfd062d7b97829268274aad92df2033784
+TVHEADEND_VERSION = b40a62b31e809523d2fe2f7f3f331cc55dfdbd0f
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
