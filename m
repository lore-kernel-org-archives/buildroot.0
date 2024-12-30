Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BC9C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 870D24FDC7;
	Fri, 28 Feb 2025 16:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5f-Pm5RztGB8; Fri, 28 Feb 2025 16:48:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E33F84FDCD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E33F84FDCD;
	Fri, 28 Feb 2025 16:48:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 261B9711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:34:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7DAD42E3F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 409tGV4rs_M8 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD7034265F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD7034265F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C693087BF7; Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 Dec 2024 09:30:13 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f7fe84508a14641617586bc481a08cb3face0477
X-Git-Newrev: c9e46575928a332ca04a16bfd77e23b44592072a
X-Patchwork-Hint: ignore
Message-Id: <20250228162954.C693087BF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/kexec: bump to version
 2.0.30
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c9e46575928a332ca04a16bfd77e23b44592072a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For release announce, see:
https://lists.infradead.org/pipermail/kexec/2024-December/031314.html

Fixes:
https://autobuild.buildroot.org/results/64f179d996e9111ffe7b8ad18948066ebb1c6f93

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kexec/kexec.hash | 2 +-
 package/kexec/kexec.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kexec/kexec.hash b/package/kexec/kexec.hash
index 91496c06fc..d89a3772d0 100644
--- a/package/kexec/kexec.hash
+++ b/package/kexec/kexec.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kexec/sha256sums.asc
 # After checking pgp signature with key:
 # B8868C80BA62A1FFFAF5FDA9632D3A06589DA6B1
-sha256  67b1ac503aade45a54db0bc79228a8830a35d5d4f83cee932cff3e7a81a4a9ec  kexec-tools-2.0.29.tar.xz
+sha256  748a5fa7af27a8059d1de907bddfc32ac530c7189b5770c83e6f3d898d82124e  kexec-tools-2.0.30.tar.xz
 # locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 5f798b6a3f..4637a51506 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KEXEC_VERSION = 2.0.29
+KEXEC_VERSION = 2.0.30
 KEXEC_SOURCE = kexec-tools-$(KEXEC_VERSION).tar.xz
 KEXEC_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kexec
 KEXEC_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
