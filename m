Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153C9C6FA82
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A549141953;
	Wed, 21 Sep 2022 18:09:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A549141953
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vNqAv4yXsbj; Wed, 21 Sep 2022 18:09:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96B2641947;
	Wed, 21 Sep 2022 18:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96B2641947
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 555911BF3FC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 397D04192F
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 397D04192F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qugqo8fMh0BO for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:09:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F62641852
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 18:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F62641852
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C2BA85C43; Wed, 21 Sep 2022 18:09:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Sep 2022 20:08:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7a2b78da930fe445e2daac7782b3ffbc4b6a456
X-Git-Newrev: 537ea85f03d68091c5914ebbc8820b9c95edf204
X-Patchwork-Hint: ignore
Message-Id: <20220921180908.0C2BA85C43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pango: bump to version 1.50.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=537ea85f03d68091c5914ebbc8820b9c95edf204
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pango/pango.hash | 4 ++--
 package/pango/pango.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index 48d7f4d5a3..cbd391db20 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.9.sha256sum
-sha256  1b636aabf905130d806372136f5e137b6a27f26d47defd9240bf444f6a4fe610  pango-1.50.9.tar.xz
+# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.10.sha256sum
+sha256  7e5d2f1e40854d24a9a2c4d093bafe75dcdbeccdf1de43e4437332eabed64966  pango-1.50.10.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index 348759092d..649f3398cf 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.50
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).9
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).10
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
