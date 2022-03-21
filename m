Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A388BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 21:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 669B941602;
	Mon, 21 Mar 2022 21:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7TMLWMgApNN1; Mon, 21 Mar 2022 21:19:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95F8741681;
	Mon, 21 Mar 2022 21:19:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C03DC1BF239
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3F9F40A8A
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 21:18:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U8L2MUmjfRr5 for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 21:18:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 099E240A8E
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 21:18:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A6A0E84E82; Mon, 21 Mar 2022 21:09:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 22:16:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 370249646872b5e4d1a60141357e6d69c0851a63
X-Git-Newrev: f3476b1dedfbd6892b82e096a48199111032ba72
X-Patchwork-Hint: ignore
Message-Id: <20220321210932.A6A0E84E82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediasdk: bump version to
 22.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3476b1dedfbd6892b82e096a48199111032ba72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch | 2 +-
 package/intel-mediasdk/intel-mediasdk.hash                     | 2 +-
 package/intel-mediasdk/intel-mediasdk.mk                       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch b/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch
index a7e3b70294..b3ecfc98b7 100644
--- a/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch
+++ b/package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch
@@ -40,7 +40,7 @@ index 7e36ae2d..5b8b9b9d 100644
  #  message( STATUS "Libva located at: ${PKG_LIBVA_LIBRARY_DIRS}" )
  
    if( ARGV1 MATCHES hw AND Linux )
-@@ -445,7 +445,7 @@ function(configure_dependencies target dependencies variant)
+@@ -452,7 +452,7 @@ function(configure_dependencies target dependencies variant)
    endforeach()
  
    set(SCOPE_CFLAGS ${SCOPE_CFLAGS} PARENT_SCOPE)
diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
index ee4f317242..d9acf49637 100644
--- a/package/intel-mediasdk/intel-mediasdk.hash
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ae56d4fe69856ff4e184a2863f23d0e861a16add225fd3e159a5440774d5c80a  intel-mediasdk-22.2.1.tar.gz
+sha256  3f8029e487aa163a9bf1061129fa1bf42ec85cd6a11014303d6d41e52463972f  intel-mediasdk-22.2.2.tar.gz
 sha256  dfd67773578903698f9ff4a61eb8f2d84810cbecd56f3f3cee8c649f813b6ea6  LICENSE
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
index 7589ff9737..698d2348b2 100644
--- a/package/intel-mediasdk/intel-mediasdk.mk
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_MEDIASDK_VERSION = 22.2.1
+INTEL_MEDIASDK_VERSION = 22.2.2
 INTEL_MEDIASDK_SITE = https://github.com/Intel-Media-SDK/MediaSDK/archive
 INTEL_MEDIASDK_LICENSE = MIT
 INTEL_MEDIASDK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
