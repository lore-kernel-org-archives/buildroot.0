Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0532C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 21:32:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D669610C9
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 21:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D669610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08DA3425A7;
	Fri, 17 Sep 2021 21:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SO1Pm88u7q_o; Fri, 17 Sep 2021 21:32:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7178A4257E;
	Fri, 17 Sep 2021 21:32:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 704321BF868
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 21:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 56D716F28F
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 21:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MmfyI8RhRwuO for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 21:32:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B62486E4CB
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 21:32:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 085AE8B540; Fri, 17 Sep 2021 21:30:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Sep 2021 23:31:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b80c488d04940cf1280657cf294d58d0022f222f
X-Git-Newrev: e275b7b0a08e401433180b79eb2968866d86e268
X-Patchwork-Hint: ignore
Message-Id: <20210917213034.085AE8B540@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/barebox: bump version to 2021.08.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e275b7b0a08e401433180b79eb2968866d86e268
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/barebox/Config.in    | 4 ++--
 boot/barebox/barebox.hash | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/boot/barebox/Config.in b/boot/barebox/Config.in
index af4c1f816c..71c855bb60 100644
--- a/boot/barebox/Config.in
+++ b/boot/barebox/Config.in
@@ -12,7 +12,7 @@ choice
 	  Select the specific Barebox version you want to use
 
 config BR2_TARGET_BAREBOX_LATEST_VERSION
-	bool "2021.07.0"
+	bool "2021.08.0"
 
 config BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	bool "Custom version"
@@ -40,7 +40,7 @@ endif
 
 config BR2_TARGET_BAREBOX_VERSION
 	string
-	default "2021.07.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
+	default "2021.08.0"	if BR2_TARGET_BAREBOX_LATEST_VERSION
 	default BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE if BR2_TARGET_BAREBOX_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_BAREBOX_CUSTOM_TARBALL
 	default BR2_TARGET_BAREBOX_CUSTOM_GIT_VERSION if BR2_TARGET_BAREBOX_CUSTOM_GIT
diff --git a/boot/barebox/barebox.hash b/boot/barebox/barebox.hash
index a82edef63b..34d34eece2 100644
--- a/boot/barebox/barebox.hash
+++ b/boot/barebox/barebox.hash
@@ -1,8 +1,8 @@
-# From https://www.barebox.org/download/barebox-2021.07.0.tar.bz2.md5
-md5  df3651a395e1420c2818dd464c63069d  barebox-2021.07.0.tar.bz2
+# From https://www.barebox.org/download/barebox-2021.08.0.tar.bz2.md5
+md5  eddcd7bc7e9d3836f0d68e3abce210ec  barebox-2021.08.0.tar.bz2
 
 # Locally calculated
-sha256  ce5d9d8953a2e3c21f1e6a72b1499962170bb41c4750ce8129ef44bf7860992d  barebox-2021.07.0.tar.bz2
+sha256  6b29f2f23d1b0c279f2ee680dcf29900c3d85367fbb107038f54b577d8a616dc  barebox-2021.08.0.tar.bz2
 
 # License files, locally computed
 sha256  ab1122aa9f9073ad1ec824edcd970b16a6a7881a34a18fd56c080debb2dca5d4  COPYING
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
