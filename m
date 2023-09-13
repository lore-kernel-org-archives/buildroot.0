Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4954ACA5501
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 07:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8BF341D88;
	Wed, 13 Sep 2023 07:43:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8BF341D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0eqrSy8PYI8b; Wed, 13 Sep 2023 07:43:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D773340889;
	Wed, 13 Sep 2023 07:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D773340889
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4941BF37C
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5937340337
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 07:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5937340337
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8Tx0gwDgPKl for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 07:43:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46A9D41C49
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 07:43:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46A9D41C49
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 307FF86D9E; Wed, 13 Sep 2023 07:43:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 09:40:44 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 8e8dc2eb3a4e9eb7b297fa108e337b533b9431a3
X-Git-Newrev: 71eb499298b57de4c3a50de31515c3b3d36062d1
X-Patchwork-Hint: ignore
Message-Id: <20230913074305.307FF86D9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/sofia-sip: bump
 version to 1.13.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=71eb499298b57de4c3a50de31515c3b3d36062d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit fe9fc288d46483948e352794e0c8db5e27804858)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sofia-sip/sofia-sip.hash | 2 +-
 package/sofia-sip/sofia-sip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index 4617725571..f7293bd262 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  03dda8653367501b7b1188a6b6513416902372e27475553de9318ee89ac390ff  sofia-sip-1.13.12.tar.gz
+sha256  846b3d5eef57702e8d18967070b538030252116af1500f4baa78ad068c5fdd64  sofia-sip-1.13.15.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 59c365365b..9734da5020 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.12
+SOFIA_SIP_VERSION = 1.13.15
 SOFIA_SIP_SITE = $(call github,freeswitch,sofia-sip,v$(SOFIA_SIP_VERSION))
 SOFIA_SIP_INSTALL_STAGING = YES
 # Fetched from github, no pre-generated configure script provided
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
