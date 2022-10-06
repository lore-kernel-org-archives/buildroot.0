Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700A5C433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 19:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 050BC610CC;
	Thu,  6 Oct 2022 19:41:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 050BC610CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OAzJDnmQEuvD; Thu,  6 Oct 2022 19:41:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A9C2610C4;
	Thu,  6 Oct 2022 19:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A9C2610C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14A141BF3C8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E48B083FE8
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 19:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E48B083FE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yhx5jg0C7cxY for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 19:41:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C028183FB9
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 19:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C028183FB9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADED4869EA; Thu,  6 Oct 2022 19:41:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 21:38:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6c8531a79908e79b78718bd1e0f683a33babafe
X-Git-Newrev: b31acdccef583a3da1d538abc347a5c8467c2598
X-Patchwork-Hint: ignore
Message-Id: <20221006194115.ADED4869EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender-connect: bump version to
 2.1.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b31acdccef583a3da1d538abc347a5c8467c2598
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-connect/mender-connect.hash | 2 +-
 package/mender-connect/mender-connect.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mender-connect/mender-connect.hash b/package/mender-connect/mender-connect.hash
index 46f37f954b..da4ec5fbbd 100644
--- a/package/mender-connect/mender-connect.hash
+++ b/package/mender-connect/mender-connect.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  6410bcd76cebd21e9f18fe5768928d67163e4bb2b6ae76d0e20815400d907657  mender-connect-2.0.2.tar.gz
+sha256  96b81bb4c72eb8c1756febb94101c0dea5a6d4884591824e61a5f2509cd9ca9b  mender-connect-2.1.0.tar.gz
 sha256  78b3954421ec6499c3f9735b96d52288574ae80c747416a52548d7f526f26e8c  LIC_FILES_CHKSUM.sha256
 
 # Vendor licenses
diff --git a/package/mender-connect/mender-connect.mk b/package/mender-connect/mender-connect.mk
index 1b0285cffc..36ddd5f7db 100644
--- a/package/mender-connect/mender-connect.mk
+++ b/package/mender-connect/mender-connect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MENDER_CONNECT_VERSION = 2.0.2
+MENDER_CONNECT_VERSION = 2.1.0
 MENDER_CONNECT_SITE = $(call github,mendersoftware,mender-connect,$(MENDER_CONNECT_VERSION))
 MENDER_CONNECT_LICENSE = Apache-2.0, BSD-2-Clause, BSD-3-Clause, ISC, MIT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
