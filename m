Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354A7C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 19:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE1D660BBB;
	Wed,  6 Jul 2022 19:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE1D660BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oqxov2DVgiGv; Wed,  6 Jul 2022 19:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07EA260E18;
	Wed,  6 Jul 2022 19:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07EA260E18
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C38B81BF32D
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 19:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A53460BF5
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 19:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A53460BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UZ3gEUFg8O7z for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 19:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CED1160C09
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 19:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CED1160C09
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1FAEB82820; Wed,  6 Jul 2022 19:38:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 21:47:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca336ca3bf26c6fe76593b0e1c3268ba79d5b677
X-Git-Newrev: 62d5699d00eb8dfbcbd911053cc18d9914ff478f
X-Patchwork-Hint: ignore
Message-Id: <20220706193851.1FAEB82820@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnetconf2: bump version to 2.1.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=62d5699d00eb8dfbcbd911053cc18d9914ff478f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnetconf2/libnetconf2.hash | 2 +-
 package/libnetconf2/libnetconf2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index 1d4707f44b..001a51d682 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3044f36c117a5eaad01482d0caffc30cb2a87c66090d3cd9c946fef85b8a2394  libnetconf2-2.1.7.tar.gz
+sha256  0b0f0c84291710b0ca2497e1e02504a5ded7b83d49deeb4992bea7936e1d74b9  libnetconf2-2.1.11.tar.gz
 sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 00d2c08f63..6aa9aa9498 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 2.1.7
+LIBNETCONF2_VERSION = 2.1.11
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
