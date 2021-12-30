Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C92C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 16:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF4A6827CA;
	Thu, 30 Dec 2021 16:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbOeZwgtwN2J; Thu, 30 Dec 2021 16:01:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14BF082786;
	Thu, 30 Dec 2021 16:01:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 601DF1C1135
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D3B960759
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UWIzLMUXgIWC for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 16:01:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C282606F5
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:01:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7D3E382DE0; Thu, 30 Dec 2021 15:55:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 16:59:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b2f00c9430a35e13d6cc44e5ca2625d3301e0c2
X-Git-Newrev: 8ec001b467e22904c0a7ec5780d83afd44ad78f3
X-Patchwork-Hint: ignore
Message-Id: <20211230155508.7D3E382DE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmicrohttpd: bump version to
 0.9.75
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ec001b467e22904c0a7ec5780d83afd44ad78f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.gnu.org/archive/html/libmicrohttpd/2021-12/msg00052.html
https://lists.gnu.org/archive/html/libmicrohttpd/2021-12/msg00056.html

Changelog:
https://git.gnunet.org/libmicrohttpd.git/tree/ChangeLog

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index c9d4d25c78..7f95e78a6e 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a37b2f1b88fd1bfe74109586be463a434d34e773530fc2a74364cfcf734c032e  libmicrohttpd-0.9.73.tar.gz
+sha256  9278907a6f571b391aab9644fd646a5108ed97311ec66f6359cebbedb0a4e3bb  libmicrohttpd-0.9.75.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index ef9f114494..f75178bc0a 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.73
+LIBMICROHTTPD_VERSION = 0.9.75
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
