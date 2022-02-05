Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74A3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 15:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D7AF40579;
	Sat,  5 Feb 2022 15:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qyAUQbNZAkml; Sat,  5 Feb 2022 15:34:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A1B14052D;
	Sat,  5 Feb 2022 15:34:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9296F1BF39A
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E0C54052D
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 15:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQk0TCKttk_3 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 15:34:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A97C540354
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 15:34:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4BBF78295E; Sat,  5 Feb 2022 15:26:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Feb 2022 16:32:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1e48e5bf0c67295e219a2d7d58213d0a71a5863d
X-Git-Newrev: adca60540f4fd271dda48b9a121986492700e73a
X-Patchwork-Hint: ignore
Message-Id: <20220205152654.4BBF78295E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/domoticz: bump to version 2022.01
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

commit: https://git.buildroot.net/buildroot/commit/?id=adca60540f4fd271dda48b9a121986492700e73a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/domoticz/domoticz/blob/2022.1/History.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/domoticz/domoticz.hash | 2 +-
 package/domoticz/domoticz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index dcd5bead1e..18bf57b7e0 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d8e99e0f96873aa105b57f73656ef7a14c89e0acf2649b2d4ef1167b14bab4b2  domoticz-2021.1-br1.tar.gz
+sha256  b7faf959c4f1dbfec3b0c17ab495f29b3d1437bc2251579c5252be82247e7ff9  domoticz-2022.1-br1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index f142791830..5edc10e8d8 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOMOTICZ_VERSION = 2021.1
+DOMOTICZ_VERSION = 2022.1
 DOMOTICZ_SITE = https://github.com/domoticz/domoticz
 DOMOTICZ_SITE_METHOD = git
 DOMOTICZ_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
