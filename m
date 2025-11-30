Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86366CFD376
	for <buildroot@archiver.kernel.org>; Sun, 30 Nov 2025 10:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38E4A40905;
	Sun, 30 Nov 2025 10:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ErNx9XACCqA2; Sun, 30 Nov 2025 10:25:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CD8B408D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CD8B408D5;
	Sun, 30 Nov 2025 10:25:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CC081A9
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 10:25:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49A066075B
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 10:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qrPAnu-TgXr for <buildroot@buildroot.org>;
 Sun, 30 Nov 2025 10:25:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 883D06072E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 883D06072E
 for <buildroot@buildroot.org>; Sun, 30 Nov 2025 10:25:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 77FAF861CB; Sun, 30 Nov 2025 10:25:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Nov 2025 11:18:17 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2feaeed29e0ed0f522898a5943d977e18bfa6b53
X-Git-Newrev: 333a6739de3df10084f8413767300485a0179598
X-Patchwork-Hint: ignore
Message-Id: <20251130102531.77FAF861CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xilinx-fpgautil: bump
 to xlnx-rel-v2025.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=333a6739de3df10084f8413767300485a0179598
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump xilinx-fpgautil to xlnx-rel-v2025.2 version.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xilinx-fpgautil/xilinx-fpgautil.hash | 2 +-
 package/xilinx-fpgautil/xilinx-fpgautil.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.hash b/package/xilinx-fpgautil/xilinx-fpgautil.hash
index d214fd4269..b66ef8186b 100644
--- a/package/xilinx-fpgautil/xilinx-fpgautil.hash
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a0185fda33a538379eb5ae48253f721037485be85c51555e2ad49e322d389429  xilinx-fpgautil-xlnx-rel-v2025.1.tar.gz
+sha256  043d87f12550283008ee0850f18ca807a48cc4ee085182ae84f8bed65fa73425  xilinx-fpgautil-xlnx-rel-v2025.2.tar.gz
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  COPYING.MIT
diff --git a/package/xilinx-fpgautil/xilinx-fpgautil.mk b/package/xilinx-fpgautil/xilinx-fpgautil.mk
index d41af96ee5..f53ed80e2f 100644
--- a/package/xilinx-fpgautil/xilinx-fpgautil.mk
+++ b/package/xilinx-fpgautil/xilinx-fpgautil.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XILINX_FPGAUTIL_VERSION = xlnx-rel-v2025.1
+XILINX_FPGAUTIL_VERSION = xlnx-rel-v2025.2
 XILINX_FPGAUTIL_SITE = $(call github,Xilinx,meta-xilinx,$(XILINX_FPGAUTIL_VERSION))
 XILINX_FPGAUTIL_LICENSE = MIT
 XILINX_FPGAUTIL_LICENSE_FILES = COPYING.MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
