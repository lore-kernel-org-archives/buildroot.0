Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEBFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:31:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E9266128B
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E9266128B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8AA360879;
	Mon, 18 Oct 2021 19:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2w_Td7bpbiZo; Mon, 18 Oct 2021 19:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 655FC6078A;
	Mon, 18 Oct 2021 19:31:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5DE081BF319
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2204860817
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:27:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6HtXihQVtnt8 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:27:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 54CAE605CB
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:27:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0B371875D5; Mon, 18 Oct 2021 19:24:38 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 21:23:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff7db1b6306e6f4c94d9ef5ce7b1e656c09350db
X-Git-Newrev: bb3ba3d0ea273683ca166c844353ff256d9077b4
X-Patchwork-Hint: ignore
Message-Id: <20211018192438.0B371875D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libubox: bump version to d716ac4
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb3ba3d0ea273683ca166c844353ff256d9077b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:

  - a0dbcf8 tests: add blob-buffer overflow test
  - b36a3a9 blob: fix exceeding maximum buffer length
  - b8abed7 utils.h: add fallthrough macro
  - b14c468 json_script: fix unannotated fall-through warning
  - d716ac4 list.h: add a few missing iterator macros

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libubox/libubox.hash | 2 +-
 package/libubox/libubox.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libubox/libubox.hash b/package/libubox/libubox.hash
index 94a071d80d..2775427485 100644
--- a/package/libubox/libubox.hash
+++ b/package/libubox/libubox.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c6bac8baa7525b2d35eb22edeb5722c098370794d00e8859ef1a0bdfd8716151  libubox-551d75b5662cccd0466b990d58136bdf799a804d-br1.tar.gz
+sha256  54f65299439dab4be8f203588bcefd9b60052ae87d12c6d012f6278a2a111b4e  libubox-d716ac4bc4236031d4c3cc1ed362b502e20e3787-br1.tar.gz
diff --git a/package/libubox/libubox.mk b/package/libubox/libubox.mk
index 20da5c2ec2..90ba57a883 100644
--- a/package/libubox/libubox.mk
+++ b/package/libubox/libubox.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUBOX_VERSION = 551d75b5662cccd0466b990d58136bdf799a804d
+LIBUBOX_VERSION = d716ac4bc4236031d4c3cc1ed362b502e20e3787
 LIBUBOX_SITE = https://git.openwrt.org/project/libubox.git
 LIBUBOX_SITE_METHOD = git
 LIBUBOX_LICENSE = ISC, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
