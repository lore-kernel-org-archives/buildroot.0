Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3E9C77B7E
	for <buildroot@archiver.kernel.org>; Tue,  2 May 2023 09:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F4280C3C;
	Tue,  2 May 2023 09:33:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F4280C3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sri1ueiSCAqJ; Tue,  2 May 2023 09:33:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DAB580C60;
	Tue,  2 May 2023 09:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DAB580C60
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCB3C1BF36B
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 09:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3BDE404FE
 for <buildroot@lists.busybox.net>; Tue,  2 May 2023 09:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3BDE404FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h504CkftCuCa for <buildroot@lists.busybox.net>;
 Tue,  2 May 2023 09:33:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6B3A4168A
 for <buildroot@buildroot.org>; Tue,  2 May 2023 09:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6B3A4168A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6B3185482; Tue,  2 May 2023 09:33:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 2 May 2023 11:31:49 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1bd059e7075c2cf1a34da510675a1a9a9c14b522
X-Git-Newrev: d028c97177fcd58d5a692501b9f58e3e0a962be4
X-Patchwork-Hint: ignore
Message-Id: <20230502093330.C6B3185482@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/intel-microcode:
 security bump version to 20230214
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

commit: https://git.buildroot.net/buildroot/commit/?id=d028c97177fcd58d5a692501b9f58e3e0a962be4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Release notes:
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/blob/main/releasenote.md

CVE-2022-21216
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00700.html

CVE-2022-33196
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00738.html

CVE-2022-38090
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-00767.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f32673ff8defabd50ec6f59fdb77152161d6afc3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 56f0237277..acec71000f 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8d14a914815f56c27b1f41be0fd699d1afcfdbc05432056427e455100798975e  intel-microcode-20221108.tar.gz
+sha256  3a3cfe2c7642339af9f4c2ad69f5f367dfa4cd1f7f9fd4124dedefb7803591d4  intel-microcode-20230214.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 787537da78..6e7d66f482 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20221108
+INTEL_MICROCODE_VERSION = 20230214
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
