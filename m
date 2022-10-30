Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BF4FA373D
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 11:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4FB060594;
	Sun, 30 Oct 2022 11:08:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4FB060594
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ESCWNINO15Rk; Sun, 30 Oct 2022 11:08:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09F0A605AE;
	Sun, 30 Oct 2022 11:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09F0A605AE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 949D01BF4D8
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08A05812DF
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 11:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08A05812DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id braVmspayPnj for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 11:04:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90335812ED
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90335812ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86C688746F; Sun, 30 Oct 2022 11:04:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 11:54:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: caf755999df22bc5580f85674d819004ff842e50
X-Git-Newrev: 860b1b958797bd16bfe7666bb308a5ea026b1b46
X-Patchwork-Hint: ignore
Message-Id: <20221030110443.86C688746F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpam-radius-auth: bump to
 version 2.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=860b1b958797bd16bfe7666bb308a5ea026b1b46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch site to get latest release

https://github.com/FreeRADIUS/pam_radius/blob/release_2_0_0/Changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpam-radius-auth/libpam-radius-auth.hash | 2 +-
 package/libpam-radius-auth/libpam-radius-auth.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libpam-radius-auth/libpam-radius-auth.hash b/package/libpam-radius-auth/libpam-radius-auth.hash
index 0bf97c279c..63f3f1e45e 100644
--- a/package/libpam-radius-auth/libpam-radius-auth.hash
+++ b/package/libpam-radius-auth/libpam-radius-auth.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking PGP signature
-sha256  742d79fc39824726c098e746bd3dc3484f983f5ee082c621c1e848b2c3725305  pam_radius-1.4.0.tar.gz
+sha256  798dc358e7a143163e103bd38c4101645b2e93d82aa0ec63d32c0cb929d9c65c  libpam-radius-auth-2.0.0.tar.gz
 
 # Hash for license file:
 sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  LICENSE
diff --git a/package/libpam-radius-auth/libpam-radius-auth.mk b/package/libpam-radius-auth/libpam-radius-auth.mk
index 184e48d3b7..9519aad750 100644
--- a/package/libpam-radius-auth/libpam-radius-auth.mk
+++ b/package/libpam-radius-auth/libpam-radius-auth.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LIBPAM_RADIUS_AUTH_VERSION = 1.4.0
-LIBPAM_RADIUS_AUTH_SITE = ftp://ftp.freeradius.org/pub/radius
-LIBPAM_RADIUS_AUTH_SOURCE = pam_radius-$(LIBPAM_RADIUS_AUTH_VERSION).tar.gz
+LIBPAM_RADIUS_AUTH_VERSION = 2.0.0
+LIBPAM_RADIUS_AUTH_SITE = $(call github,FreeRADIUS,pam_radius,release_$(subst .,_,$(LIBPAM_RADIUS_AUTH_VERSION)))
 LIBPAM_RADIUS_AUTH_DEPENDENCIES = linux-pam
 LIBPAM_RADIUS_AUTH_INSTALL_STAGING = YES
 LIBPAM_RADIUS_AUTH_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
