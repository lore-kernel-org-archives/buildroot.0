Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B15D5B149
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 20:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F60D819B4;
	Mon, 28 Oct 2024 20:25:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjRZZGc3YIlO; Mon, 28 Oct 2024 20:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42CE2819BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42CE2819BE;
	Mon, 28 Oct 2024 20:25:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CFBFD4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDFC860AB1
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UC3d4sJkv8wm for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 20:25:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9E0460A46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9E0460A46
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 20:25:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5955843DE; Mon, 28 Oct 2024 20:25:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 21:24:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 182faa21311b284ea374ad18e2fd19bc63674454
X-Git-Newrev: 34cadee14c42f73858a99afce2449f9920f0473d
X-Patchwork-Hint: ignore
Message-Id: <20241028202549.D5955843DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opencsd: bump to version 1.5.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=34cadee14c42f73858a99afce2449f9920f0473d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log, see:
https://github.com/Linaro/OpenCSD/blob/v1.5.5/README.md?plain=1#L344

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencsd/opencsd.hash | 2 +-
 package/opencsd/opencsd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencsd/opencsd.hash b/package/opencsd/opencsd.hash
index 1cedb3c2f3..865580968b 100644
--- a/package/opencsd/opencsd.hash
+++ b/package/opencsd/opencsd.hash
@@ -1,3 +1,3 @@
 # Locally Computed:
-sha256  de4752f148e823c64aaf64f8db9691dea83577ae980a7a2bb80dad33985970c8  opencsd-1.5.4.tar.gz
+sha256  1df9b61656ac96bc5cca082d8c32a9f25ed07ef684d7d666911280cf162b7d93  opencsd-1.5.5.tar.gz
 sha256  980eef4b0744e63834e3ec0d50c2a4ff6d81d7ec62dd8ba8c66acae0ec5a2e88  LICENSE
diff --git a/package/opencsd/opencsd.mk b/package/opencsd/opencsd.mk
index 83af20ade8..9714bb970a 100644
--- a/package/opencsd/opencsd.mk
+++ b/package/opencsd/opencsd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCSD_VERSION = 1.5.4
+OPENCSD_VERSION = 1.5.5
 OPENCSD_SITE = $(call github,Linaro,OpenCSD,v$(OPENCSD_VERSION))
 OPENCSD_LICENSE = BSD-3-Clause
 OPENCSD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
