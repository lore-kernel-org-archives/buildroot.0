Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3595CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:31:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F148661354
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F148661354
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8E35607C4;
	Mon, 18 Oct 2021 19:31:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IkTrtFo8fXJl; Mon, 18 Oct 2021 19:31:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E30B606C9;
	Mon, 18 Oct 2021 19:31:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 167FA1BF319
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06C9260879
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:27:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H0i3-SVdAUiU for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:27:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 595FD60654
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1566C875DB; Mon, 18 Oct 2021 19:24:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:23:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb3ba3d0ea273683ca166c844353ff256d9077b4
X-Git-Newrev: ce43767c08cbbf525d839d3fffacb3afb665a9fe
X-Patchwork-Hint: ignore
Message-Id: <20211018192438.1566C875DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuci: bump version to 4b3db11
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce43767c08cbbf525d839d3fffacb3afb665a9fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

  - 4b3db11 cli: add option for changing save path

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuci/libuci.hash | 4 ++--
 package/libuci/libuci.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libuci/libuci.hash b/package/libuci/libuci.hash
index 54bdb023aa..87e539d41b 100644
--- a/package/libuci/libuci.hash
+++ b/package/libuci/libuci.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  76ef826df2961420cd7a4f1702bef06c37563d9807a2d8e84557963aab21ac80  libuci-52bbc99f69ea6f67b6fe264f424dac91bde5016c-br1.tar.gz
-sha256  53672dbbd32466fe6c7ad7cb35b54f666f3f1b41273cd3bd00a42054608aa512  cli.c
+sha256  4b4e3ef9c9f51c02a1985c63ff0e8fc1f3aafdf24491247a4dc33c993c3fa1ea  libuci-4b3db1179747b6a6779029407984bacef851325c-br1.tar.gz
+sha256  39e1cc18a36172fb80d9b37f0af77d78ae935bd8a020978a7895d9e76a24e112  cli.c
 sha256  69d4eea4de19d27014f3d6ed723081b4039700bfd73cd0a5e39e2c4f19a58c66  libuci.c
diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 4515e3f21c..81e87aa5be 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUCI_VERSION = 52bbc99f69ea6f67b6fe264f424dac91bde5016c
+LIBUCI_VERSION = 4b3db1179747b6a6779029407984bacef851325c
 LIBUCI_SITE = https://git.openwrt.org/project/uci.git
 LIBUCI_SITE_METHOD = git
 LIBUCI_LICENSE = LGPL-2.1, GPL-2.0 (tools)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
