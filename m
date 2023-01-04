Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DB3C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B77E4EF48;
	Tue, 21 Feb 2023 00:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B77E4EF48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8IZi8uzT6mYJ; Tue, 21 Feb 2023 00:05:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DE114EF24;
	Tue, 21 Feb 2023 00:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DE114EF24
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83E5B1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51B3B6F9D4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B3B6F9D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EimJSiQLDUYX for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E9AF61B07
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E9AF61B07
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BBB68648F; Mon, 20 Feb 2023 20:52:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 22:25:25 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 64a03682cc1a90a311b2331224deac62f8c8940f
X-Git-Newrev: f6e88fff91dd4702c725f47fb4fdd1a00b228f64
X-Patchwork-Hint: ignore
Message-Id: <20230220205224.5BBB68648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/prosody: bump to
 version 0.11.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6e88fff91dd4702c725f47fb4fdd1a00b228f64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/prosody/prosody.hash | 8 ++++----
 package/prosody/prosody.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/prosody/prosody.hash b/package/prosody/prosody.hash
index 3a3a363a4b..1fd1abafe9 100644
--- a/package/prosody/prosody.hash
+++ b/package/prosody/prosody.hash
@@ -1,8 +1,8 @@
 # Locally computed:
-md5  7214ee57d4702585bd0d3428e69790b4  prosody-0.11.13.tar.gz
-sha1  1cc5a72d98738872d0c1a4c34b1fcb8878348c7d  prosody-0.11.13.tar.gz
-sha256  39c61b346a09b5125b604cb969e14206cbbcb86c81156ffc6ba2d62527cf0432  prosody-0.11.13.tar.gz
-sha512  7616785536b7b51767a26963a80c961ef2403609e1e78dda3f88cf68c00d5bb899278c70a22b006b58c36c62cbb1bbd390a9298bad5b8d6524928a1cd5457813  prosody-0.11.13.tar.gz
+md5  93665d86c47e99c9c525610ac53400fb  prosody-0.11.14.tar.gz
+sha1  abbd0ad42e2b30051f4d3f198c54a52b4e9f39d0  prosody-0.11.14.tar.gz
+sha256  ec0c7447ec07ed336b6912d06a2f533439cb16d60d8d3bffa8ce46269ee52c87  prosody-0.11.14.tar.gz
+sha512  128e12427ae0b5080fd3cc2380974c04570b16f0f79de7b39ef85cec6e8f579bee2d1150ce70ca731222c487dba646cbcd48bdb4a102a14395644eb5f19f1c88  prosody-0.11.14.tar.gz
 
 # Hash for license file:
 sha256  bbbdc1c5426e5944cf869fc0faeaf19d88a220cd2b39ea98b7b8e86b0e88a2ef  COPYING
diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
index 62ba073b9e..b5d89ebba4 100644
--- a/package/prosody/prosody.mk
+++ b/package/prosody/prosody.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROSODY_VERSION = 0.11.13
+PROSODY_VERSION = 0.11.14
 PROSODY_SITE = https://prosody.im/downloads/source
 PROSODY_LICENSE = MIT
 PROSODY_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
