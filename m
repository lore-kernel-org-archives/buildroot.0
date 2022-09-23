Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE9FC07E9D
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29B6F8426E;
	Fri, 23 Sep 2022 21:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29B6F8426E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5FN5I3E5JrG; Fri, 23 Sep 2022 21:47:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5099084266;
	Fri, 23 Sep 2022 21:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5099084266
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 716CE1BF82C
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57DEC60BFA
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57DEC60BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3cA8ojmKDRVR for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:47:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D1CB60A6B
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D1CB60A6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4599A85F52; Fri, 23 Sep 2022 21:47:48 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 23:46:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 80c8c15c8534a24382b900a07082a289a368f736
X-Git-Newrev: a954d39a588614967c1cb357676805e971c3c443
X-Patchwork-Hint: ignore
Message-Id: <20220923214748.4599A85F52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chartjs: bump to version 3.9.1
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
Content-Type: multipart/mixed; boundary="===============9086714039136909623=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9086714039136909623==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a954d39a588614967c1cb357676805e971c3c443
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/chartjs/Chart.js/releases/tag/v3.9.1

License file has updated copyright years to 2014-2022.

Signed-off-by: Ignacy Gawędzki <ignacy.gawedzki@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/chartjs/chartjs.hash | 4 ++--
 package/chartjs/chartjs.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/chartjs/chartjs.hash b/package/chartjs/chartjs.hash
index f8614ec385..3f8da92715 100644
--- a/package/chartjs/chartjs.hash
+++ b/package/chartjs/chartjs.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9ef3697e279a585c79730f35dba16ad4e24ddeed49a150adb341c31f191fb78e  chartjs-2.9.4.tar.gz
-sha256  7b43caae91f31b18dc81fae6e0f7aa1acbecaa6d84e3249905cbe15308307d67  LICENSE.md
+sha256  111e0751796f087a51e94dfed910ccfb1278fd30e584a6e48514dba9ae7e72c6  chart.js-3.9.1.tgz
+sha256  5a0877ad6d818529be4f33009d0942cdf7e2ed7656156f4aba7308459a546030  package/LICENSE.md
diff --git a/package/chartjs/chartjs.mk b/package/chartjs/chartjs.mk
index 2748a94d36..585b4be285 100644
--- a/package/chartjs/chartjs.mk
+++ b/package/chartjs/chartjs.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-CHARTJS_VERSION = 2.9.4
-CHARTJS_SITE = $(call github,chartjs,Chart.js,v$(CHARTJS_VERSION))
+CHARTJS_VERSION = 3.9.1
+CHARTJS_SITE = https://registry.npmjs.org/chart.js/-
+CHARTJS_SOURCE = chart.js-$(CHARTJS_VERSION).tgz
 CHARTJS_LICENSE = MIT
 CHARTJS_LICENSE_FILES = LICENSE.md
 CHARTJS_CPE_ID_VENDOR = chartjs

--===============9086714039136909623==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9086714039136909623==--
