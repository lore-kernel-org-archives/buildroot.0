Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E59ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 15:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31147606A9;
	Sat, 17 Sep 2022 15:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31147606A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EeQuJvbl5HKa; Sat, 17 Sep 2022 15:18:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F25660593;
	Sat, 17 Sep 2022 15:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F25660593
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC93F1BF388
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C81AC60B45
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 15:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C81AC60B45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YilB-oyxLdSQ for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 15:18:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1E2F60AD5
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 15:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1E2F60AD5
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DAF9684459; Sat, 17 Sep 2022 15:18:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:17:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c39958ba1ad9f0b760c72004ceb445e72d7ef86
X-Git-Newrev: f0d1daaa7fcc12b8dcd6e47ce75597d16aa6f745
X-Patchwork-Hint: ignore
Message-Id: <20220917151817.DAF9684459@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpeas: bump to version 1.32.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0d1daaa7fcc12b8dcd6e47ce75597d16aa6f745
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.gnome.org/GNOME/libpeas/-/blob/libpeas-1.32.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpeas/libpeas.hash | 4 ++--
 package/libpeas/libpeas.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpeas/libpeas.hash b/package/libpeas/libpeas.hash
index 2b030c01c5..c503558f85 100644
--- a/package/libpeas/libpeas.hash
+++ b/package/libpeas/libpeas.hash
@@ -1,4 +1,4 @@
-# From https://ftp.gnome.org/pub/GNOME/sources/libpeas/1.30/libpeas-1.30.0.sha256sum
-sha256  0bf5562e9bfc0382a9dcb81f64340787542568762a3a367d9d90f6185898b9a3  libpeas-1.30.0.tar.xz
+# From https://ftp.gnome.org/pub/GNOME/sources/libpeas/1.32/libpeas-1.32.0.sha256sum
+sha256  d625520fa02e8977029b246ae439bc218968965f1e82d612208b713f1dcc3d0e  libpeas-1.32.0.tar.xz
 # Locally calculated
 sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  COPYING
diff --git a/package/libpeas/libpeas.mk b/package/libpeas/libpeas.mk
index 097cc860eb..5550162e04 100644
--- a/package/libpeas/libpeas.mk
+++ b/package/libpeas/libpeas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPEAS_VERSION_MAJOR = 1.30
+LIBPEAS_VERSION_MAJOR = 1.32
 LIBPEAS_VERSION = $(LIBPEAS_VERSION_MAJOR).0
 LIBPEAS_SOURCE = libpeas-$(LIBPEAS_VERSION).tar.xz
 LIBPEAS_SITE = http://ftp.gnome.org/pub/gnome/sources/libpeas/$(LIBPEAS_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
