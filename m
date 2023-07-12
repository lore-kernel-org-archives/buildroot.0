Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8922AEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 12 Jul 2023 19:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3413641EFA;
	Wed, 12 Jul 2023 19:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3413641EFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SheODRVW6P3G; Wed, 12 Jul 2023 19:30:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C95640313;
	Wed, 12 Jul 2023 19:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C95640313
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F24391BF97D
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA96D61267
 for <buildroot@lists.busybox.net>; Wed, 12 Jul 2023 19:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA96D61267
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GO8aN-6IqsXA for <buildroot@lists.busybox.net>;
 Wed, 12 Jul 2023 19:30:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE29461203
 for <buildroot@buildroot.org>; Wed, 12 Jul 2023 19:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE29461203
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B638886EE2; Wed, 12 Jul 2023 19:30:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 12 Jul 2023 21:29:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 199a4d1dd1556878f6d0868ef638baa1607ad3d0
X-Git-Newrev: 170c218e4403944eae58bb80cc5cf1d198883a7c
X-Patchwork-Hint: ignore
Message-Id: <20230712193041.B638886EE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perftest: bump to version
 23.04.0-0.23
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

commit: https://git.buildroot.net/buildroot/commit/?id=170c218e4403944eae58bb80cc5cf1d198883a7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release note, see:
https://github.com/linux-rdma/perftest/releases/tag/23.04.0-0.23

Note: the version scheme changed since the previous version, from
"v4.5-0.20" to "23.04.0-0.23" (the "v" was removed).

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/perftest/perftest.hash | 2 +-
 package/perftest/perftest.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perftest/perftest.hash b/package/perftest/perftest.hash
index 4333231c44..a9ea10ef44 100644
--- a/package/perftest/perftest.hash
+++ b/package/perftest/perftest.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32e667dac1c0dd41a3951c5a54b961a8e28db5d9478caea2dfc268a312968c99  perftest-4.5-0.20.tar.gz
+sha256  c76f0fd5524a3486c335897357c596d0a6d4f82680f93fc1bc7120670fabd5f9  perftest-23.04.0-0.23.tar.gz
 sha256  763adb7d5094f2127b026adea8701f042d28d4b1f6fb8b6e828989227a9cf7f5  COPYING
diff --git a/package/perftest/perftest.mk b/package/perftest/perftest.mk
index 7ad20d0974..7101e318aa 100644
--- a/package/perftest/perftest.mk
+++ b/package/perftest/perftest.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PERFTEST_VERSION = 4.5-0.20
-PERFTEST_SITE = $(call github,linux-rdma,perftest,v$(PERFTEST_VERSION))
+PERFTEST_VERSION = 23.04.0-0.23
+PERFTEST_SITE = $(call github,linux-rdma,perftest,$(PERFTEST_VERSION))
 PERFTEST_LICENSE = GPL-2.0 or BSD-2-Clause
 PERFTEST_LICENSE_FILES = COPYING
 PERFTEST_DEPENDENCIES = pciutils rdma-core
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
