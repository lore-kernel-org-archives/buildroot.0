Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E1FD10374
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3412C812A9;
	Thu, 24 Oct 2024 20:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IbGKQ8PYF-p9; Thu, 24 Oct 2024 20:48:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4E25812B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E25812B6;
	Thu, 24 Oct 2024 20:48:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 175C94960
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD30F40C1F
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFEkNCpUI2so for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:47:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF3E940C39
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF3E940C39
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:47:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD5B3835F8; Thu, 24 Oct 2024 20:47:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 22:47:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 23ea1c331749d8a60eba27802a2d9b4e2328911e
X-Git-Newrev: c54efd003f605db439b02d287b3b0c5e92505c12
X-Patchwork-Hint: ignore
Message-Id: <20241024204750.AD5B3835F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erofs-utils: bump to version 1.8.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c54efd003f605db439b02d287b3b0c5e92505c12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For a change log since 1.8.1, see:
https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/ChangeLog?h=v1.8.2

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erofs-utils/erofs-utils.hash | 2 +-
 package/erofs-utils/erofs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erofs-utils/erofs-utils.hash b/package/erofs-utils/erofs-utils.hash
index 8140dad83b..573da1762d 100644
--- a/package/erofs-utils/erofs-utils.hash
+++ b/package/erofs-utils/erofs-utils.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  5dbf7b492f7682462b97a77121d43ca7609cd90e65f8c96931aefc820a6f0da3  erofs-utils-1.8.1.tar.gz
+sha256  64b6ff7e899f62480283cee63787f37f0f9c4be7a6bc7a23d734aaa873a6cff4  erofs-utils-1.8.2.tar.gz
 sha256  0df042de29b44887355db86c79708a4489ce6e6666f6e33ad02040293f09e6a2  COPYING
 sha256  a400f85dd06d230f1b308cde4290a53f345b6e320a376b7904b31c51c2fd4b1a  LICENSES/Apache-2.0
 sha256  feee3b3157dcdf78d4f50edefbd5dd7adf8b6d52c11bfaaa746a85a373256713  LICENSES/GPL-2.0
diff --git a/package/erofs-utils/erofs-utils.mk b/package/erofs-utils/erofs-utils.mk
index 7033be4a06..40349c309c 100644
--- a/package/erofs-utils/erofs-utils.mk
+++ b/package/erofs-utils/erofs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EROFS_UTILS_VERSION = 1.8.1
+EROFS_UTILS_VERSION = 1.8.2
 EROFS_UTILS_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/snapshot
 EROFS_UTILS_LICENSE = GPL-2.0+, GPL-2.0+ or Apache-2.0 (liberofs)
 EROFS_UTILS_LICENSE_FILES = COPYING LICENSES/Apache-2.0 LICENSES/GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
