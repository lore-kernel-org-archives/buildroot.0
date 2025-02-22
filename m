Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635DDC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8453785EFC;
	Fri, 28 Feb 2025 17:22:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i8PRgqxk45j4; Fri, 28 Feb 2025 17:22:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8800885EF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8800885EF2;
	Fri, 28 Feb 2025 17:22:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 045CD68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C751047203
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdtbSGDeDA3a for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBEA2475AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBEA2475AA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E02E18017D; Fri, 28 Feb 2025 16:30:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 15:17:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1bcd3d6bc5e07b75acea0ae2ae554725e2fcc3e3
X-Git-Newrev: dae4b38ae43b94867b32df6f23b0b814ff47cc0f
X-Patchwork-Hint: ignore
Message-Id: <20250228163045.E02E18017D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libzenoh-pico: bump to
 version 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=dae4b38ae43b94867b32df6f23b0b814ff47cc0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://github.com/eclipse-zenoh/zenoh-pico/releases/tag/1.2.1

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libzenoh-pico/libzenoh-pico.hash | 2 +-
 package/libzenoh-pico/libzenoh-pico.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libzenoh-pico/libzenoh-pico.hash b/package/libzenoh-pico/libzenoh-pico.hash
index 5bf924987a..3e0344cdaf 100644
--- a/package/libzenoh-pico/libzenoh-pico.hash
+++ b/package/libzenoh-pico/libzenoh-pico.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4033d3867a8e94e587355639de2ad9045c0a1ed0409c7901a93dbd2cf2d9308b  libzenoh-pico-1.1.0.tar.gz
+sha256  822aaeafa47405c21b7935a1428b2ac796177ea35ac6b59580481c357edd2b78  libzenoh-pico-1.2.1.tar.gz
 sha256  d386df32cf327bbb25abe894277d3d7e0f447bafc59f4ad362615b0136f30db5  LICENSE
diff --git a/package/libzenoh-pico/libzenoh-pico.mk b/package/libzenoh-pico/libzenoh-pico.mk
index e243ec64fe..6e05ae340c 100644
--- a/package/libzenoh-pico/libzenoh-pico.mk
+++ b/package/libzenoh-pico/libzenoh-pico.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBZENOH_PICO_VERSION = 1.1.0
+LIBZENOH_PICO_VERSION = 1.2.1
 LIBZENOH_PICO_SITE = $(call github,eclipse-zenoh,zenoh-pico,$(LIBZENOH_PICO_VERSION))
 LIBZENOH_PICO_LICENSE = Apache-2.0 or EPL-2.0
 LIBZENOH_PICO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
