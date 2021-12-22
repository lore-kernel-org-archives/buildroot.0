Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70A1C4332F
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 17:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5372940227;
	Wed, 22 Dec 2021 17:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FGLl3VO2qGHl; Wed, 22 Dec 2021 17:53:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CBD040273;
	Wed, 22 Dec 2021 17:53:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 586D11BF27E
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47440826FF
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 17:53:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctf5qp5GDsmU for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 17:53:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF05181B71
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 17:53:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 86B3182A42; Wed, 22 Dec 2021 17:47:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 18:53:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1055ae6c6b307331ff50d9e3dfaa82a37c8f9038
X-Git-Newrev: 84b29ef40baf408b8b22085b336967aca83212db
X-Patchwork-Hint: ignore
Message-Id: <20211222174748.86B3182A42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rtl_433: bump to version 21.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=84b29ef40baf408b8b22085b336967aca83212db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/merbanan/rtl_433/releases/tag/21.12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rtl_433/rtl_433.hash | 2 +-
 package/rtl_433/rtl_433.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl_433/rtl_433.hash b/package/rtl_433/rtl_433.hash
index 9ace444b78..fd479dfd21 100644
--- a/package/rtl_433/rtl_433.hash
+++ b/package/rtl_433/rtl_433.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d8b87535b4e65264018771b6b288259d81137482fc938d01e0c03ac071c03bd5  rtl_433-21.05.tar.gz
+sha256  b362ef3410adec64aee7ad8e6d4d74875f1b3d59ef6fb4856e96adc03876dc65  rtl_433-21.12.tar.gz
 # License file, locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index df00c09518..a5139ddae6 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL_433_VERSION = 21.05
+RTL_433_VERSION = 21.12
 RTL_433_SITE = $(call github,merbanan,rtl_433,$(RTL_433_VERSION))
 RTL_433_LICENSE = GPL-2.0+
 RTL_433_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
