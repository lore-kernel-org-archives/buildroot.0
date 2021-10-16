Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3FBC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:29:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0B3461250
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0B3461250
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94FC1404D1;
	Sat, 16 Oct 2021 08:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ccM1sF8UusPo; Sat, 16 Oct 2021 08:29:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12703404C1;
	Sat, 16 Oct 2021 08:29:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 96CBD1BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93E80404D1
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:29:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i53VJhMtZOqb for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:29:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF05840486
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:29:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 503E495C59; Sat, 16 Oct 2021 08:26:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 10:25:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 613953f8217bf5b27489e0a939147ef7c74c3f7a
X-Git-Newrev: dbd66de708ac232b386ca20f59c9afc76e145fad
X-Patchwork-Hint: ignore
Message-Id: <20211016082647.503E495C59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cloop: bump to version 3.14.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbd66de708ac232b386ca20f59c9afc76e145fad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cloop/cloop.hash | 8 ++++----
 package/cloop/cloop.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/cloop/cloop.hash b/package/cloop/cloop.hash
index 7af1a9594d..eb922764bb 100644
--- a/package/cloop/cloop.hash
+++ b/package/cloop/cloop.hash
@@ -1,6 +1,6 @@
-# From http://snapshot.debian.org/archive/debian/20150503T155713Z/pool/main/c/cloop/cloop_3.14.1.2.dsc
-sha256	ac344225b3a5c4ddbb0d4b20cd4874798b51427b707b53e2ee9fbdada7497c95	cloop_3.14.1.2.tar.xz
+# From http://snapshot.debian.org/archive/debian/20200419T152225Z/pool/main/c/cloop/cloop_3.14.1.3.dsc
+sha256  e3079e70f9edae8ed1ac64694af08f6c7dc710ca65a56e4770dcb1325a293193  cloop_3.14.1.3.tar.xz
 
 # Hash for license files
-sha256	91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad	advancecomp-1.15/COPYING
-sha256	1b1f89e94e131e259b9e334565c5c3500d4b8aa755b75c3f145ddcdff3b89124	README
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  advancecomp-1.15/COPYING
+sha256  1b1f89e94e131e259b9e334565c5c3500d4b8aa755b75c3f145ddcdff3b89124  README
diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
index 046d98c862..f3c4954ead 100644
--- a/package/cloop/cloop.mk
+++ b/package/cloop/cloop.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CLOOP_VERSION = 3.14.1.2
+CLOOP_VERSION = 3.14.1.3
 CLOOP_SOURCE = cloop_$(CLOOP_VERSION).tar.xz
-CLOOP_SITE = http://snapshot.debian.org/archive/debian/20150503T155713Z/pool/main/c/cloop
+CLOOP_SITE = http://snapshot.debian.org/archive/debian/20200419T152225Z/pool/main/c/cloop
 CLOOP_LICENSE = GPL-2.0 (module), GPL-2.0+ (advancecomp)
 CLOOP_LICENSE_FILES = README advancecomp-1.15/COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
