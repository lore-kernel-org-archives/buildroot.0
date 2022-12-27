Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD1BC4167B
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAB5440472;
	Tue, 27 Dec 2022 20:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAB5440472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qqhxepX1FWrj; Tue, 27 Dec 2022 20:03:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D870404AF;
	Tue, 27 Dec 2022 20:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D870404AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 46B361BF5A4
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FC89404C0
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1FC89404C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfFCe0c5wxu8 for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:03:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5236040472
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:03:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5236040472
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D93286E72; Tue, 27 Dec 2022 20:03:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 20:57:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c181878a84e9531f25d8dd1f5cb10b86f8bf9e51
X-Git-Newrev: 99127efe6ec2c8c056e252845326cc374859fa74
X-Patchwork-Hint: ignore
Message-Id: <20221227200353.3D93286E72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dump1090: bump to version 8.2
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=99127efe6ec2c8c056e252845326cc374859fa74
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/flightaware/dump1090/compare/v7.2...v8.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dump1090/dump1090.hash | 2 +-
 package/dump1090/dump1090.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dump1090/dump1090.hash b/package/dump1090/dump1090.hash
index 23178567ac..8a4c3a4818 100644
--- a/package/dump1090/dump1090.hash
+++ b/package/dump1090/dump1090.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  dfcf57b19f43e0262b1a03b0dc5069a9ddc48427d85378b7ef52fb4e74911eef  dump1090-7.2.tar.gz
+sha256  1ab8a5acd891bdbba586e2e9f2d9b056210940bd47b5c1a19d133eb091f31555  dump1090-8.2.tar.gz
 sha256  804f68c803eb5c127c53ad17c4f4e5033ef158e514bb76950dc7b1773f9ce4b0  LICENSE
diff --git a/package/dump1090/dump1090.mk b/package/dump1090/dump1090.mk
index 82eaaf2cb8..60ef4a9bcb 100644
--- a/package/dump1090/dump1090.mk
+++ b/package/dump1090/dump1090.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUMP1090_VERSION = 7.2
+DUMP1090_VERSION = 8.2
 DUMP1090_SITE = $(call github,flightaware,dump1090,v$(DUMP1090_VERSION))
 DUMP1090_LICENSE = GPL-2.0+
 DUMP1090_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
