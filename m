Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A23C6FA99
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 12:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CD8F40484;
	Sun, 12 Mar 2023 12:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CD8F40484
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Isf_GQHcdUQ; Sun, 12 Mar 2023 12:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD8CE403B7;
	Sun, 12 Mar 2023 12:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD8CE403B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EBC5A1BF584
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5103605EE
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 12:32:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5103605EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4PGOwwmBHG3J for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 12:32:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8FB3605EA
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 12:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8FB3605EA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D633786EC8; Sun, 12 Mar 2023 12:31:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 13:31:00 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c4cad5405fdd5def2d713a0bd14dc3c29b7bfb36
X-Git-Newrev: 3e48f8358e519f9c24262a6549d8f6c78ee01add
X-Patchwork-Hint: ignore
Message-Id: <20230312123159.D633786EC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gsl: bump to version
 2.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e48f8358e519f9c24262a6549d8f6c78ee01add
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log since 2.6, see:
https://git.savannah.gnu.org/cgit/gsl.git/tree/NEWS?h=release-2-7

This 2.7.1 version includes a minor libtool version fixup on top of 2.7:
https://git.savannah.gnu.org/cgit/gsl.git/commit/?id=77e7c7d008707dace56626020eaa6181912e9841

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gsl/gsl.hash | 2 +-
 package/gsl/gsl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gsl/gsl.hash b/package/gsl/gsl.hash
index 0d40a75497..153ae4131d 100644
--- a/package/gsl/gsl.hash
+++ b/package/gsl/gsl.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  b782339fc7a38fe17689cb39966c4d821236c28018b6593ddb6fd59ee40786a8  gsl-2.6.tar.gz
+sha256  dcb0fbd43048832b757ff9942691a8dd70026d5da0ff85601e52687f6deeb34b  gsl-2.7.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gsl/gsl.mk b/package/gsl/gsl.mk
index 3604f9836c..575cb75462 100644
--- a/package/gsl/gsl.mk
+++ b/package/gsl/gsl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSL_VERSION = 2.6
+GSL_VERSION = 2.7.1
 GSL_SITE = $(BR2_GNU_MIRROR)/gsl
 GSL_INSTALL_STAGING = YES
 GSL_LICENSE = GPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
