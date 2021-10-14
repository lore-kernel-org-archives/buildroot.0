Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBF7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:08:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00E8661040
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00E8661040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D194E83ABF;
	Thu, 14 Oct 2021 21:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hxjkv44iLwKz; Thu, 14 Oct 2021 21:08:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 315A783AC3;
	Thu, 14 Oct 2021 21:08:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC9B81BF9B9
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BA7540195
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EpUKYrMrfREb for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:08:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9D4A40139
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:08:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AF93594EA3; Thu, 14 Oct 2021 21:05:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 22:43:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31117b212a14799d33e88b08f44c7ac34ca38d51
X-Git-Newrev: 950445c90d0b169285c10ff6d2de02e737a98c9c
X-Patchwork-Hint: ignore
Message-Id: <20211014210541.AF93594EA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgta: bump to version 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=950445c90d0b169285c10ff6d2de02e737a98c9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update site: https://marlam.de/gta/news/source-code-moved
- Update indentation in hash file (two spaces)

https://marlam.de/gta/news

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libgta/Config.in   | 2 +-
 package/libgta/libgta.hash | 4 ++--
 package/libgta/libgta.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libgta/Config.in b/package/libgta/Config.in
index 894dced096..f66d83c90e 100644
--- a/package/libgta/Config.in
+++ b/package/libgta/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_LIBGTA
 	  Libgta is a portable library that implements the Generic
 	  Tagged Array (GTA) file format.
 
-	  http://gta.nongnu.org
+	  https://marlam.de/gta
diff --git a/package/libgta/libgta.hash b/package/libgta/libgta.hash
index d5fceb4205..49ac51d3a1 100644
--- a/package/libgta/libgta.hash
+++ b/package/libgta/libgta.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 1d2ff713955eee28310de082a8fd8e236403c27dee3716ba1238c56e6643e4fb  libgta-1.0.8.tar.xz
-sha256 36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
+sha256  d445667e145f755f0bc34ac89b63a6bfdce1eea943f87ee7a3f23dc0dcede8b1  libgta-1.2.1.tar.xz
+sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/libgta/libgta.mk b/package/libgta/libgta.mk
index 1189feeff9..9b19f42dc7 100644
--- a/package/libgta/libgta.mk
+++ b/package/libgta/libgta.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTA_VERSION = 1.0.8
-LIBGTA_SITE = http://download.savannah.nongnu.org/releases/gta
+LIBGTA_VERSION = 1.2.1
+LIBGTA_SITE = https://marlam.de/gta/releases
 LIBGTA_SOURCE = libgta-$(LIBGTA_VERSION).tar.xz
 LIBGTA_INSTALL_STAGING = YES
 LIBGTA_DEPENDENCIES = host-pkgconf bzip2 xz zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
