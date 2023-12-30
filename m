Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF61C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 30 Dec 2023 17:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25BC560A87;
	Sat, 30 Dec 2023 17:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25BC560A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMr9JNuAgg-R; Sat, 30 Dec 2023 17:57:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C6260AAC;
	Sat, 30 Dec 2023 17:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73C6260AAC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E07B81BF870
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2EE84044C
 for <buildroot@lists.busybox.net>; Sat, 30 Dec 2023 17:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2EE84044C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hBVXze0vtS8e for <buildroot@lists.busybox.net>;
 Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD292403BF
 for <buildroot@buildroot.org>; Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD292403BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8F8481E4C; Sat, 30 Dec 2023 17:56:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Dec 2023 18:53:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55c80fdfb379c74c7f7e8c260dea02e0150d7614
X-Git-Newrev: 0040b2ec0f4829f6d0e30ecea3ba24d424ef1980
X-Patchwork-Hint: ignore
Message-Id: <20231230175629.A8F8481E4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dump1090: bump to version 9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=0040b2ec0f4829f6d0e30ecea3ba24d424ef1980
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/flightaware/dump1090/compare/v8.2...v9.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dump1090/dump1090.hash | 2 +-
 package/dump1090/dump1090.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dump1090/dump1090.hash b/package/dump1090/dump1090.hash
index 8a4c3a4818..a493e76560 100644
--- a/package/dump1090/dump1090.hash
+++ b/package/dump1090/dump1090.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1ab8a5acd891bdbba586e2e9f2d9b056210940bd47b5c1a19d133eb091f31555  dump1090-8.2.tar.gz
+sha256  6190622c3625713ec9cff882a9d6f6a51b6d2f83ef20e6e1905a3902c7b08483  dump1090-9.0.tar.gz
 sha256  804f68c803eb5c127c53ad17c4f4e5033ef158e514bb76950dc7b1773f9ce4b0  LICENSE
diff --git a/package/dump1090/dump1090.mk b/package/dump1090/dump1090.mk
index 60ef4a9bcb..e06babb082 100644
--- a/package/dump1090/dump1090.mk
+++ b/package/dump1090/dump1090.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DUMP1090_VERSION = 8.2
+DUMP1090_VERSION = 9.0
 DUMP1090_SITE = $(call github,flightaware,dump1090,v$(DUMP1090_VERSION))
 DUMP1090_LICENSE = GPL-2.0+
 DUMP1090_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
