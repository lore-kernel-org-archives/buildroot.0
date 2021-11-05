Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B56C433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:21:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A085611C4
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 16:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A085611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7654C4073E;
	Fri,  5 Nov 2021 16:21:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w-t4jKDLwf_U; Fri,  5 Nov 2021 16:21:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7FEF406D0;
	Fri,  5 Nov 2021 16:21:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F33C71C1148
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D89F140012
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 16:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pUtq06WKIL9x for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 16:20:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0428401DE
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 16:20:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 26FA28AC5A; Fri,  5 Nov 2021 16:16:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 5 Nov 2021 17:17:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1d52698b037158e524f9d2d67b9b4965060778f3
X-Git-Newrev: 3da100637fb2ae8e90e3d9bc3953c22c61ea083a
X-Patchwork-Hint: ignore
Message-Id: <20211105161640.26FA28AC5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.19.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3da100637fb2ae8e90e3d9bc3953c22c61ea083a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-October/042003.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/libinput.hash | 6 +++---
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 0f0b12bc49..31bf7bcf69 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041989.html
-sha256  0bdcf5b1783b737854b7af1ca22df67bc36a6fe7c9cfa71f01e9149f9220446d  libinput-1.19.1.tar.xz
-sha512  63084f5e081ee4918fee8584d99e6feb84ce9b771015c556c930843e0097abb9b93b6f9731c488b8493eac18fa4086f4822a2ed00f3cb3258346341ad0061c36  libinput-1.19.1.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-October/042003.html
+sha256  0fc39f0af3ee1a77c60c34bc45391a4d0879169f7c0f7bbbeb5eef590b98b883  libinput-1.19.2.tar.xz
+sha512  fc5244dc90ceb710f7b5bb76a3cafc7dd5a8d5fa05c51122412615bfc3a99435d6a1017b79c3ce73561139fc2f5959acaf16cb9500796ea2f3eb6cb95d1a1acb  libinput-1.19.2.tar.xz
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 0c232994df..682209262e 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.19.1
+LIBINPUT_VERSION = 1.19.2
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
