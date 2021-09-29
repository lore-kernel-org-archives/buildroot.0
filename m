Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEE3C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 14:55:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF9C61502
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 14:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FF9C61502
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D05740722;
	Wed, 29 Sep 2021 14:55:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1JfS525qKbpG; Wed, 29 Sep 2021 14:55:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EA0D4071C;
	Wed, 29 Sep 2021 14:55:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 521ED1BF426
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 14:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 427AC60BE9
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 14:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hMSFn42Xa_8k for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 14:55:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 861FE600BB
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 14:55:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9B3378D4B1; Wed, 29 Sep 2021 14:52:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 16:41:30 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: df9336d389b1bad05a45fa3edf4a39cbec4f5617
X-Git-Newrev: 7786d71922fa33d7c51c8946b4ab80f051fb7ae1
X-Patchwork-Hint: ignore
Message-Id: <20210929145255.9B3378D4B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/lxc: bump to
 version 4.0.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=7786d71922fa33d7c51c8946b4ab80f051fb7ae1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

https://discuss.linuxcontainers.org/t/lxc-4-0-10-has-been-released/11618
https://discuss.linuxcontainers.org/t/lxc-4-0-9-lts-has-been-released/10999

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 9a48be36d5b188e0cd0f670875acfeb1a724e4d4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
