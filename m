Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BEC1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 10:25:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CA436101E
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 10:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CA436101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15ED1606DB;
	Sat, 16 Oct 2021 10:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4SadAnY_Eukv; Sat, 16 Oct 2021 10:25:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B7366068B;
	Sat, 16 Oct 2021 10:25:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC8D51BF870
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 10:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B62E183A52
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 10:25:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tu-mGQihK8qx for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 10:25:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECC0280F54
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 10:25:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 26B7F95C58; Sat, 16 Oct 2021 10:22:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 12:15:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06c3211dd50f5ca8b767da2e4b599b574bba8941
X-Git-Newrev: c57a432982f99440b46eb519625518633bea9823
X-Patchwork-Hint: ignore
Message-Id: <20211016102249.26B7F95C58@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nftables: bump version to 1.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c57a432982f99440b46eb519625518633bea9823
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For changes (since 0.9.6) see [1], [2], [3] and [4].

[1] https://lists.netfilter.org/pipermail/netfilter-announce/2020/000247.html
[2] https://lists.netfilter.org/pipermail/netfilter-announce/2021/000249.html
[3] https://www.netfilter.org/projects/nftables/files/changes-nftables-0.9.9.txt
[4] https://www.netfilter.org/projects/nftables/files/changes-nftables-1.0.0.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nftables/nftables.hash | 2 +-
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index 1112b7a8ad..bbf7e5a2b1 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,3 +1,3 @@
 # From https://netfilter.org/projects/nftables/downloads.html
-sha256  68d6fdfe8ab02303e6b1f13968a4022da5b0120110eaee3233d806857937b66e  nftables-0.9.6.tar.bz2
+sha256  58bf547daf967a2b88ecb4f425f126006ebde22711db806b25c1d6cf84fe45f4  nftables-1.0.0.tar.bz2
 sha256  c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index f9468c5250..6a27975a53 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 0.9.6
+NFTABLES_VERSION = 1.0.0
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
