Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82D9ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 18:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FEF1403A2;
	Sun, 23 Oct 2022 18:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FEF1403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BjFM0AHIAVO8; Sun, 23 Oct 2022 18:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E903403E7;
	Sun, 23 Oct 2022 18:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E903403E7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B54AB1BF95E
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 18:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9199240399
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 18:56:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9199240399
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Ts9wYP72R95 for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 18:56:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA67F40395
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 18:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA67F40395
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9B3986F1F; Sun, 23 Oct 2022 18:56:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 20:54:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88661b8aa11ac0a6770e809fbc87f2dfec506fcc
X-Git-Newrev: 343b049007a6dd4283d871b51475ce5d2484bf0c
X-Patchwork-Hint: ignore
Message-Id: <20221023185600.B9B3986F1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbguard: bump to version 1.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=343b049007a6dd4283d871b51475ce5d2484bf0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/USBGuard/usbguard/blob/usbguard-1.1.2/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usbguard/usbguard.hash | 4 ++--
 package/usbguard/usbguard.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/usbguard/usbguard.hash b/package/usbguard/usbguard.hash
index a69240b3f9..6c10dc9d3e 100644
--- a/package/usbguard/usbguard.hash
+++ b/package/usbguard/usbguard.hash
@@ -1,5 +1,5 @@
-# From https://github.com/USBGuard/usbguard/releases/download/usbguard-1.1.1/usbguard-1.1.1.tar.gz.sum
-sha256  460ebfb4ffc5609739a202a3a1d9fda1c30de033b634845b8baa136352bfb432  usbguard-1.1.1.tar.gz
+# From https://github.com/USBGuard/usbguard/releases/download/usbguard-1.1.2/usbguard-1.1.2.tar.gz.sum
+sha256  dcf5c90f3f93030e04df1baeb8d388b678c40dd48b135ea12a7be7dee8944934  usbguard-1.1.2.tar.gz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 26dc40d15b..e0c9b58221 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBGUARD_VERSION = 1.1.1
+USBGUARD_VERSION = 1.1.2
 USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
 USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
