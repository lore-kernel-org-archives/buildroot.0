Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FC6CEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 19:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D03EA413FB;
	Mon, 17 Nov 2025 19:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmTfE96iT49q; Mon, 17 Nov 2025 19:52:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9E22413DD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9E22413DD;
	Mon, 17 Nov 2025 19:52:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AE5D158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D21B140027
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqOcxcQaLdbK for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 19:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AD53408B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AD53408B9
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 98974848E6; Mon, 17 Nov 2025 19:51:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 16:59:14 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e293ace97758d741ba6e8c93138936563c46ddb3
X-Git-Newrev: 83b56c83eafa1680f9a7be7c1e24cbab03e74a1c
X-Patchwork-Hint: ignore
Message-Id: <20251117195126.98974848E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gstd: bump to
 version 0.15.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=83b56c83eafa1680f9a7be7c1e24cbab03e74a1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Bugfix release:
https://github.com/RidgeRun/gstd-1.x/releases/tag/v0.15.2

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e87154cf3e6419536947bf37b62f3c4b04954ae7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gstreamer1/gstd/gstd.hash | 2 +-
 package/gstreamer1/gstd/gstd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer1/gstd/gstd.hash b/package/gstreamer1/gstd/gstd.hash
index 632f83f8e8..bdbc137287 100644
--- a/package/gstreamer1/gstd/gstd.hash
+++ b/package/gstreamer1/gstd/gstd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f4a83765d2cf2948c38abc5107ab07d49a01b4101047f188fed7204f1d4e49c7  gstd-0.15.0.tar.gz
+sha256  d9d3205551482acd6b7ec2a865407b60efce252e8f747553628401c84f88c556  gstd-0.15.2.tar.gz
 sha256  10162be9f7ddb9e98c22c3edd0f78d62ab88f0ca8b1cc968bd85d5d665489d90  COPYING
diff --git a/package/gstreamer1/gstd/gstd.mk b/package/gstreamer1/gstd/gstd.mk
index 965ede7949..d855fc52f0 100644
--- a/package/gstreamer1/gstd/gstd.mk
+++ b/package/gstreamer1/gstd/gstd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTD_VERSION = 0.15.0
+GSTD_VERSION = 0.15.2
 GSTD_SITE = $(call github,RidgeRun,gstd-1.x,v$(GSTD_VERSION))
 GSTD_LICENSE_FILES = COPYING
 GSTD_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
