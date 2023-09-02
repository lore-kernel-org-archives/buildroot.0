Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A69CA0FF7
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 10:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7764E6109C;
	Sat,  2 Sep 2023 10:00:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7764E6109C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q5PAJpX1j__6; Sat,  2 Sep 2023 10:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF5BE60BAA;
	Sat,  2 Sep 2023 10:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF5BE60BAA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A977A1BF21A
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 09:59:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFE8D607C7
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 09:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFE8D607C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rpxlntSekijM for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 09:59:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD103607C1
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 09:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD103607C1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C732186881; Sat,  2 Sep 2023 09:59:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 10:25:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c82de32369d9c5c298058896c87b3e6fa9b465de
X-Git-Newrev: a95d65e495ccfbf8bd91c8f9a41bd12574a937cb
X-Patchwork-Hint: ignore
Message-Id: <20230902095900.C732186881@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/vulkan-headers: bump
 version to 1.3.262
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

commit: https://git.buildroot.net/buildroot/commit/?id=a95d65e495ccfbf8bd91c8f9a41bd12574a937cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update the license hash as the license file is now located at LICENSE.md
isntead of LICENSE.txt, and add MIT to the list of licenses.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vulkan-headers/vulkan-headers.hash | 4 ++--
 package/vulkan-headers/vulkan-headers.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/vulkan-headers/vulkan-headers.hash b/package/vulkan-headers/vulkan-headers.hash
index cf213d8b52..b38bfcff47 100644
--- a/package/vulkan-headers/vulkan-headers.hash
+++ b/package/vulkan-headers/vulkan-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e3ee02eff07ebcdb0ddfd06366d986c889f3392b6c4d79615bb06aefc1fda900  vulkan-headers-1.3.257.tar.gz
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
+sha256  317e467a5fb2eaa6a18b984ec70fdbfaccd93595a3e6f4bcceca7d3fab280505  vulkan-headers-1.3.262.tar.gz
+sha256  ac24e5ea920e4318e4d02c4086ae51f53cfb03feed06c18df1019e7ada1ec7bc  LICENSE.md
diff --git a/package/vulkan-headers/vulkan-headers.mk b/package/vulkan-headers/vulkan-headers.mk
index c42b005abe..5434f69a40 100644
--- a/package/vulkan-headers/vulkan-headers.mk
+++ b/package/vulkan-headers/vulkan-headers.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-VULKAN_HEADERS_VERSION = 1.3.257
+VULKAN_HEADERS_VERSION = 1.3.262
 VULKAN_HEADERS_SITE = $(call github,KhronosGroup,Vulkan-Headers,v$(VULKAN_HEADERS_VERSION))
-VULKAN_HEADERS_LICENSE = Apache-2.0
-VULKAN_HEADERS_LICENSE_FILES = LICENSE.txt
+VULKAN_HEADERS_LICENSE = Apache-2.0, MIT
+VULKAN_HEADERS_LICENSE_FILES = LICENSE.md
 VULKAN_HEADERS_INSTALL_STAGING = YES
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
