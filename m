Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8CFC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 06:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96B3E40647;
	Sat, 13 Jul 2024 06:35:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PKsONutNQkuh; Sat, 13 Jul 2024 06:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73010406E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73010406E6;
	Sat, 13 Jul 2024 06:35:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D040B1BF5A2
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 06:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE34C84632
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 06:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFBZadPfQNsx for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 06:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 061D68460A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 061D68460A
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 06:35:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E410480284; Sat, 13 Jul 2024 06:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 08:33:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22579ce771bde65dffa8cef22c3e8bb4973ef9ab
X-Git-Newrev: 709cc0f0001d7cc3977bddfee6ca0e6bab1e567b
X-Patchwork-Hint: ignore
Message-Id: <20240713063529.E410480284@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: bump version to
 2024-07-12
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

commit: https://git.buildroot.net/buildroot/commit/?id=709cc0f0001d7cc3977bddfee6ca0e6bab1e567b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/esp-hosted/esp-hosted.hash | 2 +-
 package/esp-hosted/esp-hosted.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index 3afee5aef4..ea18c243d1 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2c87d68c2b74dd000b128696abc0cdc76d22abfefb6581ff61b7d7bcdaab51f5  esp-hosted-b1422afc4fe0a2ea1ffd6b5459edddc4d968ee71.tar.gz
+sha256  78ab4f10ddce76749d36511591a0a7bb2a982db96ac1ea1b02b5c35dab725d8c  esp-hosted-91b093365cc58214532b976dd8749f65523d1e6d.tar.gz
 sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 70ca7bf572..4efefc3023 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = b1422afc4fe0a2ea1ffd6b5459edddc4d968ee71
+ESP_HOSTED_VERSION = 91b093365cc58214532b976dd8749f65523d1e6d
 ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
