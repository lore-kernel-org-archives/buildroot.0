Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0457CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:33:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF00B60F02
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF00B60F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88EDA4157D;
	Tue,  3 Aug 2021 22:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D-_D01dzStoi; Tue,  3 Aug 2021 22:33:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD4AB4149E;
	Tue,  3 Aug 2021 22:33:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDA9F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4C0A4058F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Aq8LNL5N53o for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 492E940558
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 93AC487C2D; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:05:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 929108481c3a8bfdb064426c7385ba159582223a
X-Git-Newrev: f7eccd6b3bc7361e8c9e2259c09ebd5537da9c81
X-Patchwork-Hint: ignore
Message-Id: <20210803211021.93AC487C2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/vsftpd: bump to
 version 3.0.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=f7eccd6b3bc7361e8c9e2259c09ebd5537da9c81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://security.appspot.com/vsftpd/Changelog.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vsftpd/vsftpd.hash | 2 +-
 package/vsftpd/vsftpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vsftpd/vsftpd.hash b/package/vsftpd/vsftpd.hash
index 955cd30889..751faf61ca 100644
--- a/package/vsftpd/vsftpd.hash
+++ b/package/vsftpd/vsftpd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  9d4d2bf6e6e2884852ba4e69e157a2cecd68c5a7635d66a3a8cf8d898c955ef7  vsftpd-3.0.3.tar.gz
+sha256  6b9421bd27e8a6cdeed5b31154f294a20b003a11a26c09500715a0a6b1b86a26  vsftpd-3.0.4.tar.gz
 # Locally computed
 sha256  c9cf119e2f9dbcf187fb805ba5aded105db26a693803636fb7228c98460ffbf2  COPYING
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 49b9b1917f..181f82f397 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VSFTPD_VERSION = 3.0.3
+VSFTPD_VERSION = 3.0.4
 VSFTPD_SITE = https://security.appspot.com/downloads
 VSFTPD_LIBS = -lcrypt
 VSFTPD_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
