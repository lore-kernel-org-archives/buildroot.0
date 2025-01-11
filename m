Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB1DC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 206CE4027E;
	Fri, 28 Feb 2025 16:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvXqlyeMjqzi; Fri, 28 Feb 2025 16:53:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E42B140234
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E42B140234;
	Fri, 28 Feb 2025 16:52:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11DE068
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B58D342F7B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yj1b9kZHshVe for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D3F742526
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D3F742526
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 797BD86612; Fri, 28 Feb 2025 16:30:01 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 12:43:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e8bedf18671a21bdc000a0cebf23c5cb83fe9b18
X-Git-Newrev: d5894b2dd670d828e517198f570dc7946209a042
X-Patchwork-Hint: ignore
Message-Id: <20250228163001.797BD86612@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/smartmontools: bump
 version to 7.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5894b2dd670d828e517198f570dc7946209a042
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://www.smartmontools.org/browser/tags/RELEASE_7_4/smartmontools/NEWS

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
[Julien: move sha1 hash in the upstream section]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/smartmontools/smartmontools.hash | 8 ++++----
 package/smartmontools/smartmontools.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/smartmontools/smartmontools.hash b/package/smartmontools/smartmontools.hash
index e48e955d01..b4e18f9002 100644
--- a/package/smartmontools/smartmontools.hash
+++ b/package/smartmontools/smartmontools.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.3/
-md5  7a71d388124e3cd43abf6586a43cb1ff  smartmontools-7.3.tar.gz
-sha1  5ce7adb606119148d725b91a00652d427ca0adc2  smartmontools-7.3.tar.gz
+# From http://sourceforge.net/projects/smartmontools/files/smartmontools/7.4/
+md5  178d31a6ff5256c093227ab45a3f52aa  smartmontools-7.4.tar.gz
+sha1  b0d7c9ca80768059607b92bf4e373e2822300d3f  smartmontools-7.4.tar.gz
 
 # Locally computed
-sha256  a544f8808d0c58cfb0e7424ca1841cb858a974922b035d505d4e4c248be3a22b  smartmontools-7.3.tar.gz
+sha256  e9a61f641ff96ca95319edfb17948cd297d0cd3342736b2c49c99d4716fb993d  smartmontools-7.4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/smartmontools/smartmontools.mk b/package/smartmontools/smartmontools.mk
index d24f008df4..18a1417681 100644
--- a/package/smartmontools/smartmontools.mk
+++ b/package/smartmontools/smartmontools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SMARTMONTOOLS_VERSION = 7.3
+SMARTMONTOOLS_VERSION = 7.4
 SMARTMONTOOLS_SITE = http://downloads.sourceforge.net/project/smartmontools/smartmontools/$(SMARTMONTOOLS_VERSION)
 SMARTMONTOOLS_LICENSE = GPL-2.0+
 SMARTMONTOOLS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
