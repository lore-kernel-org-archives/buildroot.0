Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C786AECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D13C60AE0;
	Sun, 30 Oct 2022 16:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D13C60AE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HzzdKJVZh1Au; Sun, 30 Oct 2022 16:28:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95CA760A74;
	Sun, 30 Oct 2022 16:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95CA760A74
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4597D1BF957
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D0C94032F
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D0C94032F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ATeViZCqthNu for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2374940281
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2374940281
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05266875A1; Sun, 30 Oct 2022 16:28:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 17:20:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 277e1250a6a000911ab463296dbb29e2e53514c4
X-Git-Newrev: 702a60a2962172d725b210da42da2289a219a83f
X-Patchwork-Hint: ignore
Message-Id: <20221030162807.05266875A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/numactl: use official license files
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

commit: https://git.buildroot.net/buildroot/commit/?id=702a60a2962172d725b210da42da2289a219a83f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use official license files available since version 2.0.13 and
https://github.com/numactl/numactl/commit/b4d36f6a34b045a67ed5c0314ec26f5514f4ee44

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
