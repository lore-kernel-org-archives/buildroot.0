Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E3ECAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 19:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A13E83E3F;
	Wed,  1 Oct 2025 19:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6t0nb7yNlhl3; Wed,  1 Oct 2025 19:20:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 437C083E29
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 437C083E29;
	Wed,  1 Oct 2025 19:20:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF1E872
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C08D983E29
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FydCZHHdyQOR for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 19:20:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0C7C83E2B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0C7C83E2B
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 19:20:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF821866E5; Wed,  1 Oct 2025 19:20:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Oct 2025 21:12:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdb1407c0c6a9a7697e61419431cd4f1ccce08b8
X-Git-Newrev: 06ca694d72bf7a490785fba28c1717aa302cc38b
X-Patchwork-Hint: ignore
Message-Id: <20251001192016.DF821866E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/faad2: bump to version 2.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=06ca694d72bf7a490785fba28c1717aa302cc38b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/knik0/faad2/blob/2.11.2/ChangeLog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/faad2/faad2.hash | 2 +-
 package/faad2/faad2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
index b7813130fd..6a641dc10f 100644
--- a/package/faad2/faad2.hash
+++ b/package/faad2/faad2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  72dbc0494de9ee38d240f670eccf2b10ef715fd0508c305532ca3def3225bb06  faad2-2.11.1.tar.gz
+sha256  3fcbd305e4abd34768c62050e18ca0986f7d9c5eca343fb98275418013065c0e  faad2-2.11.2.tar.gz
 sha256  d3baf3a54943cf12a994c85867a18dec84f810901b2f2878ddfd77efcc3c150f  COPYING
diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
index 0b249b3450..62c469e3ef 100644
--- a/package/faad2/faad2.mk
+++ b/package/faad2/faad2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FAAD2_VERSION = 2.11.1
+FAAD2_VERSION = 2.11.2
 FAAD2_SITE = $(call github,knik0,faad2,$(FAAD2_VERSION))
 FAAD2_LICENSE = GPL-2.0
 FAAD2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
