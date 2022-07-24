Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B75EC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB4C040B9E;
	Sun, 24 Jul 2022 10:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB4C040B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ozlXn1m3jFpW; Sun, 24 Jul 2022 10:38:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3EEF40BC6;
	Sun, 24 Jul 2022 10:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3EEF40BC6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 584511BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 414AB61ACB
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 414AB61ACB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H5RzxPA7SquO for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:37:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 765FD617A0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 765FD617A0
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 870B385C01; Sun, 24 Jul 2022 10:24:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 12:37:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb50b821702841fdc75bf8151555cd401f764f07
X-Git-Newrev: d8bc53e37a80fc3fdcc206293a6a6d49dc7abb9e
X-Patchwork-Hint: ignore
Message-Id: <20220724102416.870B385C01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/re2: bump to version 2022-06-01
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8bc53e37a80fc3fdcc206293a6a6d49dc7abb9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/re2/re2.hash | 2 +-
 package/re2/re2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/re2/re2.hash b/package/re2/re2.hash
index 28f407cc32..380b547658 100644
--- a/package/re2/re2.hash
+++ b/package/re2/re2.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  1ae8ccfdb1066a731bba6ee0881baad5efd2cd661acd9569b689f2586e1a50e9  re2-2022-04-01.tar.gz
+sha256  f89c61410a072e5cbcf8c27e3a778da7d6fd2f2b5b1445cd4f4508bee946ab0f  re2-2022-06-01.tar.gz
 sha256  6040cda75d90b1738292a631d89934c411ef7ffd543c4d6a1b7edfc8edf29449  LICENSE
diff --git a/package/re2/re2.mk b/package/re2/re2.mk
index b6d29c3caf..39b2c8d990 100644
--- a/package/re2/re2.mk
+++ b/package/re2/re2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RE2_VERSION = 2022-04-01
+RE2_VERSION = 2022-06-01
 RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
 RE2_LICENSE = BSD-3-Clause
 RE2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
