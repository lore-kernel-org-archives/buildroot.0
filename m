Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8738C433EF
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 12:35:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9580560E90
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 12:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9580560E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C594403B3;
	Thu,  4 Nov 2021 12:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xOcgp6yKrF_z; Thu,  4 Nov 2021 12:35:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A99C403A9;
	Thu,  4 Nov 2021 12:34:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61B941BF25F
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 12:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4645F403CE
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 12:34:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1226UBWT95z7 for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 12:34:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F069403D4
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 12:34:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 40BBB8A52C; Thu,  4 Nov 2021 12:30:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Nov 2021 13:33:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b2478dfdbfc7c9c46e867e8aeb2fcf6c056792f
X-Git-Newrev: f75424f638adafeb6394446d3c14d1b745922aa4
X-Patchwork-Hint: ignore
Message-Id: <20211104123055.40BBB8A52C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fltk: bump to version 1.3.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=f75424f638adafeb6394446d3c14d1b745922aa4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/fltk/fltk/blob/release-1.3.7/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fltk/fltk.hash | 8 ++++----
 package/fltk/fltk.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/fltk/fltk.hash b/package/fltk/fltk.hash
index f3430e41f9..f8afe0c43b 100644
--- a/package/fltk/fltk.hash
+++ b/package/fltk/fltk.hash
@@ -1,5 +1,5 @@
-# From http://www.fltk.org/software.php?VERSION=1.3.5
-md5 e85017defd5a03ae82e634311db87bbf fltk-1.3.5-source.tar.gz
+# From http://www.fltk.org/software.php?VERSION=1.3.7
+md5  b28470d0509d00633d21bee9b65167f8  fltk-1.3.7-source.tar.bz2
 # Locally generated
-sha256 8729b2a055f38c1636ba20f749de0853384c1d3e9d1a6b8d4d1305143e115702  fltk-1.3.5-source.tar.gz
-sha256 57dd381e713fb309fb7dd85c3c38b274557ecb333475d0f1d65a5f06ad85c9a6  COPYING
+sha256  5ff1e90766ff4216e78e9a19a9bf527e6258f04accccd4429e9bb829b01d690d  fltk-1.3.7-source.tar.bz2
+sha256  57dd381e713fb309fb7dd85c3c38b274557ecb333475d0f1d65a5f06ad85c9a6  COPYING
diff --git a/package/fltk/fltk.mk b/package/fltk/fltk.mk
index 763ff612d3..7c26839343 100644
--- a/package/fltk/fltk.mk
+++ b/package/fltk/fltk.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLTK_VERSION = 1.3.5
-FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.gz
+FLTK_VERSION = 1.3.7
+FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.bz2
 FLTK_SITE = http://fltk.org/pub/fltk/$(FLTK_VERSION)
 FLTK_INSTALL_STAGING = YES
 # We force --libdir=/usr/lib, because by default, it is set to
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
