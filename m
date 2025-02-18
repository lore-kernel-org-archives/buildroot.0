Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5E1C021AD
	for <buildroot@archiver.kernel.org>; Tue, 18 Feb 2025 19:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE1E281279;
	Tue, 18 Feb 2025 19:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgPy8xNq-Rf1; Tue, 18 Feb 2025 19:33:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E94BC81272
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E94BC81272;
	Tue, 18 Feb 2025 19:33:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D49CDE05
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 19:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCF1A4059F
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 19:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Tsci2BwmNw4 for <buildroot@buildroot.org>;
 Tue, 18 Feb 2025 19:33:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B29564032B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B29564032B
 for <buildroot@buildroot.org>; Tue, 18 Feb 2025 19:33:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A05248780B; Tue, 18 Feb 2025 19:33:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 18 Feb 2025 13:10:16 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: be469ec0cc06cae4cdd76e7c5813f15604b6502a
X-Git-Newrev: 3e1679f5b636b2025123154e5add68ac6e0fea83
X-Patchwork-Hint: ignore
Message-Id: <20250218193317.A05248780B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/intel-microcode:
 security bump version to 20250211
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e1679f5b636b2025123154e5add68ac6e0fea83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Release notes:
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20250211

CVE-2024-31068:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01166.html

CVE-2024-36293
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01213.html

CVE-2023-43758, CVE-2023-34440, CVE-2024-24582, CVE-2024-29214,
CVE-2024-28127, CVE-2024-39279, CVE-2024-31157 & CVE-2024-28047:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01139.html

CVE-2024-39355:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01228.html

CVE-2024-37020:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01194.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 67a0f96b88a23976c7dbf7e64ffb2cebadd8ec6f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 81a4573110..9721a15976 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  37246208ef68039be752438c72400a688a2238df13a7f5282497c80be2d8366d  intel-microcode-20241112.tar.gz
+sha256  1da88b51953c9da2e20b5c94b3d7270cf87ea5babcaa56e3d6a5c9eaf11694b3  intel-microcode-20250211.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 17f25edc83..db3e690ec7 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20241112
+INTEL_MICROCODE_VERSION = 20250211
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
