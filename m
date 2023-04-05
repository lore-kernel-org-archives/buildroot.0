Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB59C76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 20:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0B9E613B8;
	Wed,  5 Apr 2023 20:35:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0B9E613B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sPhgWl4bByig; Wed,  5 Apr 2023 20:35:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B2826141F;
	Wed,  5 Apr 2023 20:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B2826141F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83B641C2BD5
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D33061427
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 20:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D33061427
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I6xVmrZbGVWx for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2010E613B8
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2010E613B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F14A83944; Wed,  5 Apr 2023 20:35:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 5 Apr 2023 22:31:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f89f3787a05d123a33f1a000c802fe42c96a487f
X-Git-Newrev: 69ee42a26bb3d6965449ed7cd2b0854bbed095d7
X-Patchwork-Hint: ignore
Message-Id: <20230405203540.0F14A83944@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccid: bump to version 1.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=69ee42a26bb3d6965449ed7cd2b0854bbed095d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/LudovicRousseau/CCID/releases/tag/1.5.1
https://github.com/LudovicRousseau/CCID/releases/tag/1.5.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccid/ccid.hash | 2 +-
 package/ccid/ccid.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ccid/ccid.hash b/package/ccid/ccid.hash
index d42d0778f1..fcd8d10ed9 100644
--- a/package/ccid/ccid.hash
+++ b/package/ccid/ccid.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  81549b3422469d503996d03a3aed2ef1375b359167f10d66be9e3844e729322e  ccid-1.5.0.tar.bz2
+sha256  13934487e6f8b48f699a16d367cc7a1af7a3ca874de721ac6e9633beb86e7219  ccid-1.5.2.tar.bz2
 sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
index c05e28a5d2..0510b4c9ad 100644
--- a/package/ccid/ccid.mk
+++ b/package/ccid/ccid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CCID_VERSION = 1.5.0
+CCID_VERSION = 1.5.2
 CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
 CCID_SITE = https://ccid.apdu.fr/files
 CCID_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
