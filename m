Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAF5C77B78
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 20:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83F52427AB;
	Thu,  4 May 2023 20:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83F52427AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QR7m5Y6Hq7L3; Thu,  4 May 2023 20:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 734334279F;
	Thu,  4 May 2023 20:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 734334279F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 873F31BF3B8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C18B8417B
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C18B8417B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GsGJbuJ4_sAA for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 20:22:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86D2184179
 for <buildroot@buildroot.org>; Thu,  4 May 2023 20:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86D2184179
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7447885D74; Thu,  4 May 2023 20:22:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 May 2023 22:21:55 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: dcd6af7e25cba41d791dcabf8daef3be1eac3d18
X-Git-Newrev: 8e117464920f2aa2ab7bfc288934c6af4e3504bb
X-Patchwork-Hint: ignore
Message-Id: <20230504202213.7447885D74@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] Update for 2022.02.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e117464920f2aa2ab7bfc288934c6af4e3504bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES                  | 12 ++++++++++++
 Makefile                 |  4 ++--
 support/misc/Vagrantfile |  2 +-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index ee4ee1ff3f..9f26fe240d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,15 @@
+2022.02.12, released May 5th, 2023
+
+	Important / security related fixes.
+
+	Updated/fixed packages: agentpp, apache, ca-certificates,
+	containerd, coremark, dcron, eudev, ffmpeg, git,
+	intel-microcode, kexec, lcdproc, libmicrohttpd, libosmium,
+	libxml2, linux-tools, matio, osm2pgsql, poppler, postgresql,
+	protozero, python-web2py, runc, s390-tools, samba4, snmppp,
+	sudo, tcpdump, uclibc, vim, webkitgtk, wpewebkit,
+	xserver_xorg-server
+
 2022.02.11, released March 19th, 2023
 
 	Important / security related fixes.
diff --git a/Makefile b/Makefile
index 7ce00cab0a..b4a11d7dfa 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2022.02.11
+export BR2_VERSION := 2022.02.12
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1679221000
+BR2_VERSION_EPOCH = 1683230000
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index bb3e6be4f3..daa18ed456 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Buildroot version to use
-RELEASE='2022.02.11'
+RELEASE='2022.02.12'
 
 ### Change here for more memory/cores ###
 VM_MEMORY=2048
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
