Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A052EB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 16:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC0D360591;
	Sun,  9 Jul 2023 16:29:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC0D360591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-x9IX9kLRt8; Sun,  9 Jul 2023 16:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFFE160757;
	Sun,  9 Jul 2023 16:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFFE160757
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4001F1BF423
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2511D40017
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 16:29:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2511D40017
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fo_9jzBK60Xk for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 16:29:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CDB14011C
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 16:29:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CDB14011C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B6A28693A; Sun,  9 Jul 2023 16:29:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Jul 2023 18:28:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4a239f14efdd4eb0fcbf89d403cde4dd31205a41
X-Git-Newrev: a749a93b7def81096f33310a5892f677c9fc8bb1
X-Patchwork-Hint: ignore
Message-Id: <20230709162916.2B6A28693A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fwts: bump version to 23.07.00
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a749a93b7def81096f33310a5892f677c9fc8bb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://wiki.ubuntu.com/FirmwareTestSuite/ReleaseNotes

Updated license hash due to copyright year bump and formatting changes:
https://git.launchpad.net/fwts/commit/debian/copyright?id=64d2ea181d887d877104cd08defbd3427015070a
https://git.launchpad.net/fwts/commit/debian/copyright?id=88edd4da5885e182a339c57c4d70768f6fab695b

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fwts/fwts.hash | 4 ++--
 package/fwts/fwts.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
index 612bc768dd..8525d47ecb 100644
--- a/package/fwts/fwts.hash
+++ b/package/fwts/fwts.hash
@@ -1,5 +1,5 @@
 # Hash from: http://fwts.ubuntu.com/release/SHA256SUMS
-sha256  fee1c323fb9725c2b99c348c434d63196391cad66566d34b42707e55d14d7f25  fwts-V22.09.00.tar.gz
+sha256  a15e11c42856e9dfcf7ac23ed370618d2777eb996dd7843accf12d45b21b551c  fwts-V23.07.00.tar.gz
 
 # Hash for license file
-sha256  fbbea748555635dd8c7e6e2f99cddd778f5ee3f9e3510775183bf9799076e5e5  debian/copyright
+sha256  b9e44b1f9f65178e037a59a31b051b51dbd6a531d27c8775d3438a6ce53fc874  debian/copyright
diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
index 3af54a1afd..f06609777d 100644
--- a/package/fwts/fwts.mk
+++ b/package/fwts/fwts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FWTS_VERSION = 22.09.00
+FWTS_VERSION = 23.07.00
 FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
 FWTS_SITE = http://fwts.ubuntu.com/release
 FWTS_STRIP_COMPONENTS = 0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
