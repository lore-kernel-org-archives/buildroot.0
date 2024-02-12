Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D25AC4829D
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3542B406C7;
	Mon, 12 Feb 2024 21:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OU9oBRCDAhvS; Mon, 12 Feb 2024 21:53:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 537B140713
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 537B140713;
	Mon, 12 Feb 2024 21:53:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABC441BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98CAD40713
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LiveyxAAgrpH for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:53:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3054406C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3054406C7
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:53:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AC640878C6; Mon, 12 Feb 2024 21:53:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 22:52:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c05f27c8ae46cc6d9236a30d51f854f221d55ff6
X-Git-Newrev: 835c647375182da571bfb0170b7cd7750cad38e4
X-Patchwork-Hint: ignore
Message-Id: <20240212215333.AC640878C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl8192eu: bump to version
 2024-02-09 on branch 5.11.2.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=835c647375182da571bfb0170b7cd7750cad38e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It supports up to Linux 6.8.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index e27acba124..a08ed04010 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  2326902c27aee022bd1f6e49e8dbf789b08613e660385c23ded8038074d7929b  rtl8192eu-a928f08c1dd4f9a1e84d85811a543e974551bc4f.tar.gz
+sha256  b5d3b8de0b4f05aa2b452dd01f4386e9b671e03c2bbf8e032f1c593befc5a153  rtl8192eu-e90a6043be141bde8847e84223e106eff38ecdfd.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index a2fde6fef0..3d24b0caf8 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = a928f08c1dd4f9a1e84d85811a543e974551bc4f
+RTL8192EU_VERSION = e90a6043be141bde8847e84223e106eff38ecdfd
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
