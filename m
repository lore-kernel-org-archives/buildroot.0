Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ECDC433EF
	for <buildroot@archiver.kernel.org>; Sat,  2 Jul 2022 13:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8330C60C04;
	Sat,  2 Jul 2022 13:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8330C60C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wS4pTa-3rDR7; Sat,  2 Jul 2022 13:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A091607F2;
	Sat,  2 Jul 2022 13:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A091607F2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A8E01BF5A1
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BF4782882
 for <buildroot@lists.busybox.net>; Sat,  2 Jul 2022 13:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BF4782882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Punhr-pK6IJ for <buildroot@lists.busybox.net>;
 Sat,  2 Jul 2022 13:56:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D2F983EB3
 for <buildroot@buildroot.org>; Sat,  2 Jul 2022 13:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D2F983EB3
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2DCC1878AD; Sat,  2 Jul 2022 13:43:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Jul 2022 15:54:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df91a970b66be48134da515c5287917f8fcad6bd
X-Git-Newrev: 017dbc770c4fd58d7d52cf290dd3fc39a3603e0d
X-Patchwork-Hint: ignore
Message-Id: <20220702134313.2DCC1878AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/glog: bump to version 0.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=017dbc770c4fd58d7d52cf290dd3fc39a3603e0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/google/glog/releases/tag/v0.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glog/glog.hash | 2 +-
 package/glog/glog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glog/glog.hash b/package/glog/glog.hash
index 3f84472967..fab77c522b 100644
--- a/package/glog/glog.hash
+++ b/package/glog/glog.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  eede71f28371bf39aa69b45de23b329d37214016e2055269b3b5e7cfd40b59f5  glog-0.5.0.tar.gz
+sha256  8a83bf982f37bb70825df71a9709fa90ea9f4447fb3c099e1d720a439d88bad6  glog-0.6.0.tar.gz
 
 # Hash for License file:
 sha256  0fc497129c5c69ff6f22da6933c7e4aaef082fde8437fd57680c2780100772a4  COPYING
diff --git a/package/glog/glog.mk b/package/glog/glog.mk
index 325107fb9e..ddf71fd15a 100644
--- a/package/glog/glog.mk
+++ b/package/glog/glog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GLOG_VERSION = 0.5.0
+GLOG_VERSION = 0.6.0
 GLOG_SITE = $(call github,google,glog,v$(GLOG_VERSION))
 GLOG_INSTALL_STAGING = YES
 GLOG_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
