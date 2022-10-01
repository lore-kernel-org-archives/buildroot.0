Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43AAC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 21:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 390BF40550;
	Sat,  1 Oct 2022 21:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 390BF40550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RHRY8E8BFv3L; Sat,  1 Oct 2022 21:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65FC04056E;
	Sat,  1 Oct 2022 21:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65FC04056E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5AD01BF966
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 21:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CB5940984
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 21:39:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CB5940984
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdG8mUwome25 for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 21:39:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A07F40942
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 21:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A07F40942
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75F3586744; Sat,  1 Oct 2022 21:39:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Oct 2022 23:37:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a397fa6381a4115be22ee9637746bf8c8e1194e
X-Git-Newrev: be14b55e838f2e0f9664b0372b3d9ac00a5a8518
X-Patchwork-Hint: ignore
Message-Id: <20221001213928.75F3586744@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/volk: bump to version 2.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=be14b55e838f2e0f9664b0372b3d9ac00a5a8518
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[yann.morin.1998@free.fr: split out to its own patch]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/volk/volk.hash | 2 +-
 package/volk/volk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/volk/volk.hash b/package/volk/volk.hash
index 0ec96d22ff..4c62c6d315 100644
--- a/package/volk/volk.hash
+++ b/package/volk/volk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  3f092737006ad2b7d24852833cf040e725c6f47d68ec2f4197895f84c6400bd8  volk-2.5.1.tar.xz
+sha256  eff53206cd1ec3314755e0b2bde3c7aaea21dd0f0ad8d753bff07d98e93ddee2  volk-2.5.2.tar.xz
 sha256  6dcdafa9e750545f5f65c2e6f53820184822db728ac2b8bfe1d4a47da09ec0d6  COPYING
 sha256  258f450f060a161fb9f9e2e7c07c6b1ee73e5142297e6792dc1ee76b028cf0ca  COPYING-LGPL
diff --git a/package/volk/volk.mk b/package/volk/volk.mk
index 038b85ee86..5e2e50ae73 100644
--- a/package/volk/volk.mk
+++ b/package/volk/volk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VOLK_VERSION = 2.5.1
+VOLK_VERSION = 2.5.2
 VOLK_SITE = https://github.com/gnuradio/volk/releases/download/v$(VOLK_VERSION)
 VOLK_SOURCE = volk-$(VOLK_VERSION).tar.xz
 # See https://github.com/gnuradio/volk/tree/v2.5.1#license for some
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
