Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53878D3B990
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ABB84DB65;
	Tue, 26 Nov 2024 13:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hw6lU-pqu3on; Tue, 26 Nov 2024 13:27:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA5434D462
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA5434D462;
	Tue, 26 Nov 2024 13:27:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 743E04E94
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B93C2408A8
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sjFbCVOgkU0 for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:26:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F153405A5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F153405A5
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BF3C8663E; Tue, 26 Nov 2024 13:26:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 14:23:04 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 48e79150bac997a7f7dbfd90be16a9cbb46d6775
X-Git-Newrev: 0b26c8012ee1fd8fa702593d9ff7308eb9c63a3e
X-Patchwork-Hint: ignore
Message-Id: <20241126132639.0BF3C8663E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/intel-microcode:
 security bump version to 20241112
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b26c8012ee1fd8fa702593d9ff7308eb9c63a3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Release notes:
https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases

CVE-2024-21853
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01101.html

CVE-2024-23918
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01079.html

CVE-2024-24968
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01097.html

CVE-2024-23984
https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01103.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 649b31fc6d29d4fc5788ab13e32d704de63b2a0c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-microcode/intel-microcode.hash | 2 +-
 package/intel-microcode/intel-microcode.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
index 20dfaa41b4..81a4573110 100644
--- a/package/intel-microcode/intel-microcode.hash
+++ b/package/intel-microcode/intel-microcode.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8b7582eac7e9a691356e18b3bdcbc7b2db09494e040ec980a4a5fb6d0da261bf  intel-microcode-20240910.tar.gz
+sha256  37246208ef68039be752438c72400a688a2238df13a7f5282497c80be2d8366d  intel-microcode-20241112.tar.gz
 sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
index 24729494d0..17f25edc83 100644
--- a/package/intel-microcode/intel-microcode.mk
+++ b/package/intel-microcode/intel-microcode.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MICROCODE_VERSION = 20240910
+INTEL_MICROCODE_VERSION = 20241112
 INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
 INTEL_MICROCODE_LICENSE = PROPRIETARY
 INTEL_MICROCODE_LICENSE_FILES = license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
