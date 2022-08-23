Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7880C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3377740992;
	Tue, 23 Aug 2022 19:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3377740992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQOS2-Kx6aC0; Tue, 23 Aug 2022 19:44:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5A3A408BC;
	Tue, 23 Aug 2022 19:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5A3A408BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 136A61BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EECF3817E4
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EECF3817E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GQIUS8G02i8g for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:44:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49213813F6
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49213813F6
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1E5C987B5D; Tue, 23 Aug 2022 19:29:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 21:44:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 85a3bfc4ca93252517337ed82ae7370372ec5e34
X-Git-Newrev: 2e3ef50648f3356a0e8e06182be1e482a3ec2a53
X-Patchwork-Hint: ignore
Message-Id: <20220823192956.1E5C987B5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/uuu: bump to version
 1.4.240
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

commit: https://git.buildroot.net/buildroot/commit/?id=2e3ef50648f3356a0e8e06182be1e482a3ec2a53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uuu/uuu.hash | 2 +-
 package/uuu/uuu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/uuu.hash b/package/uuu/uuu.hash
index 7291f93c52..9396926781 100644
--- a/package/uuu/uuu.hash
+++ b/package/uuu/uuu.hash
@@ -1,4 +1,4 @@
 # locally computed
-sha256  b8b7fcd0e8eca64a255bf2b964bfb39a97599670e5258858421b27ff86aac80f  uuu_source-1.4.224.tar.gz
+sha256  2a1971438f70f77fae0578fb59b831d1e6de38f8c63f0f26e516248d9451a057  uuu_source-1.4.240.tar.gz
 sha256  cc8d47f7b9260f6669ecd41c24554c552f17581d81ee8fc602c6d23edb8bf495  LICENSE
 sha256  52b1828ddb508a180cf9ad159b61e655c72dfb25ffce67eb0aef761d38a4398f  README.md
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 647254446f..0cd4427697 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UUU_VERSION = 1.4.224
+UUU_VERSION = 1.4.240
 UUU_SOURCE = uuu_source-$(UUU_VERSION).tar.gz
 UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
