Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1AAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 07:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2D3840B06;
	Thu, 17 Mar 2022 07:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LRq1fK1A2SR; Thu, 17 Mar 2022 07:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 819D5404C0;
	Thu, 17 Mar 2022 07:49:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 613D71C1135
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 07:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D833612A5
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 07:48:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t06VqL1hie2U for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 07:48:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F6D46129C
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 07:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DD4C283E7E; Thu, 17 Mar 2022 07:40:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 08:31:20 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 434773e57842e0fd5801830b2143a28592f7626b
X-Git-Newrev: 0bcc9f2bca146dc2668d22f1833bfb8775a0312c
X-Patchwork-Hint: ignore
Message-Id: <20220317074006.DD4C283E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/haproxy: bump to
 version 2.2.22
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bcc9f2bca146dc2668d22f1833bfb8775a0312c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

https://www.haproxy.org/download/2.2/src/CHANGELOG

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 92f155581f..23b4db7ef2 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.17.tar.gz.sha256
-sha256  68af4aa3807d9c9f29b976d0ed57fb2e06acf7a185979059584862cc20d85be0  haproxy-2.2.17.tar.gz
+# From: http://www.haproxy.org/download/2.2/src/haproxy-2.2.22.tar.gz.sha256
+sha256  823a12fdab61a4a547770e29ad3418de2d7d4a5542a51fb3277f74a6321eccfc  haproxy-2.2.22.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 0b38995810..8dd875ce0b 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.2
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).17
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).22
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
