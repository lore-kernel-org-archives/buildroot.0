Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A952C07E9B
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:49:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ED8260FE7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ED8260FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E509282F80;
	Tue, 20 Jul 2021 21:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0iX9bezgc2Gj; Tue, 20 Jul 2021 21:49:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5772382F6F;
	Tue, 20 Jul 2021 21:49:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BAE601BF9B2
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB09C6059B
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KqeHi1MTbG06 for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:48:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C5786058D
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:48:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9639A87316; Tue, 20 Jul 2021 21:14:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:47:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c55e9618a14a6a69445d87bedd1778e76fd045b
X-Git-Newrev: d1a484a39547f307d799eaee9058bd75025e64da
X-Patchwork-Hint: ignore
Message-ID: <20210720211443.9639A87316@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gerbera: bump to version 1.8.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0733650037422973639=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720214758.QpCaQH7zRhSSGH_QlmtyVXZ52aEB_RYGWCBdefXDLT0@z>

--===============0733650037422973639==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d1a484a39547f307d799eaee9058bd75025e64da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jörg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gerbera/gerbera.hash | 2 +-
 package/gerbera/gerbera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index ab3dda917c..ed856bbf62 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  66f49ee30e53c36e08ce56a724f84bde8350001d3b9309f8e62a34f38446b619  gerbera-1.8.1.tar.gz
+sha256  b1e5591515f05a46de052ef4d95a2bb3387e96f565a5ce7abb6a77dbe581f09a  gerbera-1.8.2.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 9627209d60..d6251912ac 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 1.8.1
+GERBERA_VERSION = 1.8.2
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md

--===============0733650037422973639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============0733650037422973639==--
