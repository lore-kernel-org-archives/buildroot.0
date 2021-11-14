Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57D0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 15:29:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5545861105
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 15:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5545861105
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20F1F40207;
	Sun, 14 Nov 2021 15:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vP5sIVLfiBp0; Sun, 14 Nov 2021 15:29:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 749FF4017D;
	Sun, 14 Nov 2021 15:29:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6C0991BF964
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 15:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C67E400C2
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 15:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PnmIo_mByWlD for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 15:29:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BCE44019C
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 15:29:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AB3798D323; Sun, 14 Nov 2021 15:25:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 16:29:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7c8f98557324c8ef6bebb613402e2ee619004d8b
X-Git-Newrev: d72a7997668a73d7d796603c7e96bca132226971
X-Patchwork-Hint: ignore
Message-Id: <20211114152527.AB3798D323@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gdbm: bump to version
 1.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=d72a7997668a73d7d796603c7e96bca132226971
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gdbm/gdbm.hash | 6 +++---
 package/gdbm/gdbm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
index f68a16e2f3..59f9ea62de 100644
--- a/package/gdbm/gdbm.hash
+++ b/package/gdbm/gdbm.hash
@@ -1,6 +1,6 @@
 # From https://www.gnu.org.ua/software/gdbm/download.html
-md5  a285c6e2dfed78668664c0555a7d202b  gdbm-1.21.tar.gz
-sha1  f6eec6113f04a4b5fd2c1cfead10e7d65c8f3d89  gdbm-1.21.tar.gz
+md5  0bbd38f12656e4728e2f7c4708aec014  gdbm-1.22.tar.gz
+sha1  c45cc0178cbf41828369b07749d41778741703bd  gdbm-1.22.tar.gz
 # Locally computed
-sha256  b0b7dbdefd798de7ddccdd8edf6693a30494f7789777838042991ef107339cc2  gdbm-1.21.tar.gz
+sha256  f366c823a6724af313b6bbe975b2809f9a157e5f6a43612a72949138d161d762  gdbm-1.22.tar.gz
 sha256  690d762f2e8e149ab1e2d6a409a3853b6151a2533b2382fae549a176d6bedecf  COPYING
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 3c52d12542..52624f5807 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDBM_VERSION = 1.21
+GDBM_VERSION = 1.22
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
 GDBM_LICENSE = GPL-3.0+
 GDBM_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
