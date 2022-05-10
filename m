Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A59C433F5
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 19:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E2C281B01;
	Tue, 10 May 2022 19:39:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NND1FK5qwyq9; Tue, 10 May 2022 19:39:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80D298143E;
	Tue, 10 May 2022 19:39:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF7631BF32E
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89F434179A
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 19:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBFZbDXjcZm4 for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 19:38:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95946417AB
 for <buildroot@buildroot.org>; Tue, 10 May 2022 19:38:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6BFC385CF8; Tue, 10 May 2022 19:27:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 21:37:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92b3b25dd4377b03818c2e403c065e47def7d2f7
X-Git-Newrev: 570c58a6c3d1bdd6d742406f8b3f5950edd790f1
X-Patchwork-Hint: ignore
Message-Id: <20220510192737.6BFC385CF8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alfred: version bump to 2022.1
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
Content-Type: multipart/mixed; boundary="===============1971293765697094538=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1971293765697094538==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=570c58a6c3d1bdd6d742406f8b3f5950edd790f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: José Pekkarinen <jose.pekkarinen@unikie.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alfred/alfred.hash | 6 +++---
 package/alfred/alfred.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/alfred/alfred.hash b/package/alfred/alfred.hash
index 2da7eb31c8..2153d17e90 100644
--- a/package/alfred/alfred.hash
+++ b/package/alfred/alfred.hash
@@ -1,5 +1,5 @@
-# From https://downloads.open-mesh.org/batman/stable/sources/alfred/alfred-2022.0.tar.gz.sha1
-sha1  8e00789d3e1e5c959dd985809861ff624d372694  alfred-2022.0.tar.gz
+# From https://downloads.open-mesh.org/batman/stable/sources/alfred/alfred-2022.1.tar.gz.sha1
+sha1  14e916bda706ccff510f2ea00bb3143c582c9ff2  alfred-2022.1.tar.gz
 # Locally computed
-sha256  abba1dac61eccfcd6329e7331d0555fecc937760fb36c6cf55ce6c1d751cfd98  alfred-2022.0.tar.gz
+sha256  3a0ac2bb26e0cb3f2732d4873669a0a22e9825e8f9a8e7abac986363f275097f  alfred-2022.1.tar.gz
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
diff --git a/package/alfred/alfred.mk b/package/alfred/alfred.mk
index 24b9956b11..9af11931c1 100644
--- a/package/alfred/alfred.mk
+++ b/package/alfred/alfred.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALFRED_VERSION = 2022.0
+ALFRED_VERSION = 2022.1
 ALFRED_SITE = https://downloads.open-mesh.org/batman/stable/sources/alfred
 ALFRED_LICENSE = GPL-2.0
 ALFRED_LICENSE_FILES = LICENSES/preferred/GPL-2.0

--===============1971293765697094538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1971293765697094538==--
