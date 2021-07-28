Return-Path: <SRS0=nMnf=MU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203E1C4338F
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:12:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2CC860EFD
	for <buildroot@archiver.kernel.org>; Wed, 28 Jul 2021 19:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2CC860EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E0EF40636;
	Wed, 28 Jul 2021 19:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKSBV9VTKlXQ; Wed, 28 Jul 2021 19:12:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C67164061A;
	Wed, 28 Jul 2021 19:12:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED40A1C113E
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBE51608BE
 for <buildroot@lists.busybox.net>; Wed, 28 Jul 2021 19:12:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XeXwHIeC1pOd for <buildroot@lists.busybox.net>;
 Wed, 28 Jul 2021 19:12:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31A7B608B5
 for <buildroot@buildroot.org>; Wed, 28 Jul 2021 19:12:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DA0B0890A7; Wed, 28 Jul 2021 18:37:20 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:05:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 929108481c3a8bfdb064426c7385ba159582223a
X-Git-Newrev: f7eccd6b3bc7361e8c9e2259c09ebd5537da9c81
X-Patchwork-Hint: ignore
Message-Id: <20210728183720.DA0B0890A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vsftpd: bump to version 3.0.4
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
