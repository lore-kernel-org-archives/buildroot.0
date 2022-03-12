Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CD6C433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Mar 2022 17:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34212408CB;
	Sat, 12 Mar 2022 17:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2bRgEG959M7; Sat, 12 Mar 2022 17:09:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71871408E2;
	Sat, 12 Mar 2022 17:09:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1901BF5F8
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3790A60E5B
 for <buildroot@lists.busybox.net>; Sat, 12 Mar 2022 17:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cwidumZgIoLZ for <buildroot@lists.busybox.net>;
 Sat, 12 Mar 2022 17:09:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B7C46009C
 for <buildroot@buildroot.org>; Sat, 12 Mar 2022 17:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D37E87FF6F; Sat, 12 Mar 2022 17:01:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Mar 2022 18:08:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0846221426b1cefa9e569f1927bc6fed102acb36
X-Git-Newrev: f7b4ddd54d9d5dbeaa3646de3863f160c1504200
X-Patchwork-Hint: ignore
Message-Id: <20220312170117.D37E87FF6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lxc: bump to version 4.0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7b4ddd54d9d5dbeaa3646de3863f160c1504200
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://discuss.linuxcontainers.org/t/lxc-4-0-12-has-been-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lxc/lxc.hash | 2 +-
 package/lxc/lxc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index 2b58df2f1d..d460bc6a01 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  afa481e17ca9a9cf9fd3d2d7a04e42a8f6bfe60b323909326c968e852cd9f02c  lxc-4.0.11.tar.gz
+sha256  db242f8366fc63e8c7588bb2017b354173cf3c4b20abc18780debdc48b14d3ef  lxc-4.0.12.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 08f64bcec7..9311dc8775 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 4.0.11
+LXC_VERSION = 4.0.12
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
