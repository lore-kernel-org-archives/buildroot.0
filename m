Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84534CCFA00
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 07:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E797781336;
	Tue,  4 Nov 2025 07:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2whLC9QnmD-t; Tue,  4 Nov 2025 07:39:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E9F981184
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E9F981184;
	Tue,  4 Nov 2025 07:39:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2199278
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C37B340C44
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:39:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lnmjy0xRBm3h for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 07:39:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A4FE40C41
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A4FE40C41
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 07:39:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A93E83C07; Tue,  4 Nov 2025 07:39:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Nov 2025 08:32:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42f2b480a5a81c7443f177bf541632b0fe501720
X-Git-Newrev: ae1c7f64503bc9dc97a1bbcc6c20f259d846d9f7
X-Patchwork-Hint: ignore
Message-Id: <20251104073949.8A93E83C07@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dav1d: bump version to 1.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae1c7f64503bc9dc97a1bbcc6c20f259d846d9f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://code.videolan.org/videolan/dav1d/-/blob/1.5.2/NEWS

Updated license due to copyright year bump:
https://code.videolan.org/videolan/dav1d/-/commit/04faac69004ac951b74ac7fea331f3790ec043b8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dav1d/dav1d.hash | 6 +++---
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index 2a64b5bc46..22dbf7220d 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,4 +1,4 @@
-# From https://download.videolan.org/pub/videolan/dav1d/1.5.1/dav1d-1.5.1.tar.xz.sha256
-sha256  401813f1f89fa8fd4295805aa5284d9aed9bc7fc1fdbe554af4292f64cbabe21  dav1d-1.5.1.tar.xz
+# From https://download.videolan.org/pub/videolan/dav1d/1.5.2/dav1d-1.5.2.tar.xz.sha256
+sha256  cce88ebcffd3f790bde49caa75f97b9cc2dd54ca8f57e38c62707266ec71bc4e  dav1d-1.5.2.tar.xz
 # Locally computed
-sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
+sha256  dd92c3c2247c5651606fc23a5e2d6a1ebc5ace9a3e49cbde0e12f05ad1cb1ee5  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index c7b5156b21..f9cfd171d5 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 1.5.1
+DAV1D_VERSION = 1.5.2
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
 DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
