Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0470DC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6255342F16;
	Fri, 28 Feb 2025 16:43:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSB22qyUekSE; Fri, 28 Feb 2025 16:43:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32CB54073C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32CB54073C;
	Fri, 28 Feb 2025 16:43:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1966768
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BECE426B7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMhs-Qm4_sZE for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D85EE419B4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D85EE419B4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2A277FD48; Fri, 28 Feb 2025 16:29:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 19:11:09 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 621ebccf3f1ca70443160103ae12ab3ea89f63bd
X-Git-Newrev: a64eb43cc5dec2bf4a383d371ff1b251f48992ad
X-Patchwork-Hint: ignore
Message-Id: <20250228162945.D2A277FD48@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dt-utils: bump to
 2023.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a64eb43cc5dec2bf4a383d371ff1b251f48992ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For change log, see:
https://git.pengutronix.de/cgit/tools/dt-utils/tree/NEWS?h=v2023.11.0#n4

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dt-utils/dt-utils.hash | 2 +-
 package/dt-utils/dt-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dt-utils/dt-utils.hash b/package/dt-utils/dt-utils.hash
index c57145b835..af964606fe 100644
--- a/package/dt-utils/dt-utils.hash
+++ b/package/dt-utils/dt-utils.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  a6988b889418737324ed3db3785d3a9692e802c1dff4a2323c962008b7b646b1  dt-utils-2023.08.0.tar.xz
+sha256  5a1ace759b37c4b5138738ae0fa03574b1f55da01a0faa88aaff0417d275cc0e  dt-utils-2023.11.0.tar.xz
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
 sha256  2c9d733cadb50e33cc83f05f1fe7cc4b6c5ff7260fd9eea1b839151c7fa64742  LICENSES/GPL-2.0-only.txt
 sha256  d6e37cb7eff6ef15ae3c4082cf40eae80a94cd59b636991d1149d4a5c9dc3537  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
index 198b36d5fe..7b197c585a 100644
--- a/package/dt-utils/dt-utils.mk
+++ b/package/dt-utils/dt-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DT_UTILS_VERSION = 2023.08.0
+DT_UTILS_VERSION = 2023.11.0
 DT_UTILS_SOURCE = dt-utils-$(DT_UTILS_VERSION).tar.xz
 DT_UTILS_SITE = https://git.pengutronix.de/cgit/tools/dt-utils/snapshot
 DT_UTILS_LICENSE = CC0-1.0, GPL-2.0, GPL-2.0+, Zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
