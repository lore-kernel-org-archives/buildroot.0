Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DAEC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:56:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC96B60F14
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 13:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DC96B60F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A24466073C;
	Wed,  4 Aug 2021 13:56:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PlIWUc9S31lz; Wed,  4 Aug 2021 13:56:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B62676067B;
	Wed,  4 Aug 2021 13:56:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 43CBC1BF9C1
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32046401B5
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 13:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YAXybN-7FYjA for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 13:56:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FBFD40159
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 13:56:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CB5988B51B; Wed,  4 Aug 2021 13:56:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 15:45:25 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 0f9fedce531bf444b5c9782af5386a2273a5b5f7
X-Git-Newrev: 7a41cdd8a6f245ea2f0f98678b7f232fe8025cb6
X-Patchwork-Hint: ignore
Message-Id: <20210804135607.CB5988B51B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] package/libuci: add
 license files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7a41cdd8a6f245ea2f0f98678b7f232fe8025cb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a4c619c1ffdbe6d91e632d65bafc910fd97f6e50)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuci/libuci.hash | 2 ++
 package/libuci/libuci.mk   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index b6962c2541..54bdb023aa 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,2 +1,4 @@
 # Locally computed
 sha256  76ef826df2961420cd7a4f1702bef06c37563d9807a2d8e84557963aab21ac80  libuci-52bbc99f69ea6f67b6fe264f424dac91bde5016c-br1.tar.gz
+sha256  53672dbbd32466fe6c7ad7cb35b54f666f3f1b41273cd3bd00a42054608aa512  cli.c
+sha256  69d4eea4de19d27014f3d6ed723081b4039700bfd73cd0a5e39e2c4f19a58c66  libuci.c
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 0d0b78036e..4515e3f21c 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -8,6 +8,7 @@ LIBUCI_VERSION = 52bbc99f69ea6f67b6fe264f424dac91bde5016c
 LIBUCI_SITE = https://git.openwrt.org/project/uci.git
 LIBUCI_SITE_METHOD = git
 LIBUCI_LICENSE = LGPL-2.1, GPL-2.0 (tools)
+LIBUCI_LICENSE_FILES = cli.c libuci.c
 LIBUCI_CPE_ID_VENDOR = openwrt
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
