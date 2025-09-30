Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4B1CCA470
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 19:45:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D7E440E96;
	Tue, 30 Sep 2025 19:45:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVfq3u0lW0Ap; Tue, 30 Sep 2025 19:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3528E40E93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3528E40E93;
	Tue, 30 Sep 2025 19:45:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39D74111
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37392823A7
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cty8XfAdfk3s for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 19:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7427280ECC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7427280ECC
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:45:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63D848660F; Tue, 30 Sep 2025 19:45:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 21:38:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97ecafec8989c99f83a35d4b5bd0fadb91a6a394
X-Git-Newrev: 03d413ee883f2415e2674bcc7219b3fd7586aff6
X-Patchwork-Hint: ignore
Message-Id: <20250930194523.63D848660F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/evtest: bump version to 1.36
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=03d413ee883f2415e2674bcc7219b3fd7586aff6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://gitlab.freedesktop.org/libevdev/evtest/-/releases/evtest-1.36

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/evtest/evtest.hash | 2 +-
 package/evtest/evtest.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/evtest/evtest.hash b/package/evtest/evtest.hash
index 0ed51df4e4..f5aa5ca525 100644
--- a/package/evtest/evtest.hash
+++ b/package/evtest/evtest.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  06dfe6b9760b78f3f73aca2120cbcb79339b33e59d5c79a49b4bd5d34844b054  evtest-evtest-1.35.tar.gz
+sha256  3b9a66c92e48b0cd13b689530b5729c031bc1bcbfe9d19c258f9245e2f8d2a0f  evtest-evtest-1.36.tar.gz
 
 # License files
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index 65897a41e6..0249bd88cc 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EVTEST_VERSION = 1.35
+EVTEST_VERSION = 1.36
 EVTEST_SOURCE = evtest-evtest-$(EVTEST_VERSION).tar.gz
 EVTEST_SITE = https://gitlab.freedesktop.org/libevdev/evtest/-/archive/evtest-$(EVTEST_VERSION)
 EVTEST_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
