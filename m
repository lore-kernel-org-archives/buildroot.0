Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61629CCA470
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 19:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3137C60AC8;
	Tue,  7 Oct 2025 19:56:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtqzdEyC88qY; Tue,  7 Oct 2025 19:56:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41A6260AD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41A6260AD0;
	Tue,  7 Oct 2025 19:56:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 70A7E9DA
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 566DD4059D
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yCiB_X-sV60Z for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 19:56:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3CC94058B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3CC94058B
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:56:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91E6386A6A; Tue,  7 Oct 2025 19:56:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Oct 2025 21:52:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e06a69fd2a4ffa95e75e27758b66b1e11cd5602
X-Git-Newrev: 63f1aa10151a5483fdf02d0a2f4837db35a58770
X-Patchwork-Hint: ignore
Message-Id: <20251007195633.91E6386A6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fping: bump to version 5.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=63f1aa10151a5483fdf02d0a2f4837db35a58770
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/schweikert/fping/releases/tag/v5.3
https://github.com/schweikert/fping/releases/tag/v5.4

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fping/fping.hash | 2 +-
 package/fping/fping.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fping/fping.hash b/package/fping/fping.hash
index 8b68798409..a1ef393517 100644
--- a/package/fping/fping.hash
+++ b/package/fping/fping.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a7692d10d73fb0bb76e1f7459aa7f19bbcdbfc5adbedef02f468974b18b0e42f  fping-5.2.tar.gz
+sha256  be320771f075e47dd7e5704b485e9bdc7dd11107884345c0f7c18749357f668d  fping-5.4.tar.gz
 
 # Hash for license file
 sha256  6051b27e4b4a648f7bc8b329024da53a6e95ce88fcf0ccc259c371a74b741757  COPYING
diff --git a/package/fping/fping.mk b/package/fping/fping.mk
index dc43261be8..e4b7b8f2c6 100644
--- a/package/fping/fping.mk
+++ b/package/fping/fping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FPING_VERSION = 5.2
+FPING_VERSION = 5.4
 FPING_SITE = http://fping.org/dist
 FPING_LICENSE = BSD-like
 FPING_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
