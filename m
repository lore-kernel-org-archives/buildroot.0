Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BBCC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 10:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51B0C613F4;
	Wed, 10 Jan 2024 10:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B0C613F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFwe3F1fIiP2; Wed, 10 Jan 2024 10:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B00861405;
	Wed, 10 Jan 2024 10:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B00861405
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01A551BF354
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9AA6435F5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 10:26:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9AA6435F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6vooCL9R9OwK for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 10:26:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D26004014E
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 10:26:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D26004014E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFA5985541; Wed, 10 Jan 2024 10:26:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 11:21:24 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 8529a89b0f79171208a6649ea9bf0172c301c267
X-Git-Newrev: d1a9aa8f92214c2d40b2d2e4c1999a16ced4ac1b
X-Patchwork-Hint: ignore
Message-Id: <20240110102650.BFA5985541@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/mp4v2: security
 bump to version 2.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1a9aa8f92214c2d40b2d2e4c1999a16ced4ac1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fix CVE-2023-1450, CVE-2023-1451 and CVE-2023-29584

https://github.com/enzo1982/mp4v2/releases/tag/v2.1.3
https://github.com/enzo1982/mp4v2/releases/tag/v2.1.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 19f083717451eb22e097d3cdc53785161c2f156a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mp4v2/mp4v2.hash | 2 +-
 package/mp4v2/mp4v2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mp4v2/mp4v2.hash b/package/mp4v2/mp4v2.hash
index d3f0243650..4605ee6b0d 100644
--- a/package/mp4v2/mp4v2.hash
+++ b/package/mp4v2/mp4v2.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  29420c62e56a2e527fd8979d59d05ed6d83ebe27e0e2c782c1ec19a3a402eaee  mp4v2-2.1.1.tar.bz2
+sha256  033185c17bf3c5fdd94020c95f8325be2e5356558e3913c3d6547a85dd61f7f1  mp4v2-2.1.3.tar.bz2
 sha256  7187891a4c39ee9e7ec70c71fc7dc8b8ed02c6f56ae1ffc017a34ac66dca5390  COPYING
diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index 7de837c170..ae777cdc75 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MP4V2_VERSION = 2.1.1
+MP4V2_VERSION = 2.1.3
 MP4V2_SITE = \
 	https://github.com/enzo1982/mp4v2/releases/download/v$(MP4V2_VERSION)
 MP4V2_SOURCE = mp4v2-$(MP4V2_VERSION).tar.bz2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
