Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BF0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0DE885792;
	Sun, 12 Dec 2021 14:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhjbAoIzvRVV; Sun, 12 Dec 2021 14:12:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 595B48578E;
	Sun, 12 Dec 2021 14:12:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1238A1BF33B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EB0A8574A
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:12:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rOlSt6W-YU6i for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:12:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A26328574B
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:12:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C246F82D93; Sun, 12 Dec 2021 14:06:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 15:04:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60621916c258fc8edf1e8695ffec50b2a787c60e
X-Git-Newrev: 7d59055f791ff5f44f534e5f72ab6f2704091493
X-Patchwork-Hint: ignore
Message-Id: <20211212140652.C246F82D93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/inadyn: bump to version 2.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d59055f791ff5f44f534e5f72ab6f2704091493
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the ChangeLog, or release notes at GitHub, for full details:
https://github.com/troglobit/inadyn/releases/tag/v2.9.1

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/inadyn/inadyn.hash | 2 +-
 package/inadyn/inadyn.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
index 801400b2f5..98af30e9fc 100644
--- a/package/inadyn/inadyn.hash
+++ b/package/inadyn/inadyn.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  b90c02a4f1964d8c1f3e178b6ef22eb29c689cd9e09669af17a8fd998c87dab5  inadyn-2.9.0.tar.gz
+sha256  7370eb7ad5d33a9cf2e7e4a6a86c09587fbf9592cd357c6f472c33f575bac26d  inadyn-2.9.1.tar.gz
 
 # Locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
index 9ccb16ddfe..041d1eff57 100644
--- a/package/inadyn/inadyn.mk
+++ b/package/inadyn/inadyn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INADYN_VERSION = 2.9.0
+INADYN_VERSION = 2.9.1
 INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
 INADYN_LICENSE = GPL-2.0+
 INADYN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
