Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA9AECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 09:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37AAF41A5D;
	Sat, 17 Sep 2022 09:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37AAF41A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zusLwOWSrIg4; Sat, 17 Sep 2022 09:14:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36F0341A51;
	Sat, 17 Sep 2022 09:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36F0341A51
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2901BF82D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B5B68403C
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 09:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B5B68403C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 24kqW2BDY8WW for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 09:14:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A37768403A
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 09:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A37768403A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8D0F0840EC; Sat, 17 Sep 2022 09:14:37 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 11:08:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 000546fd7cdcb2cc2be2d574e5c2d51caddaf834
X-Git-Newrev: 8ba9b47d6bfca6adbad8d5e37d7c4747722719f3
X-Patchwork-Hint: ignore
Message-Id: <20220917091437.8D0F0840EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnice: bump to version 0.1.19
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ba9b47d6bfca6adbad8d5e37d7c4747722719f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.freedesktop.org/libnice/libnice/-/blob/0.1.19/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnice/libnice.hash | 2 +-
 package/libnice/libnice.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnice/libnice.hash b/package/libnice/libnice.hash
index 55785cd5ff..83b28a9ad9 100644
--- a/package/libnice/libnice.hash
+++ b/package/libnice/libnice.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking pgp signature
-sha256  5eabd25ba2b54e817699832826269241abaa1cf78f9b240d1435f936569273f4  libnice-0.1.18.tar.gz
+sha256  6747af710998cf708a2e8ceef51cccd181373d94201dd4b8d40797a070ed47cc  libnice-0.1.19.tar.gz
 
 # Hash for license files:
 sha256  9246b2ee8b1db30cf03d5d9719ad8bb5edce1cadc85f8cfef319c23d24d950b5  COPYING
diff --git a/package/libnice/libnice.mk b/package/libnice/libnice.mk
index 5889b24ba2..2b223bedd3 100644
--- a/package/libnice/libnice.mk
+++ b/package/libnice/libnice.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNICE_VERSION = 0.1.18
+LIBNICE_VERSION = 0.1.19
 LIBNICE_SITE = http://nice.freedesktop.org/releases
 LIBNICE_LICENSE = MPL-1.1 or LGPL-2.1
 LIBNICE_LICENSE_FILES = COPYING COPYING.MPL COPYING.LGPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
