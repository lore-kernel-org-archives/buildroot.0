Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1359FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 19:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA26C40907;
	Sat, 19 Mar 2022 19:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E1EgY_QawDJ5; Sat, 19 Mar 2022 19:14:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC5B6409C6;
	Sat, 19 Mar 2022 19:14:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D6DC1BF255
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 19:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BB2960671
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 19:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wD-zsehtImdx for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 19:14:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A827605EA
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 19:14:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CBA0682EAE; Sat, 19 Mar 2022 19:05:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 19 Mar 2022 20:04:26 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 40ede2956aa949040b69d27ea31992bb02dd55e2
X-Git-Newrev: f720577998f15f229221063088e0a7a1839f413d
X-Patchwork-Hint: ignore
Message-Id: <20220319190521.CBA0682EAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/lxc: bump to
 version 4.0.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=f720577998f15f229221063088e0a7a1839f413d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

https://discuss.linuxcontainers.org/t/lxc-4-0-12-has-been-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit f7b4ddd54d9d5dbeaa3646de3863f160c1504200)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
index 4d63fc14cb..94c6b9ffee 100644
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
