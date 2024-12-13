Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1587EE7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 13:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6FD960814;
	Fri, 13 Dec 2024 13:45:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0KBIM_xRh6Su; Fri, 13 Dec 2024 13:45:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0C3C60749
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0C3C60749;
	Fri, 13 Dec 2024 13:45:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EEA281146
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 13:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2BF6841A8
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 13:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsLcCrMGljsm for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 13:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D351B8447B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D351B8447B
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 13:45:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDFA886EF9; Fri, 13 Dec 2024 13:45:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 14:44:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73f03390643c1a3d36f8e5e87a236df917526987
X-Git-Newrev: af8d12953cb41a0b66395488562dc249c6c96b00
X-Patchwork-Hint: ignore
Message-Id: <20241213134529.BDFA886EF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinycompress: bump to version
 1.2.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=af8d12953cb41a0b66395488562dc249c6c96b00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For commit log, see:
https://github.com/alsa-project/tinycompress/commits/v1.2.13/

This commit also adds in the hash file a commit with the pgp signature
source and key id used for the verification.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinycompress/tinycompress.hash | 4 +++-
 package/tinycompress/tinycompress.mk   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/tinycompress/tinycompress.hash b/package/tinycompress/tinycompress.hash
index f86b75f346..1a2b2c0203 100644
--- a/package/tinycompress/tinycompress.hash
+++ b/package/tinycompress/tinycompress.hash
@@ -1,5 +1,7 @@
 # Locally calculated after checking pgp signature
-sha256  ebbe788c28328e7cca245aaf9194a5ad0dc91e9e0dc883c2cf9feb6d42c9f3fc  tinycompress-1.2.11.tar.bz2
+# from https://www.alsa-project.org/files/pub/tinycompress/tinycompress-1.2.13.tar.bz2.sig
+# with key F04DF50737AC1A884C4B3D718380596DA6E59C91
+sha256  0efe6cbd7bff31983e0d416df0436767665cc4cd70d278c06ce0e83e0eeab5db  tinycompress-1.2.13.tar.bz2
 
 # Locally calculated
 sha256  912ea37a4435594a3b3c35f04efa4b5b7af2e68a05f5319c16c881711a31e4b7  COPYING
diff --git a/package/tinycompress/tinycompress.mk b/package/tinycompress/tinycompress.mk
index fabd5884b2..b5764ea293 100644
--- a/package/tinycompress/tinycompress.mk
+++ b/package/tinycompress/tinycompress.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCOMPRESS_VERSION = 1.2.11
+TINYCOMPRESS_VERSION = 1.2.13
 TINYCOMPRESS_SOURCE = tinycompress-$(TINYCOMPRESS_VERSION).tar.bz2
 TINYCOMPRESS_SITE = https://www.alsa-project.org/files/pub/tinycompress
 TINYCOMPRESS_LICENSE = BSD-3-Clause and LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
