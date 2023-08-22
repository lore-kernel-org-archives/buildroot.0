Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45803EE49AF
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB560416CA;
	Tue, 22 Aug 2023 20:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB560416CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lv-zb_qXpo1l; Tue, 22 Aug 2023 20:38:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB1C9414D6;
	Tue, 22 Aug 2023 20:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB1C9414D6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A1C121BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A268414D6
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A268414D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hgMNgbmsLgqW for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:37:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A39640855
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A39640855
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55300861A4; Tue, 22 Aug 2023 20:37:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 22:35:58 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c93788350aa04a19884638ffa3c24446572d8169
X-Git-Newrev: 8789ea3ad0b91755223105b92808c9f90a38e85d
X-Patchwork-Hint: ignore
Message-Id: <20230822203731.55300861A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kmscube: bump to
 latest commit ea6c5d1e
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

commit: https://git.buildroot.net/buildroot/commit/?id=8789ea3ad0b91755223105b92808c9f90a38e85d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changes since commit 4660a7dc, see:
https://gitlab.freedesktop.org/mesa/kmscube/-/commits/ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kmscube/kmscube.hash | 2 +-
 package/kmscube/kmscube.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kmscube/kmscube.hash b/package/kmscube/kmscube.hash
index cb7abd48ea..e5ca6e72ec 100644
--- a/package/kmscube/kmscube.hash
+++ b/package/kmscube/kmscube.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ec135069d8bee7f4fe38cb9dc96fbbd56e0057290fa25eff8b5b314ee473c502  kmscube-4660a7dca6512b6e658759d00cff7d4ad2a2059d.tar.gz
+sha256  c7e7fd7ebcd59a5a57b717ba309a25b73e8028ed4f6bc95bd87e3b7ad5732834  kmscube-ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c.tar.gz
 sha256  f622099ab0d274133f6e62d5fccfe970b61134d80ed036f45f8cf1e90c3d5a05  COPYING
diff --git a/package/kmscube/kmscube.mk b/package/kmscube/kmscube.mk
index fc9a7f6f99..699af0b6c4 100644
--- a/package/kmscube/kmscube.mk
+++ b/package/kmscube/kmscube.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMSCUBE_VERSION = 4660a7dca6512b6e658759d00cff7d4ad2a2059d
+KMSCUBE_VERSION = ea6c5d1eeefbfb0a1c27ab74a6e4621f1d9adf4c
 KMSCUBE_SITE = https://gitlab.freedesktop.org/mesa/kmscube/-/archive/$(KMSCUBE_VERSION)
 KMSCUBE_LICENSE = MIT
 KMSCUBE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
