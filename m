Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408A1C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 20:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15B0560E07;
	Thu, 25 Apr 2024 20:37:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdW3Mej_Fe7F; Thu, 25 Apr 2024 20:37:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27D916136B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27D916136B;
	Thu, 25 Apr 2024 20:37:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA7551BF863
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 20:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C531E41586
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 20:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61jpPOWuDXOz for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 20:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FD5C41584
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FD5C41584
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 20:37:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5EDD86189; Thu, 25 Apr 2024 20:37:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 25 Apr 2024 22:36:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75c73c31ac881f095966dbeae8dcc3668b13939b
X-Git-Newrev: c7ec640ec22dc19e76631ab8ca7446cc69653241
X-Patchwork-Hint: ignore
Message-Id: <20240425203736.E5EDD86189@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lpeg: bump to version 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7ec640ec22dc19e76631ab8ca7446cc69653241
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lpeg/lpeg.hash | 4 ++--
 package/lpeg/lpeg.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lpeg/lpeg.hash b/package/lpeg/lpeg.hash
index cb995bde2c..1dbd522b2e 100644
--- a/package/lpeg/lpeg.hash
+++ b/package/lpeg/lpeg.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256  e0d0d687897f06588558168eeb1902ac41a11edd1b58f1aa61b99d0ea0abbfbc  lpeg-1.0.2-1.src.rock
+sha256  6637fcf4d3ddef7be490a2f0155bd2dcd053272d1bb78c015498709ef9fa75dd  lpeg-1.1.0-1.src.rock
 # computed locally
-sha256  2b80a8cce793e008ba433e5e0184f20aca4a67ec741439fafd86a874a6a91c49  lpeg-1.0.2/lpeg.html
+sha256  3f4f8a7997d9e0d9d0fca6d2b9877a5714251fff056783dd71288413b0abcf36  lpeg-1.1.0/lpeg.html
diff --git a/package/lpeg/lpeg.mk b/package/lpeg/lpeg.mk
index 7326e59e01..35fadb5791 100644
--- a/package/lpeg/lpeg.mk
+++ b/package/lpeg/lpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LPEG_VERSION = 1.0.2-1
+LPEG_VERSION = 1.1.0-1
 LPEG_LICENSE = MIT
 LPEG_LICENSE_FILES = $(LPEG_SUBDIR)/lpeg.html
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
