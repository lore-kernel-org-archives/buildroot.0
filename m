Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78496EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 08:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 213F2610A5;
	Thu,  6 Jul 2023 08:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 213F2610A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ERiq-KTIEHI; Thu,  6 Jul 2023 08:31:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5553F610A9;
	Thu,  6 Jul 2023 08:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5553F610A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EA901BF575
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73FEA40570
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 08:30:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73FEA40570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y_lxyGRTLXvC for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 08:30:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48432408FF
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 08:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48432408FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 380A386717; Thu,  6 Jul 2023 08:30:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 10:30:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1970c666a4cc4f679365a5c2d93bf8ec5cf71fd
X-Git-Newrev: f059c876f76ebef26802b5476dffcf8a17799f38
X-Patchwork-Hint: ignore
Message-Id: <20230706083053.380A386717@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediadriver: bump version to
 23.2.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f059c876f76ebef26802b5476dffcf8a17799f38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index b4129eb3bf..81fa5ba027 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3796fea4201e24310b3d100b64cfb288fb92b93ce9de54526efa43e2ea68853a  intel-media-23.2.1.tar.gz
+sha256  dfcf2facc4f8bf3df6b147222786032be195874adacc2f4071fc6c91a0abdf0a  intel-media-23.2.4.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 6895d60be6..dc63bb6239 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 23.2.1
+INTEL_MEDIADRIVER_VERSION = 23.2.4
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
