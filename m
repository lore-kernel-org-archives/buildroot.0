Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F247C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A77CD4ED7E;
	Mon, 20 Feb 2023 22:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A77CD4ED7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bb3l5oUQgV8y; Mon, 20 Feb 2023 22:00:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A71A42AC1;
	Mon, 20 Feb 2023 22:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A71A42AC1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B93F61BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6A0D6113C
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6A0D6113C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rIVFpuF1ofUO for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9F066112E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9F066112E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C83388648F; Mon, 20 Feb 2023 20:51:58 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 17:35:57 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 52264859725c6af2f88b0df6cf59f70b3b6d106d
X-Git-Newrev: 77c048e6297193ba4e116484bd8005fafdc412e1
X-Patchwork-Hint: ignore
Message-Id: <20230220205158.C83388648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/x11r7/xapp_smproxy:
 bump version to 1.0.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=77c048e6297193ba4e116484bd8005fafdc412e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

https://lists.x.org/archives/xorg-announce/2022-October/003218.html
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/x11r7/xapp_smproxy/xapp_smproxy.hash | 5 +++--
 package/x11r7/xapp_smproxy/xapp_smproxy.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.hash b/package/x11r7/xapp_smproxy/xapp_smproxy.hash
index db9dd27af3..587864baf7 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.hash
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.hash
@@ -1,4 +1,5 @@
-# From http://lists.x.org/archives/xorg-announce/2015-April/002564.html
-sha256  6cf19155a2752237f36dbf8bc4184465ea190d2652f887faccb4e2a6ebf77266  smproxy-1.0.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2022-October/003218.html
+sha256  4aa99237cc9dab7d87ce9bc7cca4116674a853b5f08dfe3f9db1bb2b2cf9f305  smproxy-1.0.7.tar.xz
+sha512  cd6a6933b74f76ae65fb16504e57871724bc1102eae1d02e801e99c3fe73fe44e27f87cef3fbf9f75f369d18197b53bb677d637d94cc8185b55acae0cbd44f21  smproxy-1.0.7.tar.xz
 # Locally computed
 sha256  92dce6d8a1fcc0c6b5e56dc44e431e7f73bfa2ed5e83295662aa314067a671d8  COPYING
diff --git a/package/x11r7/xapp_smproxy/xapp_smproxy.mk b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
index f51c1ec090..f76752941c 100644
--- a/package/x11r7/xapp_smproxy/xapp_smproxy.mk
+++ b/package/x11r7/xapp_smproxy/xapp_smproxy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_SMPROXY_VERSION = 1.0.6
-XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.bz2
-XAPP_SMPROXY_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_SMPROXY_VERSION = 1.0.7
+XAPP_SMPROXY_SOURCE = smproxy-$(XAPP_SMPROXY_VERSION).tar.xz
+XAPP_SMPROXY_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_SMPROXY_LICENSE = MIT
 XAPP_SMPROXY_LICENSE_FILES = COPYING
 XAPP_SMPROXY_DEPENDENCIES = xlib_libXmu xlib_libXt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
