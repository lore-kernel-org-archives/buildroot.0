Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8CCC433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A003480C33;
	Tue,  1 Nov 2022 22:24:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A003480C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N6BmcmY6sBYR; Tue,  1 Nov 2022 22:23:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEFB780C2A;
	Tue,  1 Nov 2022 22:23:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEFB780C2A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6DC31BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFB7B405BC
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFB7B405BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S9Q28hETqvHi for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:23:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1120A400EF
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1120A400EF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3E1987907; Tue,  1 Nov 2022 22:23:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 23:23:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1cb57485c86df466c839352127bc203331a85968
X-Git-Newrev: 4b4046e919b99c61b545396149bf1dcbcf7e9e41
X-Patchwork-Hint: ignore
Message-Id: <20221101222354.F3E1987907@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpm: bump to version 4.18.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b4046e919b99c61b545396149bf1dcbcf7e9e41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://rpm.org/wiki/Releases/4.18.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpm/rpm.hash | 4 ++--
 package/rpm/rpm.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
index 19b6dd9176..dfe50303f7 100644
--- a/package/rpm/rpm.hash
+++ b/package/rpm/rpm.hash
@@ -1,5 +1,5 @@
-# From https://rpm.org/wiki/Releases/4.17.0.html
-sha256  2e0d220b24749b17810ed181ac1ed005a56bbb6bc8ac429c21f314068dc65e6a  rpm-4.17.0.tar.bz2
+# From https://rpm.org/wiki/Releases/4.18.0.html
+sha256  2a17152d7187ab30edf2c2fb586463bdf6388de7b5837480955659e5e9054554  rpm-4.18.0.tar.bz2
 
 # Hash for license file
 sha256  171d94d9f1641316bff7f157a903237dc69cdb5fca405fed8c832c76ed8370f9  COPYING
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 5c04d47f10..fc57a14fd6 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPM_VERSION_MAJOR = 4.17
+RPM_VERSION_MAJOR = 4.18
 RPM_VERSION = $(RPM_VERSION_MAJOR).0
 RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
 RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
