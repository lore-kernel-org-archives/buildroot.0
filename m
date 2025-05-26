Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB50C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 08:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 290D4829DB;
	Thu, 12 Jun 2025 08:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id psCKIZnohwNM; Thu, 12 Jun 2025 08:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5020F81F65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5020F81F65;
	Thu, 12 Jun 2025 08:39:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FF4C1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B7F34208B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IcuATZxVBVEq for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 08:38:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF4E6420FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF4E6420FB
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 08:38:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC8E18106F; Thu, 12 Jun 2025 08:38:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 May 2025 21:30:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2f7bcc7dfc521772a395aba084eba31e6622e94d
X-Git-Newrev: cf8cd11846c475e3c7ced83cbceb40a580ba14e2
X-Patchwork-Hint: ignore
Message-Id: <20250612083829.BC8E18106F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/esp-hosted: bump to version
 1.0.4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf8cd11846c475e3c7ced83cbceb40a580ba14e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Esp-hosted project released a new tarball after almost 3 years where they
only committed patches to git repository. They also defined a template for
releases[1]

Release notes:
https://github.com/espressif/esp-hosted/releases/tag/release%2Fng-v1.0.4.0.0

[1]: https://github.com/espressif/esp-hosted/commit/ced8383c2b8d44b0d15e04dbb424d5a51e7f468c#diff-2e8cb17d6e84161bc5a232fbdf4c0b8893c4330f185c66c564e33ced6ffc864f

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/esp-hosted/esp-hosted.hash | 2 +-
 package/esp-hosted/esp-hosted.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
index 8de3c00190..8b0b3e5f90 100644
--- a/package/esp-hosted/esp-hosted.hash
+++ b/package/esp-hosted/esp-hosted.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  66c07e2f69d8a10fb111b6df27fbe3558734d660207a54391c46eea3e12b29ee  esp-hosted-9a2312b0b2630e41bacb3091faaba489cb43b0ab.tar.gz
+sha256  1025b8c8d982bab03ebec9859f828a1c81218077245b602621eb4f07c169bac8  ng-v1.0.4.0.0.tar.gz
 sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index 4c249eec46..0d9dacbd6a 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-ESP_HOSTED_VERSION = 9a2312b0b2630e41bacb3091faaba489cb43b0ab
-ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
+ESP_HOSTED_VERSION = 1.0.4.0.0
+ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,release/ng-v$(ESP_HOSTED_VERSION))
+ESP_HOSTED_SOURCE = ng-v$(ESP_HOSTED_VERSION).tar.gz
 ESP_HOSTED_DEPENDENCIES = linux
 ESP_HOSTED_LICENSE = GPL-2.0
 ESP_HOSTED_LICENSE_FILE = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
