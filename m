Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511AED1BDC0
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 18:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E954980A96;
	Mon,  4 Nov 2024 18:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3PRrh7mGFtz; Mon,  4 Nov 2024 18:30:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1EDD80A91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1EDD80A91;
	Mon,  4 Nov 2024 18:30:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 668E0723
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51E6E606EB
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xKss-t7WUBPj for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 18:30:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63BC5606E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63BC5606E7
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 18:30:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B69685BF5; Mon,  4 Nov 2024 18:30:35 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 19:25:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efe93b34ec678c0d35b2ec062128fccf55912b8e
X-Git-Newrev: 3e5fab611f3e11430dde7fb4411581bc1105e2ae
X-Patchwork-Hint: ignore
Message-Id: <20241104183035.5B69685BF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opkg-utils: bump to version 0.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3e5fab611f3e11430dde7fb4411581bc1105e2ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the change log since 0.6.2, see:
https://git.yoctoproject.org/opkg-utils/log/?h=0.7.0

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opkg-utils/opkg-utils.hash | 2 +-
 package/opkg-utils/opkg-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opkg-utils/opkg-utils.hash b/package/opkg-utils/opkg-utils.hash
index 982dbb5caf..37834a3a15 100644
--- a/package/opkg-utils/opkg-utils.hash
+++ b/package/opkg-utils/opkg-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cbce8a9ad60ee34f27b9195146ff7ecfc37a3f97d2ce6bfc6610f46210f490f8  opkg-utils-0.6.2-git4.tar.gz
+sha256  b3299961be768c17185c0516e9757ede4481e94cf81ffc6d9cb0d51206aa58da  opkg-utils-0.7.0-git4.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index b077e0dcce..320d05135d 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPKG_UTILS_VERSION = 0.6.2
+OPKG_UTILS_VERSION = 0.7.0
 OPKG_UTILS_SITE = https://git.yoctoproject.org/git/opkg-utils
 OPKG_UTILS_SITE_METHOD = git
 OPKG_UTILS_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
