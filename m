Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5131C433F5
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 19:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98A6661155;
	Fri, 28 Jan 2022 19:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rThV491U-esW; Fri, 28 Jan 2022 19:34:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C09D261089;
	Fri, 28 Jan 2022 19:34:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BBAE1C1162
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 19:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B12A60C24
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 19:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8VP99tj7L1oQ for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 19:34:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E26561089
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 19:34:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B416F82B2E; Fri, 28 Jan 2022 19:27:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 20:30:30 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 8f4a347754ed4f6f1730a38390448ec5f7fe2bfe
X-Git-Newrev: 15e3def173ba2013e50ab731560df57d48564e83
X-Patchwork-Hint: ignore
Message-Id: <20220128192734.B416F82B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/prosody: security
 bump to 0.11.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=15e3def173ba2013e50ab731560df57d48564e83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

see https://blog.prosody.im/prosody-0.11.12-released/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas: update separator for license file hash.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2d99bd8f7e0e3694828820a5ac1e0a09425d571d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prosody/prosody.hash | 10 +++++-----
 package/prosody/prosody.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index ee459f85d8..b6fa6532a5 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  78d01bb97a935f6a776d141873a33fd7  prosody-0.11.11.tar.gz
-sha1  ff653812fcb1789a517b55281a8d01e9e8261848  prosody-0.11.11.tar.gz
-sha256  a1af90e2d4ac2f7cf81b385475140ecee60bec1eb83003efb5aeb89765b13774  prosody-0.11.11.tar.gz
-sha512  eb9851e1b279bef894d556ca6bc6210d1cd55e0c02a9d475f74e6e6b4a2dfef704fd3de77b71cff97909925c48c60940c34cfb541e6f3801e23e90ea21d119a9  prosody-0.11.11.tar.gz
+md5  64a99571a5de84ace24d8142a1556d68  prosody-0.11.12.tar.gz
+sha1  64c918439c2df130204dcd86398832cb7a481eb3  prosody-0.11.12.tar.gz
+sha256  56cd52d820f5b3ed37e02d8a2577aa064bbc04db8e87fd18a6020eba0c10560d  prosody-0.11.12.tar.gz
+sha512  cd03ee8b02ffaa478b5329d9942d833cfed2d8bf720bf580a2082d681e7d333bc34f45041cea7234bee75f1a0e7c07983a685fe2ac9b31d51a0dbb36e87ba5d2  prosody-0.11.12.tar.gz
 
 # Hash for license file:
-sha256 bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
+sha256  bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 7acfa4708d..d697c85568 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.11
+PROSODY_VERSION = 0.11.12
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
