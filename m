Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCD5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BAC0405AA;
	Sat, 12 Mar 2022 17:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iAkjnloxJtvy; Sat, 12 Mar 2022 17:14:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 671084023D;
	Sat, 12 Mar 2022 17:14:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D55711BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24FBB60E5A
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hzMrSnImh3-a for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41DF66009C
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9A76C82B58; Sat, 12 Mar 2022 17:01:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 18:08:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 726e974f5eaff5c5abd7550e100a117a3fa0b6c8
X-Git-Newrev: 2e3ff4c21bafb562cf12ffdab93bb40bc5aae395
X-Patchwork-Hint: ignore
Message-Id: <20220312170118.9A76C82B58@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/modem-manager: bump version to
 1.18.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e3ff4c21bafb562cf12ffdab93bb40bc5aae395
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 14597215df..ea91f42fe0 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2ccf1f716c2d121e8e6709bcf8af29ee86971a90adacca2e8d6288b30278862e  ModemManager-1.16.10.tar.xz
+sha256  d4f804b31cf504239c5f1d4973c62095c00cba1ee9abb503718dac6d146a470a  ModemManager-1.18.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index a881edc272..d7e2c55bf8 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.16.10
+MODEM_MANAGER_VERSION = 1.18.6
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
