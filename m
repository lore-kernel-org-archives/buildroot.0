Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD6FC25B75
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 12:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 761F740694;
	Tue, 21 May 2024 12:16:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cm9L7y7IK-5P; Tue, 21 May 2024 12:16:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC5FE40657
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC5FE40657;
	Tue, 21 May 2024 12:16:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 291C91C525D
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 12:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F08B40232
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 12:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ES_1a9vsGB76 for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 12:15:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E89B402AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E89B402AF
 for <buildroot@buildroot.org>; Tue, 21 May 2024 12:15:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A80DF874B4; Tue, 21 May 2024 12:15:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 14:14:42 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: f5c0965c24711f8960788fd537c82f3699137018
X-Git-Newrev: 535c0a5ada8f9a086b0db341a4e11df1ddf43c9f
X-Patchwork-Hint: ignore
Message-Id: <20240521121557.A80DF874B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libpng: bump
 version to 1.6.43
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

commit: https://git.buildroot.net/buildroot/commit/?id=535c0a5ada8f9a086b0db341a4e11df1ddf43c9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Release notes:
https://sourceforge.net/p/png-mng/mailman/message/58741099/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ce3ce432feda336e4476eb930353fed8e3318539)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpng/libpng.hash | 4 ++--
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index fbae14c51d..356c0e3e5d 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,4 +1,4 @@
-# From https://sourceforge.net/p/png-mng/mailman/message/58731120/
-sha256  c919dbc11f4c03b05aba3f8884d8eb7adfe3572ad228af972bb60057bdb48450  libpng-1.6.42.tar.xz
+# From https://sourceforge.net/p/png-mng/mailman/message/58741099/
+sha256  6a5ca0652392a2d7c9db2ae5b40210843c0bbc081cbd410825ab00cc59f14a6c  libpng-1.6.43.tar.xz
 # Locally computed:
 sha256  7317e078e2d3b5d7ba5a6159e650945153262b44b76f6700f8e9edb261c5143e  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index c4da9f89c7..af38afde47 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.42
+LIBPNG_VERSION = 1.6.43
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
