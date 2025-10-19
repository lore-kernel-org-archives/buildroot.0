Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72206CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 19:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44C0283DF5;
	Sun, 19 Oct 2025 19:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xHPlAJuw8iLJ; Sun, 19 Oct 2025 19:45:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D4D483DFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D4D483DFD;
	Sun, 19 Oct 2025 19:45:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCB0B177
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B363D83DFD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwvJOmJ19uqH for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 19:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E1F783DF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E1F783DF5
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:45:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1E9687666; Sun, 19 Oct 2025 19:45:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 21:39:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2966f065a465c34f322abd3092a3b42a3eb08fb
X-Git-Newrev: 9b2728f9ae84e099b06da57d37fb91a4f0cf8091
X-Patchwork-Hint: ignore
Message-Id: <20251019194516.F1E9687666@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/leptonica: bump to version 1.86.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9b2728f9ae84e099b06da57d37fb91a4f0cf8091
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
http://www.leptonica.org/source/version-notes.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/leptonica/leptonica.hash | 2 +-
 package/leptonica/leptonica.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index 698342ae99..293eef4741 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  3745ae3bf271a6801a2292eead83ac926e3a9bc1bf622e9cd4dd0f3786e17205  leptonica-1.85.0.tar.gz
+sha256  1fa08e40bb37fd45802d5e6e7b43927449a5c47d4608ef99d3bd3f0fa76baedc  leptonica-1.86.0.tar.gz
 sha256  87829abb5bbb00b55a107365da89e9a33f86c4250169e5a1e5588505be7d5806  leptonica-license.txt
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index 58db93d34c..a957e05616 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEPTONICA_VERSION = 1.85.0
+LEPTONICA_VERSION = 1.86.0
 LEPTONICA_SITE = https://github.com/DanBloomberg/leptonica/releases/download/$(LEPTONICA_VERSION)
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
