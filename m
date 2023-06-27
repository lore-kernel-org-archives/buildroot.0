Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FB2EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 27 Jun 2023 06:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 08CF041712;
	Tue, 27 Jun 2023 06:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08CF041712
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3ueDJtGEBz0; Tue, 27 Jun 2023 06:12:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44E4E4170E;
	Tue, 27 Jun 2023 06:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44E4E4170E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D72841BF2F5
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 06:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF33160C01
 for <buildroot@lists.busybox.net>; Tue, 27 Jun 2023 06:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF33160C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgnG0MOy_VdZ for <buildroot@lists.busybox.net>;
 Tue, 27 Jun 2023 06:11:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE2AA60C15
 for <buildroot@buildroot.org>; Tue, 27 Jun 2023 06:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE2AA60C15
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE20A85B2A; Tue, 27 Jun 2023 06:11:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jun 2023 08:07:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b882f5679e66214e1fb54350bc75150815867359
X-Git-Newrev: 30294c1ed3b617d3069c92574799e00b55753c9e
X-Patchwork-Hint: ignore
Message-Id: <20230627061104.CE20A85B2A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rrdtool: bump version to 1.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=30294c1ed3b617d3069c92574799e00b55753c9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/oetiker/rrdtool-1.x/releases/tag/v1.8.0

Switched _SITE due to upstream move: https://oss.oetiker.ch/rrdtool/pub/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rrdtool/rrdtool.hash | 2 +-
 package/rrdtool/rrdtool.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
index 5266e5b7a1..1a6d18aea9 100644
--- a/package/rrdtool/rrdtool.hash
+++ b/package/rrdtool/rrdtool.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  a199faeb7eff7cafc46fac253e682d833d08932f3db93a550a4a5af180ca58db  rrdtool-1.7.2.tar.gz
+sha256  bd37614137d7a8dc523359648eb2a81631a34fd91a82ed5581916a52c08433f4  rrdtool-1.8.0.tar.gz
 sha256  ab6b4646e9e01f1ec287c29c351c886c4cb7f945c11efc0a1be9f6e5e6cc5320  COPYRIGHT
 sha256  d8c320ffc0030d1b096ae4732b50d2b811cf95e9a9b7377c1127b2563e0a0388  LICENSE
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 051aec1c19..24d84c79c3 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RRDTOOL_VERSION = 1.7.2
-RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
+RRDTOOL_VERSION = 1.8.0
+RRDTOOL_SITE = https://github.com/oetiker/rrdtool-1.x/releases/download/v$(RRDTOOL_VERSION)
 RRDTOOL_LICENSE = GPL-2.0+ with FLOSS license exceptions as explained in COPYRIGHT
 RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
 RRDTOOL_DEPENDENCIES = host-pkgconf libglib2 $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
