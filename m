Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5BBC433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 14:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46E4981446;
	Sun, 13 Nov 2022 14:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46E4981446
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OBrpjpFsH2hx; Sun, 13 Nov 2022 14:35:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B9FD81430;
	Sun, 13 Nov 2022 14:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B9FD81430
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C7D6C1BF2CE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3A1381427
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:35:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3A1381427
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OVUkwXkbpGXL for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:35:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1A5681441
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:35:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A5681441
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C09208363F; Sun, 13 Nov 2022 14:35:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 15:26:47 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 026a69328b9d8038f6b005d85a1d7c5d7616050a
X-Git-Newrev: 80951e9cd323560ef937e18959023300357b1710
X-Patchwork-Hint: ignore
Message-Id: <20221113143503.C09208363F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/numactl: use
 official license files
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

commit: https://git.buildroot.net/buildroot/commit/?id=80951e9cd323560ef937e18959023300357b1710
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Use official license files available since version 2.0.13 and
https://github.com/numactl/numactl/commit/b4d36f6a34b045a67ed5c0314ec26f5514f4ee44

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 702a60a2962172d725b210da42da2289a219a83f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/numactl/numactl.hash | 3 ++-
 package/numactl/numactl.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
index 802175d360..a261eab9d0 100644
--- a/package/numactl/numactl.hash
+++ b/package/numactl/numactl.hash
@@ -1,3 +1,4 @@
 # Locally calculated
 sha256  1ee27abd07ff6ba140aaf9bc6379b37825e54496e01d6f7343330cf1a4487035  numactl-2.0.14.tar.gz
-sha256  e2b738b1303c088421b09933a78c1326fe43692e2c05a7c510a2eb7e7a8eb575  README.md
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index cf9c759693..6ff94091e9 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -7,7 +7,7 @@
 NUMACTL_VERSION = 2.0.14
 NUMACTL_SITE = $(call github,numactl,numactl,v$(NUMACTL_VERSION))
 NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
-NUMACTL_LICENSE_FILES = README.md
+NUMACTL_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
 NUMACTL_INSTALL_STAGING = YES
 NUMACTL_AUTORECONF = YES
 NUMACTL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
