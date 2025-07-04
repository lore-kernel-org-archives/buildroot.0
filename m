Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CFFC8303D
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 17:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E09654116E;
	Fri,  4 Jul 2025 17:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ozMomSRnbH5c; Fri,  4 Jul 2025 17:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4BDD40CBC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4BDD40CBC;
	Fri,  4 Jul 2025 17:56:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AD2A12E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2104B6165F
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Rb95KvYi7qW for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 17:56:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 761E661650
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 761E661650
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 17:56:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F50A85EF5; Fri,  4 Jul 2025 17:56:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 4 Jul 2025 19:41:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a56382373fe2f6c1303fd723f04c7a19870bb37
X-Git-Newrev: ff184d4e04d35677d053cea6e516b3d96acd922f
X-Patchwork-Hint: ignore
Message-Id: <20250704175619.6F50A85EF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpng: bump version to 1.6.50
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ff184d4e04d35677d053cea6e516b3d96acd922f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.50/ANNOUNCE

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 81a5be2b7d..b3740250a7 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.49/
-sha1  ba0b3067213c53ee0e36e98824450a4f264d815d  libpng-1.6.49.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.50/
+sha1  ecd92ba84628a8ace430706c85fd2fb26ba0882c  libpng-1.6.50.tar.xz
 # Locally computed:
-sha256  43182aa48e39d64b1ab4ec6b71ab3e910b67eed3a0fff3777cf8cf40d6ef7024  libpng-1.6.49.tar.xz
+sha256  4df396518620a7aa3651443e87d1b2862e4e88cad135a8b93423e01706232307  libpng-1.6.50.tar.xz
 sha256  16d9daaafbf63a31a5bdc91d4600972548fef5aaa1244202393288dbd079c49a  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index adc0a1f1c9..c3a89d5c7a 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.49
+LIBPNG_VERSION = 1.6.50
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
-LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
+LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
 LIBPNG_LICENSE = Libpng-2.0
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_CPE_ID_VENDOR = libpng
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
