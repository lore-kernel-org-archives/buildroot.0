Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E75CC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 14:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18AD540BE5;
	Tue, 21 Feb 2023 14:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18AD540BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NN7aMMLbMQ2T; Tue, 21 Feb 2023 14:14:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34A8F40364;
	Tue, 21 Feb 2023 14:14:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34A8F40364
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B8381BF3C9
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25B3C42CEE
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25B3C42CEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rTUuick0GAbp for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 14:14:41 +0000 (UTC)
X-Greylist: delayed 00:06:39 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C2DA42CEA
Received: from mail (kmf.trabucayre.com [91.121.117.161])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C2DA42CEA
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 14:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
 by mail (Postfix) with ESMTP id A006D39856;
 Tue, 21 Feb 2023 14:30:55 +0100 (CET)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 14:30:54 +0100
Message-Id: <1676986254-52744-1-git-send-email-gwenj@trabucayre.com>
X-Mailer: git-send-email 1.6.4.2
Subject: [Buildroot] [PATCH] package/volk: bump version to 3.0.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Remove GPL-3.0+ license, no more COPYING-LGPL: merged into COPYING

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/volk/volk.hash | 5 ++---
 package/volk/volk.mk   | 6 +++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/volk/volk.hash b/package/volk/volk.hash
index 4c62c6d315..8047a68bab 100644
--- a/package/volk/volk.hash
+++ b/package/volk/volk.hash
@@ -1,4 +1,3 @@
 # Locally computed
-sha256  eff53206cd1ec3314755e0b2bde3c7aaea21dd0f0ad8d753bff07d98e93ddee2  volk-2.5.2.tar.xz
-sha256  6dcdafa9e750545f5f65c2e6f53820184822db728ac2b8bfe1d4a47da09ec0d6  COPYING
-sha256  258f450f060a161fb9f9e2e7c07c6b1ee73e5142297e6792dc1ee76b028cf0ca  COPYING-LGPL
+sha256  88fd80638a3683f23a8cae6c551a8cfe9ea55735c701846f3eeeeeea8a14f6a3  volk-3.0.0.tar.xz
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING
diff --git a/package/volk/volk.mk b/package/volk/volk.mk
index af5bd4306b..c9c098f237 100644
--- a/package/volk/volk.mk
+++ b/package/volk/volk.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-VOLK_VERSION = 2.5.2
+VOLK_VERSION = 3.0.0
 VOLK_SITE = https://github.com/gnuradio/volk/releases/download/v$(VOLK_VERSION)
 VOLK_SOURCE = volk-$(VOLK_VERSION).tar.xz
 # See https://github.com/gnuradio/volk/tree/v2.5.1#license for some
 # details on the licensing.
-VOLK_LICENSE = GPL-3.0+, LGPL-3.0+
-VOLK_LICENSE_FILES = COPYING COPYING-LGPL
+VOLK_LICENSE = LGPL-3.0+
+VOLK_LICENSE_FILES = COPYING
 
 VOLK_SUPPORTS_IN_SOURCE_BUILD = NO
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
