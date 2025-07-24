Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737E4C83F26
	for <buildroot@archiver.kernel.org>; Thu, 24 Jul 2025 19:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F3EA41B33;
	Thu, 24 Jul 2025 19:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Chym0YcajyQM; Thu, 24 Jul 2025 19:30:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ECB241AB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ECB241AB9;
	Thu, 24 Jul 2025 19:30:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C67C4115
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8CDD40530
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-b9sDHAFvpt for <buildroot@buildroot.org>;
 Thu, 24 Jul 2025 19:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 254DA404E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 254DA404E4
 for <buildroot@buildroot.org>; Thu, 24 Jul 2025 19:30:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15D6186ABF; Thu, 24 Jul 2025 19:30:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Jul 2025 21:27:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fdf9173555a5eccb95e2f8988b1c21eccc371916
X-Git-Newrev: f4a4b3a735e8913ad2407c8cfe8377ca982fb3ae
X-Patchwork-Hint: ignore
Message-Id: <20250724193036.15D6186ABF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencsd: bump to version 1.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4a4b3a735e8913ad2407c8cfe8377ca982fb3ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 1.5.6, see:
https://github.com/Linaro/OpenCSD/blob/v1.6.1/README.md?plain=1#L356

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opencsd/opencsd.hash | 2 +-
 package/opencsd/opencsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencsd/opencsd.hash b/package/opencsd/opencsd.hash
index d33f96af8a..52d07fefc4 100644
--- a/package/opencsd/opencsd.hash
+++ b/package/opencsd/opencsd.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  82f584572c4e3f1d8255be135768bea80b48c4fe731cb8c5877a7389dfd445a6  opencsd-1.5.6.tar.gz
+sha256  e940e7ddd4e3c723c8dbe614e0728e20cb19729d44bb55cdb016abd6ad221bfd  opencsd-1.6.1.tar.gz
 sha256  980eef4b0744e63834e3ec0d50c2a4ff6d81d7ec62dd8ba8c66acae0ec5a2e88  LICENSE
diff --git a/package/opencsd/opencsd.mk b/package/opencsd/opencsd.mk
index 2e8747df22..a7a24587ee 100644
--- a/package/opencsd/opencsd.mk
+++ b/package/opencsd/opencsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCSD_VERSION = 1.5.6
+OPENCSD_VERSION = 1.6.1
 OPENCSD_SITE = $(call github,Linaro,OpenCSD,v$(OPENCSD_VERSION))
 OPENCSD_LICENSE = BSD-3-Clause
 OPENCSD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
