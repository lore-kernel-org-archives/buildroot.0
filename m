Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70094C4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 21:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E88B260B5A;
	Thu, 22 Dec 2022 21:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E88B260B5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 60Hc3jRz8nmo; Thu, 22 Dec 2022 21:25:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44F0C60797;
	Thu, 22 Dec 2022 21:25:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44F0C60797
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 95D4A1BF2BE
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 21:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71230813A1
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 21:24:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71230813A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQ5DLxeLuGOY for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 21:24:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DBBD813AD
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 21:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DBBD813AD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6CBCC86D7E; Thu, 22 Dec 2022 21:24:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 22:24:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 31b7aecd7ef0b34095e72a1d4fbf41a05d5bd10b
X-Git-Newrev: 1381a4d2884cd7abdda45253b871cddd995a3e4b
X-Patchwork-Hint: ignore
Message-Id: <20221222212457.6CBCC86D7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lualogging: bump to version 1.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1381a4d2884cd7abdda45253b871cddd995a3e4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lualogging/lualogging.hash | 2 +-
 package/lualogging/lualogging.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lualogging/lualogging.hash b/package/lualogging/lualogging.hash
index a9eadab4d1..5ed012ea5c 100644
--- a/package/lualogging/lualogging.hash
+++ b/package/lualogging/lualogging.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  d4a8791e9b24840c4a4c0366399f55b6deb060fc3947f3a9aae9ced0334160c1  lualogging-1.7.0-1.src.rock
+sha256  285edf8abc9844cb37da94888ca01cb26a2ba08411ea13a3ee0f4d029ca512dd  lualogging-1.8.0-1.src.rock
 sha256  d900082cb26f8cf4a491ca51c00241f2c2e9cd9ae3531c62234017a360706adb  lualogging/COPYRIGHT
diff --git a/package/lualogging/lualogging.mk b/package/lualogging/lualogging.mk
index 78197f6be6..96c09c5a49 100644
--- a/package/lualogging/lualogging.mk
+++ b/package/lualogging/lualogging.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUALOGGING_VERSION = 1.7.0-1
+LUALOGGING_VERSION = 1.8.0-1
 LUALOGGING_SUBDIR = lualogging
 LUALOGGING_LICENSE = MIT
 LUALOGGING_LICENSE_FILES = $(LUALOGGING_SUBDIR)/COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
