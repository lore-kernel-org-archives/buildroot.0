Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90955C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 19:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6279C80BE4;
	Wed,  1 May 2024 19:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ch1ZxlH0bI7u; Wed,  1 May 2024 19:24:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D640820E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D640820E6;
	Wed,  1 May 2024 19:24:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44E8A1BF2C9
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F77C4083B
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 19:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btXwnwB3A8TW for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 19:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B08E402CE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B08E402CE
 for <buildroot@buildroot.org>; Wed,  1 May 2024 19:24:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26623863F9; Wed,  1 May 2024 19:24:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 21:21:01 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2ab350b279742e802efae973c55f7e485bd1c841
X-Git-Newrev: 6f5451096b523ffc331696393d057b095252266c
X-Patchwork-Hint: ignore
Message-Id: <20240501192442.26623863F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/freeipmi: bump to
 version 1.6.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f5451096b523ffc331696393d057b095252266c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

https://lists.gnu.org/archive/html/freeipmi-announce/2024-01/msg00001.html
https://lists.gnu.org/archive/html/freeipmi-announce/2024-01/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 38db0df41a8989226a7170f8998982a1173c6b58)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freeipmi/freeipmi.hash | 2 +-
 package/freeipmi/freeipmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freeipmi/freeipmi.hash b/package/freeipmi/freeipmi.hash
index ac24b7c64e..2f81d90c1d 100644
--- a/package/freeipmi/freeipmi.hash
+++ b/package/freeipmi/freeipmi.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  65fbd6910fc010457748695414f27c5755b4e8d75734221221f3858c6230a897  freeipmi-1.6.11.tar.gz
+sha256  1a3dac5c76b7ccc4d4f86aa12b8ef9b212baef7489bf05e899b89abb7e14edb5  freeipmi-1.6.14.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.bmc-watchdog
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING.ipmiconsole
diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index ecff6f9925..e28f63f715 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREEIPMI_VERSION = 1.6.11
+FREEIPMI_VERSION = 1.6.14
 FREEIPMI_SITE = https://ftp.gnu.org/gnu/freeipmi
 FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
 FREEIPMI_LICENSE_FILES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
