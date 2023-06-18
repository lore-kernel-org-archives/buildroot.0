Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D584EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 11:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28619405C4;
	Sun, 18 Jun 2023 11:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28619405C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6kxqnIrjWLP; Sun, 18 Jun 2023 11:47:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A42C40540;
	Sun, 18 Jun 2023 11:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A42C40540
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DB9A1BF86C
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E97F60FCC
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 11:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E97F60FCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V1da451z15hb for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 11:45:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC04E60F34
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 11:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC04E60F34
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A56C183BAF; Sun, 18 Jun 2023 11:45:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 13:28:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf0cf882ee76c13356f818e1c2ae19b9de3d1ffb
X-Git-Newrev: 34c2252e8c280d1d0bbdff2fed27c9c936f6f8c4
X-Patchwork-Hint: ignore
Message-Id: <20230618114558.A56C183BAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/leafpad: bump version to 0.8.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=34c2252e8c280d1d0bbdff2fed27c9c936f6f8c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/tarot231/leafpad/blob/main/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/leafpad/leafpad.hash | 2 +-
 package/leafpad/leafpad.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leafpad/leafpad.hash b/package/leafpad/leafpad.hash
index e21c07ad2c..4f6e68f0a2 100644
--- a/package/leafpad/leafpad.hash
+++ b/package/leafpad/leafpad.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  959d22ae07f22803bc66ff40d373a854532a6e4732680bf8a96a3fbcb9f80a2c  leafpad-0.8.18.1.tar.gz
+sha256  07d3f712f4dbd0a33251fd1dee14e21afdc9f92090fc768c11ab0ac556adbe97  leafpad-0.8.19.tar.gz
 # Locally computed
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/leafpad/leafpad.mk b/package/leafpad/leafpad.mk
index c6c28d12e8..608fa37be4 100644
--- a/package/leafpad/leafpad.mk
+++ b/package/leafpad/leafpad.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEAFPAD_VERSION = 0.8.18.1
+LEAFPAD_VERSION = 0.8.19
 LEAFPAD_SITE = http://savannah.nongnu.org/download/leafpad
 LEAFPAD_DEPENDENCIES = libgtk2 host-intltool
 LEAFPAD_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
