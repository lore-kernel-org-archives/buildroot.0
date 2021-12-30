Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289B8C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 15:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D102740550;
	Thu, 30 Dec 2021 15:16:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1xNo5wJtS3Dt; Thu, 30 Dec 2021 15:16:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDEB6401C5;
	Thu, 30 Dec 2021 15:16:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CD911BF403
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A58F401C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 15:16:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LaKK5AtUkUPx for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 15:16:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E8BB40166
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 15:16:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7043481484; Thu, 30 Dec 2021 15:10:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 16:15:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ac1d1a133b68babb6911dcd9299640ed5efbf25
X-Git-Newrev: 383f73289ce6b0eaba9e8f2c611f0493959b69fe
X-Patchwork-Hint: ignore
Message-Id: <20211230151009.7043481484@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pru-software-support: bump to
 latest version 6.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=383f73289ce6b0eaba9e8f2c611f0493959b69fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update to that latest version of the PRU software support [1]. Since
v5.9.0, the examples have been updated, kernel header references have
been bumped to v5.10, and some minor bug fixes added.

[1]
https://git.ti.com/cgit/pru-softward-support-package/pru-software-support-package

Signed-off-by: Ash Charles <ashcharles@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pru-software-support/pru-software-support.hash | 2 +-
 package/pru-software-support/pru-software-support.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pru-software-support/pru-software-support.hash b/package/pru-software-support/pru-software-support.hash
index a2c78e7a1a..e8ccc93a2c 100644
--- a/package/pru-software-support/pru-software-support.hash
+++ b/package/pru-software-support/pru-software-support.hash
@@ -1,3 +1,3 @@
 # Locally-calculated hash
-sha256  4a6b1b2b8ca892c442fd7fce7ddbf6b74e0619def2bb19f3ad67c94720b7ca3a pru-software-support-package-v5.9.0.tar.gz
+sha256  cba9e0bca3abc0041cf7ce6a30af9de440b325cf8c9bcc826485d2f837cb4cf2 pru-software-support-package-v6.0.1.tar.gz
 sha256  62a2f56498cd1bac2d4ea6ea1c941affba1e4bb65bfdf2dcffd8e5079fa34399  PRU-Package-v6.1-Manifest.html
diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
index 87a382948b..d0259c5f80 100644
--- a/package/pru-software-support/pru-software-support.mk
+++ b/package/pru-software-support/pru-software-support.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PRU_SOFTWARE_SUPPORT_VERSION = 5.9.0
+PRU_SOFTWARE_SUPPORT_VERSION = 6.0.1
 PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/snapshot
 PRU_SOFTWARE_SUPPORT_SOURCE = $(PRU_SOFTWARE_SUPPORT_NAME)-package-v$(PRU_SOFTWARE_SUPPORT_VERSION).tar.gz
 PRU_SOFTWARE_SUPPORT_LICENSE = BSD-3-Clause, Public Domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
