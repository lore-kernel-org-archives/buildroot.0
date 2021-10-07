Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4CAC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:13:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FA1B61139
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 20:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FA1B61139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36D3C842A2;
	Thu,  7 Oct 2021 20:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LC7o_vogG_02; Thu,  7 Oct 2021 20:13:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EE3C84297;
	Thu,  7 Oct 2021 20:13:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 121B01BF84C
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E4FB409DF
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 20:13:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rvEqmNQ_njM2 for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 20:13:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55F8D409CC
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 20:13:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 64DCD934E2; Thu,  7 Oct 2021 20:11:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 7 Oct 2021 22:12:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6b2f96d510082d7b4235c22ab5a0e7365c9b6a3
X-Git-Newrev: bf87ae9cff6294c1eefc3c1cebb94e99ddccdd9e
X-Patchwork-Hint: ignore
Message-Id: <20211007201100.64DCD934E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libass: bump version to 0.15.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf87ae9cff6294c1eefc3c1cebb94e99ddccdd9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/libass/libass/blob/master/Changelog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libass/libass.hash | 2 +-
 package/libass/libass.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libass/libass.hash b/package/libass/libass.hash
index 882bc456ae..33ed0c4fc7 100644
--- a/package/libass/libass.hash
+++ b/package/libass/libass.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1cdd39c9d007b06e737e7738004d7f38cf9b1e92843f37307b24e7ff63ab8e53  libass-0.15.1.tar.xz
+sha256  1be2df9c4485a57d78bb18c0a8ed157bc87a5a8dd48c661961c625cb112832fd  libass-0.15.2.tar.xz
 sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 515f87c686..93bfbe4e2e 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBASS_VERSION = 0.15.1
+LIBASS_VERSION = 0.15.2
 LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
 # Do not use the github helper here, the generated tarball is *NOT*
 # the same as the one uploaded by upstream for the release.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
