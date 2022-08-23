Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 728F5C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:45:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04F6060B5C;
	Tue, 23 Aug 2022 19:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04F6060B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J7EaQpt6w1zI; Tue, 23 Aug 2022 19:45:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BF1360B30;
	Tue, 23 Aug 2022 19:45:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BF1360B30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3834E1BF9A4
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F01760B30
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F01760B30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Px5UtZxqQQJH for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:44:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DC0660B15
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DC0660B15
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 13A3487B5C; Tue, 23 Aug 2022 19:29:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 21:43:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5bb747f0b783a0d3f1712350ca3277263045b299
X-Git-Newrev: 85a3bfc4ca93252517337ed82ae7370372ec5e34
X-Patchwork-Hint: ignore
Message-Id: <20220823192956.13A3487B5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ser2net: bump to
 version 4.3.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=85a3bfc4ca93252517337ed82ae7370372ec5e34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ser2net/ser2net.hash | 6 +++---
 package/ser2net/ser2net.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 31a7518428..db493b28cb 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  e6d88a440852e28b8e2978003b00e154  ser2net-4.3.4.tar.gz
-sha1  74d02c19c2eef219b59a47fbc61b4fb09cf608d3  ser2net-4.3.4.tar.gz
+md5  3323783668b20016d79458e82327cff8  ser2net-4.3.7.tar.gz
+sha1  88c0542b3b5e8ce03bc99ace00b2e163382e726e  ser2net-4.3.7.tar.gz
 # Locally computed:
-sha256  c714d6777849100b2ca3f216d1cfc36d4573639ececc91d5c7809dfe27c8428e  ser2net-4.3.4.tar.gz
+sha256  542915e240ae8b5c7dcec8d1589e6067818532900d45cfef226cea9f0e671d13  ser2net-4.3.7.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index bec2a9c202..393d358033 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.3.4
+SER2NET_VERSION = 4.3.7
 SER2NET_SITE = https://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
