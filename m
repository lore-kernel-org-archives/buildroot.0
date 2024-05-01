Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BBBC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A01D41719;
	Wed,  1 May 2024 20:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-QJJFfFRaTj; Wed,  1 May 2024 20:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6255241836
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6255241836;
	Wed,  1 May 2024 20:46:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F17B1BF400
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AA0A401D8
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:46:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-eYX26U_1MM for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:46:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53C6740165
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53C6740165
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:46:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4133686482; Wed,  1 May 2024 20:46:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 22:06:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2aa3a23bbe755ef73af7dfbb65dd8ec60c8c1865
X-Git-Newrev: 17a04da7d4fdfe44547e9b50a62c2f4af49e9ae8
X-Patchwork-Hint: ignore
Message-Id: <20240501204617.4133686482@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwts: bump to version 24.03.00
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

commit: https://git.buildroot.net/buildroot/commit/?id=17a04da7d4fdfe44547e9b50a62c2f4af49e9ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since version 23.07.00, see:
https://wiki.ubuntu.com/FirmwareTestSuite/ReleaseNotes/24.03.00
https://wiki.ubuntu.com/FirmwareTestSuite/ReleaseNotes/24.01.00
https://wiki.ubuntu.com/FirmwareTestSuite/ReleaseNotes/23.11.00

License file hash changed, due to year update in:
https://github.com/fwts/fwts/commit/cb2014e17f3fab0b2a2921e59e6b7acaa089cffe

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fwts/fwts.hash | 4 ++--
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 8525d47ecb..0c0dd58c15 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
-sha256  a15e11c42856e9dfcf7ac23ed370618d2777eb996dd7843accf12d45b21b551c  fwts-V23.07.00.tar.gz
+sha256  d7f2642b1ec3697be798409decd6593d52bb1438f0d2dc697cbc85f52d19b41e  fwts-V24.03.00.tar.gz
 
 # Hash for license file
-sha256  b9e44b1f9f65178e037a59a31b051b51dbd6a531d27c8775d3438a6ce53fc874  debian/copyright
+sha256  3cd2c5d12f024ff2aa203e37d7e972c4d5ab7bf1a65e3e09aebccf71e64b525b  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index a3f91ee495..0692121421 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 23.07.00
+FWTS_VERSION = 24.03.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = https://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
