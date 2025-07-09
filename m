Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C13CC83F0A
	for <buildroot@archiver.kernel.org>; Wed,  9 Jul 2025 19:52:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 759F460ADB;
	Wed,  9 Jul 2025 19:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSRuDpl3cL4f; Wed,  9 Jul 2025 19:52:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DAC4606BF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DAC4606BF;
	Wed,  9 Jul 2025 19:52:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8E6C15F
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAB0280AA8
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ar6O1KhcP54 for <buildroot@buildroot.org>;
 Wed,  9 Jul 2025 19:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 179F180A87
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 179F180A87
 for <buildroot@buildroot.org>; Wed,  9 Jul 2025 19:52:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 071808624F; Wed,  9 Jul 2025 19:52:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Jul 2025 21:32:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 009559d42cb4f4f65e762f8bff1cf2585cae4382
X-Git-Newrev: ce839ea1b991cdaf66497b40011cb34e8c29c93a
X-Patchwork-Hint: ignore
Message-Id: <20250709195252.071808624F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libconfig: bump to version 1.8.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ce839ea1b991cdaf66497b40011cb34e8c29c93a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:

https://github.com/hyperrealm/libconfig/releases/tag/v1.8.1

The download URL now points to
https://hyperrealm.github.io/libconfig/dist.

The COPYING.LIB file has been changed. See the following commit for
details:

https://github.com/hyperrealm/libconfig/commit/be4da0c2fd5d08cefb628af67b68d32907fc972a

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libconfig/libconfig.hash | 4 ++--
 package/libconfig/libconfig.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
index d359301d6f..2b10dfc125 100644
--- a/package/libconfig/libconfig.hash
+++ b/package/libconfig/libconfig.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  545166d6cac037744381d1e9cc5a5405094e7bfad16a411699bcff40bbb31ee7  libconfig-1.7.3.tar.gz
-sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING.LIB
+sha256  87c6f382994b245f9213be34a2bf19c8ee7d033d7abaa51e88fbb7bad79e2dc6  libconfig-1.8.1.tar.gz
+sha256  cbbad55f94feadb16061c4f782910bac254460a44f1c8abd2b91452eff085f55  COPYING.LIB
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index 6cdf603185..3fa2be3563 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCONFIG_VERSION = 1.7.3
-LIBCONFIG_SITE = https://github.com/hyperrealm/libconfig/releases/download/v$(LIBCONFIG_VERSION)
+LIBCONFIG_VERSION = 1.8.1
+LIBCONFIG_SITE = https://hyperrealm.github.io/libconfig/dist
 LIBCONFIG_LICENSE = LGPL-2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
 LIBCONFIG_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
