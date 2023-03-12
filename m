Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB912C74A5B
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 18:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6260960BE4;
	Sun, 12 Mar 2023 18:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6260960BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zBipKAmBuQGD; Sun, 12 Mar 2023 18:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E68460BC6;
	Sun, 12 Mar 2023 18:01:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E68460BC6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CC291BF863
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 18:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5727840106
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 18:00:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5727840106
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YW-L-VR7oLvU for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 18:00:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81235400A4
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 18:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81235400A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70A8086F75; Sun, 12 Mar 2023 18:00:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 18:59:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a1f00209c20e6d5fc2712c8b4746f3ac5d94df7f
X-Git-Newrev: 0a46e6c1981c9a326c7cd3713bd312f9f9bc8f99
X-Patchwork-Hint: ignore
Message-Id: <20230312180058.70A8086F75@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/mtools: bump to
 version 4.0.42
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a46e6c1981c9a326c7cd3713bd312f9f9bc8f99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release announce:
https://lists.gnu.org/archive/html/info-mtools/2022-10/msg00000.html

For change log since 4.0.38, see:
https://svn.savannah.gnu.org/viewvc/mtools/tags/4.0.42/NEWS?view=markup

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mtools/mtools.hash | 2 +-
 package/mtools/mtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index a162bfdc95..b81830a7d2 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  7086821b399a39b8a3c5a372d064de4860f3c195b4911dd4e8b76219fcabe75c  mtools-4.0.38.tar.lz
+sha256  40a98fd9bcc865997866015013c3c64a304d98c2892fe4ab892ffd6ac3dd9bae  mtools-4.0.42.tar.lz
 
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index c875814bc7..407ac1a2c6 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.38
+MTOOLS_VERSION = 4.0.42
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
