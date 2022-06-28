Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540D0C43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 06:05:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2944410E7;
	Tue, 28 Jun 2022 06:05:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2944410E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8DrHVyURIYmN; Tue, 28 Jun 2022 06:05:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABADA410DB;
	Tue, 28 Jun 2022 06:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABADA410DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 496CE1BF9C6
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2472940227
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2472940227
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mUnLlcTc5NzF for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 06:04:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 474A2401A4
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 06:04:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 474A2401A4
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 271208775F; Tue, 28 Jun 2022 05:51:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 07:57:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 428e9d74c48b9e16ea6a315413324f0a2aede7da
X-Git-Newrev: ecf85b4ef58873e9acf749adedfbaa90baaaf3c0
X-Patchwork-Hint: ignore
Message-Id: <20220628055156.271208775F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/udpcast: bump to version 20211207
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

commit: https://git.buildroot.net/buildroot/commit/?id=ecf85b4ef58873e9acf749adedfbaa90baaaf3c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/SC6JCO6PGT3ELHQWRCO4PAIGGDDCKFMI

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udpcast/udpcast.hash | 2 +-
 package/udpcast/udpcast.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/udpcast/udpcast.hash b/package/udpcast/udpcast.hash
index 9cdce0a286..9ce91330fd 100644
--- a/package/udpcast/udpcast.hash
+++ b/package/udpcast/udpcast.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  9c19eebaa6e2f78127f0d59e95d0ce003b687d61e283b5963a1da6b8ac41f21a  udpcast-20200328.tar.gz
+sha256  a3cebee7a87ecf1bca0645f125be78fbd7b37846a4da82fecef96b92cc64d050  udpcast-20211207.tar.gz
 sha256  422befd3503b1f39a6027017f639874c1f274e37ec60ba3174894646b584ccbc  COPYING
diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
index 4c151bb41f..4ea73e20c7 100644
--- a/package/udpcast/udpcast.mk
+++ b/package/udpcast/udpcast.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UDPCAST_VERSION = 20200328
+UDPCAST_VERSION = 20211207
 UDPCAST_SITE = http://www.udpcast.linux.lu/download
 UDPCAST_DEPENDENCIES = host-m4
 UDPCAST_LICENSE = BSD-2-Clause, GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
