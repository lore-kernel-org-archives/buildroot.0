Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993AEE8FDB3
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 20:37:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26FDC60FC9;
	Tue,  3 Oct 2023 20:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26FDC60FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I87DIqFBvjG6; Tue,  3 Oct 2023 20:37:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73EA960AB7;
	Tue,  3 Oct 2023 20:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73EA960AB7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B55FD1BF3D2
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 20:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BE1F82296
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 20:37:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BE1F82296
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jz0hzie4nme for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 20:37:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E518A8228A
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 20:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E518A8228A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D29938417D; Tue,  3 Oct 2023 20:37:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 3 Oct 2023 22:36:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3edaa9def7809ae20d88b5cb48d01b4ce119d708
X-Git-Newrev: 74b50d553eafb0e3ec7a9a7eec5181d552b71707
X-Patchwork-Hint: ignore
Message-Id: <20231003203743.D29938417D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tbb: bump to version 2021.10.0.
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

commit: https://git.buildroot.net/buildroot/commit/?id=74b50d553eafb0e3ec7a9a7eec5181d552b71707
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tbb/tbb.hash | 2 +-
 package/tbb/tbb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
index 579581cfe4..1caf81c5c5 100644
--- a/package/tbb/tbb.hash
+++ b/package/tbb/tbb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eee380323bb7ce864355ed9431f85c43955faaae9e9bce35c62b372d7ffd9f8b  tbb-2021.8.0.tar.gz
+sha256  eee380323bb7ce864355ed9431f85c43955faaae9e9bce35c62b372d7ffd9f8b  tbb-2021.10.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE.txt
diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
index c3e06a4e6d..75cca5e99d 100644
--- a/package/tbb/tbb.mk
+++ b/package/tbb/tbb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TBB_VERSION = 2021.8.0
+TBB_VERSION = 2021.10.0
 TBB_SITE = $(call github,01org,tbb,v$(TBB_VERSION))
 TBB_INSTALL_STAGING = YES
 TBB_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
