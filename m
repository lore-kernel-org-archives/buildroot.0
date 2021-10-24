Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22244C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:18:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B340060524
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 14:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B340060524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F0E680F1E;
	Sun, 24 Oct 2021 14:18:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTQoYEOmSgtI; Sun, 24 Oct 2021 14:18:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC21980F41;
	Sun, 24 Oct 2021 14:18:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6979F1BF47D
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57A7A4026B
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 14:17:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t_Waooyo6IPP for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 14:17:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6754D40251
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 14:17:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AB8AF8864C; Sun, 24 Oct 2021 14:14:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 16:17:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dda28acbe50d896ef49c941b73eca6949f74875a
X-Git-Newrev: 7bd4ecc56d1328f8a6b9efc91ed339bdfc0514b6
X-Patchwork-Hint: ignore
Message-Id: <20211024141420.AB8AF8864C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/irssi: bump to version 1.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=7bd4ecc56d1328f8a6b9efc91ed339bdfc0514b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://irssi.org/NEWS/#v1-2-3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/irssi/irssi.hash | 4 ++--
 package/irssi/irssi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/irssi/irssi.hash b/package/irssi/irssi.hash
index 6a91e16487..05555250a7 100644
--- a/package/irssi/irssi.hash
+++ b/package/irssi/irssi.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	414fdee2ffaeb90a55f141b7fb3899608631dc891e2bc1f5e91ca31f1a621101  irssi-1.0.8.tar.xz
+sha256  a647bfefed14d2221fa77b6edac594934dc672c4a560417b1abcbbc6b88d769f  irssi-1.2.3.tar.xz
 # Locally calculated
-sha256	a1a27cb2ecee8d5378fbb3562f577104a445d6d66fee89286e16758305e63e2b  COPYING
+sha256  a1a27cb2ecee8d5378fbb3562f577104a445d6d66fee89286e16758305e63e2b  COPYING
diff --git a/package/irssi/irssi.mk b/package/irssi/irssi.mk
index c64690c59b..da71622a04 100644
--- a/package/irssi/irssi.mk
+++ b/package/irssi/irssi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRSSI_VERSION = 1.0.8
+IRSSI_VERSION = 1.2.3
 IRSSI_SOURCE = irssi-$(IRSSI_VERSION).tar.xz
 # Do not use the github helper here. The generated tarball is *NOT* the
 # same as the one uploaded by upstream for the release.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
