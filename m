Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED06C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F236260B31;
	Thu, 12 May 2022 20:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V-IuYW5xQ8AR; Thu, 12 May 2022 20:04:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06BD860B2B;
	Thu, 12 May 2022 20:04:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FAC71BF352
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B4A340242
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MSVShqykv5HX for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:03:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1F2D40436
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:03:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1C0F785D3C; Thu, 12 May 2022 19:53:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 22:03:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15999f3b5c31d4a41318f61b2f63b25efe4a7011
X-Git-Newrev: a1d49f97b99fc8b61cc737c2ecd44a510283d644
X-Patchwork-Hint: ignore
Message-Id: <20220512195306.1C0F785D3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/clamav: security bump version to
 0.103.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1d49f97b99fc8b61cc737c2ecd44a510283d644
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://blog.clamav.net/2022/05/clamav-01050-01043-01036-released.html

Fixes CVE-2022-20770, CVE-2022-20771, CVE-2022-20785, CVE-2022-20792,
CVE-2022-20796 & CVE-2022-20803.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 73f4ff88f1..579b0ec89e 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1e74b1e1d2a8a9056449c313f48a6983b9d5ba0d6fb5ef0b2be6ad3c841a5426  clamav-0.103.5.tar.gz
+sha256  aaa12e3dc19f1d323b1c50d7a10fa8af557e4390149e864d59bde39b6ad9ba33  clamav-0.103.6.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index e2ee99d02b..10856ed971 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.103.5
+CLAMAV_VERSION = 0.103.6
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
