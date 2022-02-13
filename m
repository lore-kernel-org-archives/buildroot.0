Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA25C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67B5C40400;
	Sun, 13 Feb 2022 15:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77_uB-fw1bUs; Sun, 13 Feb 2022 15:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F52D4042F;
	Sun, 13 Feb 2022 15:34:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E0721BF95F
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1FFA81882
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rvMSTM4PVOXz for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:32:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B1658188A
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:32:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B0C7482983; Sun, 13 Feb 2022 15:25:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 16:27:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 423ef314b480ee62ecbba48424e2d77dd7bff4fc
X-Git-Newrev: b7e0b0e9a5831d85fcd5bacb2c1c815a26bfa1a0
X-Patchwork-Hint: ignore
Message-Id: <20220213152515.B0C7482983@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alfred: bump to version 2022.0
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
Content-Type: multipart/mixed; boundary="===============7448433191627909647=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7448433191627909647==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=b7e0b0e9a5831d85fcd5bacb2c1c815a26bfa1a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.open-mesh.org/news/107

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/alfred/alfred.hash | 6 +++---
 package/alfred/alfred.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/alfred/alfred.hash b/package/alfred/alfred.hash
index 0799071231..2da7eb31c8 100644
--- a/package/alfred/alfred.hash
+++ b/package/alfred/alfred.hash
@@ -1,5 +1,5 @@
-# From https://downloads.open-mesh.org/batman/stable/sources/alfred/alfred-2021.4.tar.gz.sha1
-sha1  be1e9c1317d40e46cfc881a31c632fec78c620a1 alfred-2021.4.tar.gz
+# From https://downloads.open-mesh.org/batman/stable/sources/alfred/alfred-2022.0.tar.gz.sha1
+sha1  8e00789d3e1e5c959dd985809861ff624d372694  alfred-2022.0.tar.gz
 # Locally computed
-sha256  4c79b6c45de4bcc8cbfe64cba9a0f8b4ef304ca84c194622f2bfa41e01e2cb95  alfred-2021.4.tar.gz
+sha256  abba1dac61eccfcd6329e7331d0555fecc937760fb36c6cf55ce6c1d751cfd98  alfred-2022.0.tar.gz
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
diff --git a/package/alfred/alfred.mk b/package/alfred/alfred.mk
index ed59066393..24b9956b11 100644
--- a/package/alfred/alfred.mk
+++ b/package/alfred/alfred.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALFRED_VERSION = 2021.4
+ALFRED_VERSION = 2022.0
 ALFRED_SITE = https://downloads.open-mesh.org/batman/stable/sources/alfred
 ALFRED_LICENSE = GPL-2.0
 ALFRED_LICENSE_FILES = LICENSES/preferred/GPL-2.0

--===============7448433191627909647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7448433191627909647==--
