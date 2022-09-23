Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2A7C07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7289A41A1F;
	Fri, 23 Sep 2022 21:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7289A41A1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UwypqolJdMGz; Fri, 23 Sep 2022 21:36:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87BBF410BD;
	Fri, 23 Sep 2022 21:36:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87BBF410BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D8FC1C2745
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3702F60FB7
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3702F60FB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZzCCUiGyho3G for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:36:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5BE0660E7B
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BE0660E7B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4324B85F1D; Fri, 23 Sep 2022 21:36:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 23:34:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e385856f4312078c418bbc071865592bf3df44ae
X-Git-Newrev: 7547f7e393ec031bea4e114bf9fa9596c9a65ec7
X-Patchwork-Hint: ignore
Message-Id: <20220923213617.4324B85F1D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libffi: bump to version 3.4.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=7547f7e393ec031bea4e114bf9fa9596c9a65ec7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of license file (year updated with
https://github.com/libffi/libffi/commit/41d0851fc545ff1ffd8377236d193268c8a10740)

https://github.com/libffi/libffi/releases/tag/v3.4.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libffi/libffi.hash | 4 ++--
 package/libffi/libffi.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index cf1977c40d..689b5da4f1 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  540fb721619a6aba3bdeef7d940d8e9e0e6d2c193595bc243241b77ff9e93620  libffi-3.4.2.tar.gz
+sha256  4416dd92b6ae8fcb5b10421e711c4d3cb31203d77521a77d85d0102311e6c3b8  libffi-3.4.3.tar.gz
 # License files, locally calculated
-sha256  a61d06e8f7be57928e71e800eb9273b05cb8868c484108afe41e4305bb320dde  LICENSE
+sha256  2c9c2acb9743e6b007b91350475308aee44691d96aa20eacef8e199988c8c388  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 093256a629..ecfa120c7a 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.4.2
+LIBFFI_VERSION = 3.4.3
 LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
