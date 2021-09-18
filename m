Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAD1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:13:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 626E36126A
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 15:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 626E36126A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 283664021E;
	Sat, 18 Sep 2021 15:13:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tdQKDRAAzUZX; Sat, 18 Sep 2021 15:13:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55D20400C3;
	Sat, 18 Sep 2021 15:13:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DF9A1BF861
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 077CF606B6
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 15:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x1KPGDUf9q_g for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 15:13:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56CB960662
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 15:13:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id E2B0D87F7F; Sat, 18 Sep 2021 15:11:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 Sep 2021 17:13:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94b88517d7f9923ce2f82c12c43a7f484afb0edc
X-Git-Newrev: 9a48be36d5b188e0cd0f670875acfeb1a724e4d4
X-Patchwork-Hint: ignore
Message-Id: <20210918151149.E2B0D87F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lxc: bump to version 4.0.10
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9a48be36d5b188e0cd0f670875acfeb1a724e4d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://discuss.linuxcontainers.org/t/lxc-4-0-10-has-been-released/11618
https://discuss.linuxcontainers.org/t/lxc-4-0-9-lts-has-been-released/10999

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lxc/lxc.hash | 2 +-
 package/lxc/lxc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 85cdecceb2..efd7a8e42c 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  9165dabc0bb6ef7f2fda2009aee90b20fbefe77ed8008347e9f06048eba1e463  lxc-4.0.6.tar.gz
+sha256  a10c518056d2e497bd600e4ffac2853bdeab1e835bf455a6d87cc8df128bfae9  lxc-4.0.10.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 24a1f3c588..93f6d2535f 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 4.0.6
+LXC_VERSION = 4.0.10
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
