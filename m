Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73315C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 10:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30E0260E3A;
	Mon,  7 Mar 2022 10:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VvNxbTNnf8Bt; Mon,  7 Mar 2022 10:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58CBA60E33;
	Mon,  7 Mar 2022 10:42:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 679001BF982
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 10:42:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57A3540910
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 10:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2cIfrFEVP1iX for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 10:42:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E743F4090D
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 10:42:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2A13F81586; Mon,  7 Mar 2022 10:33:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 11:31:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0bbb12eff3b9f9d9719c48644c2b3d563e80de48
X-Git-Newrev: 0e60d4f11cd56544d6c23a1f7c3c8bbd98edbec3
X-Patchwork-Hint: ignore
Message-Id: <20220307103351.2A13F81586@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/haproxy: bump to version 2.4.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e60d4f11cd56544d6c23a1f7c3c8bbd98edbec3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.mail-archive.com/haproxy@formilux.org/msg41834.html
https://www.mail-archive.com/haproxy@formilux.org/msg41698.html
https://www.mail-archive.com/haproxy@formilux.org/msg41685.html
https://www.mail-archive.com/haproxy@formilux.org/msg41618.html
https://www.mail-archive.com/haproxy@formilux.org/msg41512.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index c29857cd9c..e3120b521f 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.8.tar.gz.sha256
-sha256  e3e4c1ad293bc25e8d8790cc5e45133213dda008bfd0228bf3077259b32ebaa5  haproxy-2.4.8.tar.gz
+# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.13.tar.gz.sha256
+sha256  4788fe975fe7e521746f826c25e80bc95cd15983e2bafa33e43bff23a3fe5ba1  haproxy-2.4.13.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 33a2e92777..83d9cfee37 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.4
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).8
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).13
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
