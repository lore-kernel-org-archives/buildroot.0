Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A97C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 21:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E0DD611CB;
	Thu, 29 Sep 2022 21:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E0DD611CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T9XMp3hzu5vy; Thu, 29 Sep 2022 21:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B962611C7;
	Thu, 29 Sep 2022 21:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B962611C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBB291BF3D1
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:21:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A2F48402A
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 21:21:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A2F48402A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tFzCmfcyz4fH for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 21:21:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 303478401F
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 21:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 303478401F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2061886616; Thu, 29 Sep 2022 21:21:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 22:55:55 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: a4c125179f9a07e17475da6b7c0f2da3b92f76d3
X-Git-Newrev: e834c8c54b7927d438749913df719d8a57118d79
X-Patchwork-Hint: ignore
Message-Id: <20220929212137.2061886616@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/haproxy: bump to
 version 2.6.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=e834c8c54b7927d438749913df719d8a57118d79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

http://git.haproxy.org/?p=haproxy-2.6.git;a=blob;f=CHANGELOG;h=5e4ca2c913fa117587652a6a08844e3e2e3b62eb;hb=987a4e248bbccf4bffe955b27ccfbcbb626348c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ac70f179f6d1e703ebd51df086a0c33c3d2883dd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index 7a870d7c0c..2cd8ff1806 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.1.tar.gz.sha256
-sha256  915b351e6450d183342c4cdcda7771eac4f0f72bf90582adcd15a01c700d29b1  haproxy-2.6.1.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.5.tar.gz.sha256
+sha256  ce9e19ebfcdd43e51af8a6090f1df8d512d972ddf742fa648a643bbb19056605  haproxy-2.6.5.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 1000c1fea8..c37508f63b 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).1
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).5
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
