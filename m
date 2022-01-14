Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D29FC433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 15:57:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DCC060B52;
	Fri, 14 Jan 2022 15:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tM7__QgHRpf0; Fri, 14 Jan 2022 15:56:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7381B60B26;
	Fri, 14 Jan 2022 15:56:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 114411BF5A2
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F029B400FE
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 15:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HgWlpVR4sSTT for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 15:56:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFE454040D
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 15:56:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 91B7F7F8B5; Fri, 14 Jan 2022 15:50:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 16:53:42 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6af6a010f26d1839b3387c80369d4321500ea3ee
X-Git-Newrev: 05889c9c37d6367c4643c7992714ed461da6fe2e
X-Patchwork-Hint: ignore
Message-Id: <20220114155006.91B7F7F8B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/pcre2: bump to
 version 10.37
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

commit: https://git.buildroot.net/buildroot/commit/?id=05889c9c37d6367c4643c7992714ed461da6fe2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

diff LICENSE:
-Copyright (c) 1997-2020 University of Cambridge
+Copyright (c) 1997-2021 University of Cambridge
-Copyright(c) 2010-2020 Zoltan Herczeg
+Copyright(c) 2010-2021 Zoltan Herczeg

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 0b151824ea9cba34b3c97d9ff82b5e1b52dee9c3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pcre2/pcre2.hash | 6 +++---
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index b30a290968..130ce1f596 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.pcre.org/pub/pcre/pcre2-10.36.tar.bz2.sig
-sha256  a9ef39278113542968c7c73a31cfcb81aca1faa64690f400b907e8ab6b4a665c  pcre2-10.36.tar.bz2
+# https://ftp.pcre.org/pub/pcre/pcre2-10.37.tar.bz2.sig
+sha256  4d95a96e8b80529893b4562be12648d798b957b1ba1aae39606bbc2ab956d270  pcre2-10.37.tar.bz2
 # Locally computed
-sha256  8937734bbb1ba65d9f8ac7a7c8fc9016759a09aa2fb37d2175c06c9e7a856a24  LICENCE
+sha256  9c9488256e3612ec5ea40fd12abe7ec55a58f23bd36e6f465116c2b3cbffba02  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index d02772650f..220eb8a99c 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.36
+PCRE2_VERSION = 10.37
 PCRE2_SITE = https://ftp.pcre.org/pub/pcre
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
