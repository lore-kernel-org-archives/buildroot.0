Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF600C433EF
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 16:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 805E940497;
	Tue, 30 Nov 2021 16:13:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5BNcvJ9lnkpH; Tue, 30 Nov 2021 16:13:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A147E4047D;
	Tue, 30 Nov 2021 16:13:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFAE01BF2F0
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE56440445
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i4hxTnjBqA0a for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 16:11:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E60E940452
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 16:11:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 95CBF920D8; Tue, 30 Nov 2021 16:07:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 17:07:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de97e3ca6774133783b593e99fbac8d3f38d4db6
X-Git-Newrev: 0652b855dd6fa7af572f7ba17a82ec1c4068fe0a
X-Patchwork-Hint: ignore
Message-Id: <20211130160702.95CBF920D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/restclient-cpp: drop spurious space
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

commit: https://git.buildroot.net/buildroot/commit/?id=0652b855dd6fa7af572f7ba17a82ec1c4068fe0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious space added by commit
014c47cfbf014e916efef688ac5f892e5082d188

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/restclient-cpp/restclient-cpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/restclient-cpp/restclient-cpp.mk b/package/restclient-cpp/restclient-cpp.mk
index 826be870b9..1ba9ed8139 100644
--- a/package/restclient-cpp/restclient-cpp.mk
+++ b/package/restclient-cpp/restclient-cpp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RESTCLIENT_CPP_VERSION = 0.5.2
-RESTCLIENT_CPP_SITE =  $(call github,mrtazz,restclient-cpp,$(RESTCLIENT_CPP_VERSION))
+RESTCLIENT_CPP_SITE = $(call github,mrtazz,restclient-cpp,$(RESTCLIENT_CPP_VERSION))
 RESTCLIENT_CPP_LICENSE = MIT
 RESTCLIENT_CPP_LICENSE_FILES = LICENSE
 RESTCLIENT_CPP_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
