Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EDFC433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 10:26:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFDAD6101E
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 10:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFDAD6101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82C1C40425;
	Sat, 16 Oct 2021 10:26:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ImgWfUWuyWrT; Sat, 16 Oct 2021 10:26:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCD6940462;
	Sat, 16 Oct 2021 10:26:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF51F1BF95E
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 10:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD47240462
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 10:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPrsdh4ZYLGF for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 10:25:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9B6440425
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 10:25:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 1E04295C6D; Sat, 16 Oct 2021 10:22:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 12:15:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85c58e201b58e912105cd0ede7cae776423a3a9b
X-Git-Newrev: 06c3211dd50f5ca8b767da2e4b599b574bba8941
X-Patchwork-Hint: ignore
Message-Id: <20211016102249.1E04295C6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnftnl: bump version to 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=06c3211dd50f5ca8b767da2e4b599b574bba8941
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For changes (since 1.1.7) see [1], [2] and [3].

[1] https://lists.netfilter.org/pipermail/netfilter-announce/2020/000246.html
[2] https://lists.netfilter.org/pipermail/netfilter-announce/2021/000248.html
[3] https://netfilter.org/projects/libnftnl/files/changes-libnftnl-1.2.0.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libnftnl/libnftnl.hash | 2 +-
 package/libnftnl/libnftnl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
index f22b02af09..9737da1878 100644
--- a/package/libnftnl/libnftnl.hash
+++ b/package/libnftnl/libnftnl.hash
@@ -1,3 +1,3 @@
 # From http://www.netfilter.org/projects/libnftnl/downloads.html
-sha256  20dbc13f11004aea2c9e479cfb90359cb11fe3446c3140811c18e4ec1648ed8f  libnftnl-1.1.7.tar.bz2
+sha256  90b01fddfe9be8c3245c3ba5ff5a4424a8df708828f92b2b361976b658c074f5  libnftnl-1.2.0.tar.bz2
 sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index f4487bdebe..eff93b895f 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNFTNL_VERSION = 1.1.7
+LIBNFTNL_VERSION = 1.2.0
 LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
 LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
 LIBNFTNL_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
