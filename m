Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483C6C001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 18:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C165E83EF3;
	Thu, 13 Jul 2023 18:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C165E83EF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 79DZ4lk9YPZU; Thu, 13 Jul 2023 18:13:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEFCC83EF7;
	Thu, 13 Jul 2023 18:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEFCC83EF7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8001C1BF387
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 18:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64F1A83C9D
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 18:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64F1A83C9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x5BzDfQsZUxd for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 18:13:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DC8A83C71
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 18:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DC8A83C71
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7984386F7F; Thu, 13 Jul 2023 18:13:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 19:45:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a91dbc5bcee6952a9481879ba70a6953f5810cd
X-Git-Newrev: d08e83f8f8ff9a4007f74e7cffefe05939d898d1
X-Patchwork-Hint: ignore
Message-Id: <20230713181301.7984386F7F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/edk2-platforms: bump in sync with
 edk2-stable202305
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
Content-Type: multipart/mixed; boundary="===============4855408755860532514=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4855408755860532514==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d08e83f8f8ff9a4007f74e7cffefe05939d898d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the edk2-platforms commit to the one corresponding to version
edk2-stable202305 of edk2, based on the timestamps.

Cc: Dick Olsson <hi@senzilla.io>
Cc: Vincent Stehlé <vincent.stehle@arm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/edk2-platforms/edk2-platforms.hash | 2 +-
 package/edk2-platforms/edk2-platforms.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/edk2-platforms/edk2-platforms.hash b/package/edk2-platforms/edk2-platforms.hash
index 405a09241c..ae88b672a6 100644
--- a/package/edk2-platforms/edk2-platforms.hash
+++ b/package/edk2-platforms/edk2-platforms.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1ed3f369a2743cc5a5fa4804d0af154e37b578f4e68c2e7f69734701a9b874db  edk2-platforms-3c3b1168017073c2bb2d97336c5929ebae805be1.tar.gz
+sha256  31257160ac51a4a5f63db92d26482d6a005286ed040dafe89d01f0ee906b111e  edk2-platforms-b71f2bda9e4fc183068eef5d1d90a631181a2506.tar.gz
 sha256  50ce20c9cfdb0e19ee34fe0a51fc0afe961f743697b068359ab2f862b494df80  License.txt
diff --git a/package/edk2-platforms/edk2-platforms.mk b/package/edk2-platforms/edk2-platforms.mk
index 20a058baff..9e8ff94156 100644
--- a/package/edk2-platforms/edk2-platforms.mk
+++ b/package/edk2-platforms/edk2-platforms.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with latest commit as of the release date for boot/edk2
-EDK2_PLATFORMS_VERSION = 3c3b1168017073c2bb2d97336c5929ebae805be1
+EDK2_PLATFORMS_VERSION = b71f2bda9e4fc183068eef5d1d90a631181a2506
 EDK2_PLATFORMS_SITE = $(call github,tianocore,edk2-platforms,$(EDK2_PLATFORMS_VERSION))
 EDK2_PLATFORMS_LICENSE = BSD-2-Clause-Patent
 EDK2_PLATFORMS_LICENSE_FILES = License.txt

--===============4855408755860532514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4855408755860532514==--
