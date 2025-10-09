Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12342CCD188
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 09:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBF75611CB;
	Thu,  9 Oct 2025 09:55:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z5DrF8kimojr; Thu,  9 Oct 2025 09:55:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD0B961233
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD0B961233;
	Thu,  9 Oct 2025 09:55:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 26381119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00D97611CA
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMVv8zirFmmR for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3516E611CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3516E611CB
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 336E886C3B; Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:41:16 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: e4ec6da23e8423d9b39bfa9e3909b5bf176dca30
X-Git-Newrev: 7c75c6fb9441548dad4231197d885092aa78e2e5
X-Patchwork-Hint: ignore
Message-Id: <20251009095540.336E886C3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/intel-microcode:
 security bump version to 20250812
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7c75c6fb9441548dad4231197d885092aa78e2e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Release notes:
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20250812

CVE-2025-20109:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01249.html

CVE-2025-22840:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01308.html

CVE-2025-22839:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01310.html

CVE-2025-22889:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01311.html

CVE-2025-20053:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01313.html

CVE-2025-26403:
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01367.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 0a748cddf68bace1ba91a80856aa7ff5f86b0673)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 9504f7a786..735b352d1f 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  041af7d2f5791a47c1e914abd7d6255de4d4fc61b0f8e49ada6ee7014bcc3614  intel-microcode-20250512.tar.gz
+sha256  a8358422c68cc4d15c26db1ef682fbce332c3f46c4e087a79c132c437ec5f407  intel-microcode-20250812.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 1fd09e6a6d..2850dd01e4 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20250512
+INTEL_MICROCODE_VERSION = 20250812
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
