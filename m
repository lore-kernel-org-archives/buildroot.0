Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23EACD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 19:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7A4741844;
	Wed,  3 Apr 2024 19:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0AvcqMnwLB-e; Wed,  3 Apr 2024 19:51:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68C26417FF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68C26417FF;
	Wed,  3 Apr 2024 19:51:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 750651BF983
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6113E6073E
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 19:51:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id al_kIJgKYoLI for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 19:51:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 855EE60730
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 855EE60730
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 19:51:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38F96846CB; Wed,  3 Apr 2024 19:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Apr 2024 21:45:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d295c20ae5ee42a2f62f8b94b5fcc20cb9c117bb
X-Git-Newrev: 38db0df41a8989226a7170f8998982a1173c6b58
X-Patchwork-Hint: ignore
Message-Id: <20240403195106.38F96846CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeipmi: bump to version 1.6.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=38db0df41a8989226a7170f8998982a1173c6b58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.gnu.org/archive/html/freeipmi-announce/2024-01/msg00001.html
https://lists.gnu.org/archive/html/freeipmi-announce/2024-01/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
