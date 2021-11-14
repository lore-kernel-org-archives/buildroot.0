Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06C7C433EF
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:23:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2DC061027
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2DC061027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7605A40214;
	Sun, 14 Nov 2021 14:23:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8GpyPI9-tI4e; Sun, 14 Nov 2021 14:23:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE83401F1;
	Sun, 14 Nov 2021 14:23:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57FF21BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 549E6401E4
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:23:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qaILg6wQ_Fji for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:23:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EA6F40162
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:23:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 28DA08D227; Sun, 14 Nov 2021 14:19:03 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:23:03 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 914a8133a0e4c7e356a3016cf10bf65441a08e9a
X-Git-Newrev: c9ddee54a5971823dd3cdeb2727ca0950e245365
X-Patchwork-Hint: ignore
Message-Id: <20211114141903.28DA08D227@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/trace-cmd: bump to
 version 2.9.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9ddee54a5971823dd3cdeb2727ca0950e245365
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Update to version 2.9.6.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index 78ff3472c3..1f34a0da60 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  026cce03b4ae61f19848646acecf151dd7dd62617859edcf73ae954eb65b2653  trace-cmd-trace-cmd-v2.9.5-br1.tar.gz
+sha256  9401a43bda4837dfde5e64e0dbe5d3918bf50eb86b4d23fa89713b0f2defcbc1  trace-cmd-trace-cmd-v2.9.6-br1.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index f9b54ed765..a592b1f027 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = trace-cmd-v2.9.5
+TRACE_CMD_VERSION = trace-cmd-v2.9.6
 TRACE_CMD_SITE = https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git
 TRACE_CMD_SITE_METHOD = git
 TRACE_CMD_LICENSE = GPL-2.0, LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
