Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46B9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 20:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5442F40114;
	Tue, 14 Dec 2021 20:13:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ytv6SXd-d26j; Tue, 14 Dec 2021 20:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54572405EA;
	Tue, 14 Dec 2021 20:13:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 328921BF30E
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE0D281453
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 20:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YDQMUUfkH6Ak for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 20:10:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08AC7813AA
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 20:10:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 04C3081EAD; Tue, 14 Dec 2021 20:05:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 20:56:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d61c35ac8c6dc5d4f94bcf68ef37c54d855ed0d
X-Git-Newrev: caa5a7ea073e71de3fa33a5cb8b6d46d69d4876c
X-Patchwork-Hint: ignore
Message-Id: <20211214200520.04C3081EAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcm2835: bump version to 1.71
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

commit: https://git.buildroot.net/buildroot/commit/?id=caa5a7ea073e71de3fa33a5cb8b6d46d69d4876c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bump version to 1.71
- change home page and download URL to https

Changelog (since 1.71):

 - 1.71, Added SMI bus support, courtesy of Benoit Bouchez, including new
   functions: bcm2835_smi_begin(), bcm2835_smi_end(), bcm2835_smi_set_timing(),
   bcm2835_smi_write(), bcm2835_smi_read().

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bcm2835/Config.in    | 2 +-
 package/bcm2835/bcm2835.hash | 2 +-
 package/bcm2835/bcm2835.mk   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/bcm2835/Config.in b/package/bcm2835/Config.in
index 4c3eb2cbfc..8c77a62a11 100644
--- a/package/bcm2835/Config.in
+++ b/package/bcm2835/Config.in
@@ -16,4 +16,4 @@ config BR2_PACKAGE_BCM2835
 	  the kernel drivers are doing, and potentially conflicting
 	  with them.
 
-	  http://www.airspayce.com/mikem/bcm2835
+	  https://www.airspayce.com/mikem/bcm2835
diff --git a/package/bcm2835/bcm2835.hash b/package/bcm2835/bcm2835.hash
index c9f7acfd01..2cdc35fcee 100644
--- a/package/bcm2835/bcm2835.hash
+++ b/package/bcm2835/bcm2835.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  c062a8a1cf1dc1ba1ca3978451d2f668b66f7ce5548200a0f4a8bb2117b1b2c9  bcm2835-1.70.tar.gz
+sha256  564920d205977d7e2846e434947708455d468d3a952feca9faef643abd03a227  bcm2835-1.71.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  COPYING
diff --git a/package/bcm2835/bcm2835.mk b/package/bcm2835/bcm2835.mk
index e9d7256f19..4870aa10ba 100644
--- a/package/bcm2835/bcm2835.mk
+++ b/package/bcm2835/bcm2835.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-BCM2835_VERSION = 1.70
-BCM2835_SITE = http://www.airspayce.com/mikem/bcm2835
+BCM2835_VERSION = 1.71
+BCM2835_SITE = https://www.airspayce.com/mikem/bcm2835
 BCM2835_LICENSE = GPL-3.0
 BCM2835_LICENSE_FILES = COPYING
 BCM2835_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
