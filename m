Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D263CFB440
	for <buildroot@archiver.kernel.org>; Mon,  7 Oct 2024 06:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2290C80CB8;
	Mon,  7 Oct 2024 06:06:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rakiEXrjK5si; Mon,  7 Oct 2024 06:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71F2180E09
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71F2180E09;
	Mon,  7 Oct 2024 06:06:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E70F01BF471
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0B304024D
 for <buildroot@lists.busybox.net>; Mon,  7 Oct 2024 06:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_90YaaRKeOM for <buildroot@lists.busybox.net>;
 Mon,  7 Oct 2024 06:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4F5140347
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4F5140347
 for <buildroot@buildroot.org>; Mon,  7 Oct 2024 06:06:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B27D585731; Mon,  7 Oct 2024 06:06:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Oct 2024 08:02:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b5f337e891c79046f01022fd2b8eadbe7293ba02
X-Git-Newrev: bf938d93c9156f10763824e9e50d519c3bfc09af
X-Patchwork-Hint: ignore
Message-Id: <20241007060625.B27D585731@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mtools: bump to version 4.0.45
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf938d93c9156f10763824e9e50d519c3bfc09af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release announces:
https://lists.gnu.org/archive/html/info-mtools/2024-09/msg00001.html
https://lists.gnu.org/archive/html/info-mtools/2024-06/msg00000.html

For change log since 4.0.43, see:
https://svn.savannah.gnu.org/viewvc/mtools/tags/4.0.45/NEWS?view=markup

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mtools/mtools.hash | 2 +-
 package/mtools/mtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index 412d67a328..0cad06ce58 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  997ffe4125a19de1fd433ed63f128f7d54bc1a5915f3cdb36da6491ef917f217  mtools-4.0.43.tar.lz
+sha256  32ca85dfc1674c536143d4e0da60e3134039eb9552e0fecfa110e9c8736093ce  mtools-4.0.45.tar.lz
 
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 96d8e43ea2..7089af339e 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.43
+MTOOLS_VERSION = 4.0.45
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
