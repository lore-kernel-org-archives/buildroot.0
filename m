Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C78C369D5
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 15:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECF2D4088E;
	Mon, 21 Apr 2025 15:36:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZHDYaFxF_8EH; Mon, 21 Apr 2025 15:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04B4E4062E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04B4E4062E;
	Mon, 21 Apr 2025 15:36:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B8E668
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 15:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B19B60AF1
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 15:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gEoX50nM3fHc for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 15:36:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84FD460AEA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84FD460AEA
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 15:36:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 746EA85FA6; Mon, 21 Apr 2025 15:36:10 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 21 Apr 2025 16:25:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae4bf5a4fedf9b2283719cf024c5f70f76e32684
X-Git-Newrev: c6db02cff4f13dc74669a7cd17fc48a14d94e4ed
X-Patchwork-Hint: ignore
Message-Id: <20250421153610.746EA85FA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenmpt: bump to version 0.7.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6db02cff4f13dc74669a7cd17fc48a14d94e4ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note since 0.7.11, see:
https://lib.openmpt.org/libopenmpt/2024/12/01/releases-0.7.12-0.6.21-0.5.35-0.4.47/
https://lib.openmpt.org/libopenmpt/2025/01/06/releases-0.7.13-0.6.22-0.5.36-0.4.48/

License file hash changed after year update:
https://github.com/OpenMPT/openmpt/commit/97f0c59cda82ff92d905fb1af8d55a89997a6a8b

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libopenmpt/libopenmpt.hash | 4 ++--
 package/libopenmpt/libopenmpt.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenmpt/libopenmpt.hash b/package/libopenmpt/libopenmpt.hash
index 0289393024..f23956536d 100644
--- a/package/libopenmpt/libopenmpt.hash
+++ b/package/libopenmpt/libopenmpt.hash
@@ -1,3 +1,3 @@
 # computed locally
-sha256  53a798b8c6e2e1f695e8ad05e93a0c1b53199e5aa9981837c41696b370520767  libopenmpt-0.7.11+release.autotools.tar.gz
-sha256  e3d7e76c6b441ddd9fff0a397e7b5e055a11678bd7c3b246a0ce13e352eb15e8  LICENSE
+sha256  dcd7cde4f9c498eb496c4556e1c1b81353e2a74747e8270a42565117ea42e1f1  libopenmpt-0.7.13+release.autotools.tar.gz
+sha256  d173856a870d3f6d0603060c615f5e3b145d79a008576e8efd2e5eab8b843430  LICENSE
diff --git a/package/libopenmpt/libopenmpt.mk b/package/libopenmpt/libopenmpt.mk
index 57c45c6ea1..e8c4ace2db 100644
--- a/package/libopenmpt/libopenmpt.mk
+++ b/package/libopenmpt/libopenmpt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENMPT_VERSION = 0.7.11
+LIBOPENMPT_VERSION = 0.7.13
 LIBOPENMPT_SITE = https://lib.openmpt.org/files/libopenmpt/src
 LIBOPENMPT_SOURCE = libopenmpt-$(LIBOPENMPT_VERSION)+release.autotools.tar.gz
 LIBOPENMPT_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
