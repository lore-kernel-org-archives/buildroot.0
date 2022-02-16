Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA5CC433F5
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 07:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46BB760E41;
	Wed, 16 Feb 2022 07:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xgITRfS9Qba9; Wed, 16 Feb 2022 07:21:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6080960B4D;
	Wed, 16 Feb 2022 07:21:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B474B1BF578
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 07:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A30D5408DC
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 07:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGGlJl7FVOaF for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 07:19:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0F7C408D8
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 07:19:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 22A8B82B34; Wed, 16 Feb 2022 07:12:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 08:18:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 1dd480525f763cbcd7a50960d99cff89a0b0d5ea
X-Git-Newrev: 5424a1320a574278e2d72dbf43813ce9fa03cd21
X-Patchwork-Hint: ignore
Message-Id: <20220216071217.22A8B82B34@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/prosody: security
 bump to 0.11.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=5424a1320a574278e2d72dbf43813ce9fa03cd21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

see https://prosody.im/doc/release/0.11.13

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 800e53cf7e3ec71c3830e8a125b0a5546786d44f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index b6fa6532a5..3a3a363a4b 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  64a99571a5de84ace24d8142a1556d68  prosody-0.11.12.tar.gz
-sha1  64c918439c2df130204dcd86398832cb7a481eb3  prosody-0.11.12.tar.gz
-sha256  56cd52d820f5b3ed37e02d8a2577aa064bbc04db8e87fd18a6020eba0c10560d  prosody-0.11.12.tar.gz
-sha512  cd03ee8b02ffaa478b5329d9942d833cfed2d8bf720bf580a2082d681e7d333bc34f45041cea7234bee75f1a0e7c07983a685fe2ac9b31d51a0dbb36e87ba5d2  prosody-0.11.12.tar.gz
+md5  7214ee57d4702585bd0d3428e69790b4  prosody-0.11.13.tar.gz
+sha1  1cc5a72d98738872d0c1a4c34b1fcb8878348c7d  prosody-0.11.13.tar.gz
+sha256  39c61b346a09b5125b604cb969e14206cbbcb86c81156ffc6ba2d62527cf0432  prosody-0.11.13.tar.gz
+sha512  7616785536b7b51767a26963a80c961ef2403609e1e78dda3f88cf68c00d5bb899278c70a22b006b58c36c62cbb1bbd390a9298bad5b8d6524928a1cd5457813  prosody-0.11.13.tar.gz
 
 # Hash for license file:
 sha256  bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index d697c85568..62ba073b9e 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.12
+PROSODY_VERSION = 0.11.13
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
