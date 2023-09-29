Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CD2E743FE
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 08:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBCC583B5D;
	Fri, 29 Sep 2023 08:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBCC583B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lfD6R_PXrsG0; Fri, 29 Sep 2023 08:59:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7169A83C18;
	Fri, 29 Sep 2023 08:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7169A83C18
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DAE121BF215
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 08:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B50B160E1B
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 08:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B50B160E1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFalcYnRR8Y3 for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 08:59:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5B1760AC3
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 08:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5B1760AC3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D379883463; Fri, 29 Sep 2023 08:59:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Sep 2023 10:55:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3becbedb06bccbc2f67e04a183862904198292f
X-Git-Newrev: 187b1f5238d7f421c7b32a11ae6785a5329627e8
X-Patchwork-Hint: ignore
Message-Id: <20230929085930.D379883463@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pigz: bump to version 2.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=187b1f5238d7f421c7b32a11ae6785a5329627e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of README (update year and version:
https://github.com/madler/pigz/commit/fe4894f57739e3039a2ffc2a2a360d35e19bacbe)

https://zlib.net/pipermail/pigz-announce_zlib.net/2023-August/000018.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pigz/pigz.hash | 4 ++--
 package/pigz/pigz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pigz/pigz.hash b/package/pigz/pigz.hash
index 4a149605b3..d09930b62b 100644
--- a/package/pigz/pigz.hash
+++ b/package/pigz/pigz.hash
@@ -1,5 +1,5 @@
 # From http://zlib.net/pigz
-sha256  b4c9e60344a08d5db37ca7ad00a5b2c76ccb9556354b722d56d55ca7e8b1c707  pigz-2.7.tar.gz
+sha256  eb872b4f0e1f0ebe59c9f7bd8c506c4204893ba6a8492de31df416f0d5170fd0  pigz-2.8.tar.gz
 
 # Locally calculated
-sha256  67e2b9e30e924724a9d72549a6004ed15a041f51d9ea9ab781e048fa27ae07a2  README
+sha256  328634933a65dbc7f97a0f51df52741dc67f593bbe9eccabc9eedc6934c4983b  README
diff --git a/package/pigz/pigz.mk b/package/pigz/pigz.mk
index fd48ab463d..e3273c71c1 100644
--- a/package/pigz/pigz.mk
+++ b/package/pigz/pigz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIGZ_VERSION = 2.7
+PIGZ_VERSION = 2.8
 PIGZ_SITE = http://zlib.net/pigz
 PIGZ_DEPENDENCIES = zlib
 HOST_PIGZ_DEPENDENCIES = host-zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
