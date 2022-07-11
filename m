Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823CCC43334
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 17:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A3C160F4D;
	Mon, 11 Jul 2022 17:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A3C160F4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ynR-dTVsH_s5; Mon, 11 Jul 2022 17:31:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4213860F44;
	Mon, 11 Jul 2022 17:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4213860F44
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86EA51BF31D
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D1CC83077
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 17:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D1CC83077
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVKh4M197Aud for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 17:28:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BADCD8294A
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 17:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BADCD8294A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DD16C837E6; Mon, 11 Jul 2022 17:15:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Jul 2022 18:51:20 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2c34a06e8ae5041c62b15ef5d795b1836809088e
X-Git-Newrev: 54cddde910f4982070a43b927e45f421b7e448da
X-Patchwork-Hint: ignore
Message-Id: <20220711171516.DD16C837E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/bpftool: bump to
 version 6.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=54cddde910f4982070a43b927e45f421b7e448da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 463e66ff9361b037935a92a2b888e026c1fec3d7)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bpftool/bpftool.hash | 2 +-
 package/bpftool/bpftool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bpftool/bpftool.hash b/package/bpftool/bpftool.hash
index 2e414b8eb8..5fbc25adb7 100644
--- a/package/bpftool/bpftool.hash
+++ b/package/bpftool/bpftool.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e4ce219d3b87dd70d8dbfb8f02bd356f70c010f739f17baca1c8912199a8a72b  bpftool-v6.7.0-br1.tar.gz
+sha256  f8f8cabc001823d270898ea3a635d1eb88e067bc24eed06f74e58d2650b32312  bpftool-v6.8.0-br1.tar.gz
 sha256  7c588754d5e81e92e2a12e47cf78949d485c9c22b4850f12d21b3835c85947d1  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.GPL-2.0
diff --git a/package/bpftool/bpftool.mk b/package/bpftool/bpftool.mk
index 8742917253..bb1e4ccdff 100644
--- a/package/bpftool/bpftool.mk
+++ b/package/bpftool/bpftool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BPFTOOL_VERSION = v6.7.0
+BPFTOOL_VERSION = v6.8.0
 BPFTOOL_SITE = https://github.com/libbpf/bpftool
 BPFTOOL_SITE_METHOD = git
 BPFTOOL_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
