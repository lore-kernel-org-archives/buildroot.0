Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A17C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D9868146C;
	Mon, 21 Nov 2022 21:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D9868146C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HrhkTud3hDCs; Mon, 21 Nov 2022 21:39:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F2F981461;
	Mon, 21 Nov 2022 21:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F2F981461
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5960D1BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FAE6404ED
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FAE6404ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dClXUx4e78PI for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:39:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24D92404E9
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24D92404E9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10907840E7; Mon, 21 Nov 2022 21:39:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 22:38:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 40921efbca705b270e2bf58f5dff57d49b2d7747
X-Git-Newrev: c3134c6abd4d34ecef938aacc04edd5b3c4e9a92
X-Patchwork-Hint: ignore
Message-Id: <20221121213910.10907840E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nano: bump to version
 7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3134c6abd4d34ecef938aacc04edd5b3c4e9a92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/nano/nano.hash | 6 +++---
 package/nano/nano.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 83de85b415..86f414aca0 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v6/nano-6.4.tar.xz.asc
-# using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256  4199ae8ca78a7796de56de1a41b821dc47912c0307e9816b56cc317df34661c0  nano-6.4.tar.xz
+# https://www.nano-editor.org/dist/v7/nano-7.0.tar.xz.asc
+# using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
+sha256  8dd6eac38b2b8786d82681f0e1afd84f6b75210d17391b6443c437e451552149  nano-7.0.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index ecfc37412d..f9338550d4 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NANO_VERSION_MAJOR = 6
-NANO_VERSION = $(NANO_VERSION_MAJOR).4
+NANO_VERSION_MAJOR = 7
+NANO_VERSION = $(NANO_VERSION_MAJOR).0
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
