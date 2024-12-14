Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E18C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD41C4F5BE;
	Fri, 28 Feb 2025 16:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zw-1FiXVOWX; Fri, 28 Feb 2025 16:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89BCD4EFBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89BCD4EFBA;
	Fri, 28 Feb 2025 16:39:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 060D11DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F251A424C1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F2tHatqJPjlQ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98B2F424B7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98B2F424B7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95D42844AB; Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Dec 2024 22:50:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6ee9c706179076ec1d7772debb6390631da184ce
X-Git-Newrev: 9c98ed5fdd570cd834bc8524c0f38fe13e363d39
X-Patchwork-Hint: ignore
Message-Id: <20250228162940.95D42844AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libdeflate: bump
 version to 1.22
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9c98ed5fdd570cd834bc8524c0f38fe13e363d39
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://github.com/ebiggers/libdeflate/blob/master/NEWS.md

Updated license hash due to upstream commit:
https://github.com/ebiggers/libdeflate/commit/439f30117684c7859e0b1d4d8c57306b9ad71fd4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libdeflate/libdeflate.hash | 4 ++--
 package/libdeflate/libdeflate.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdeflate/libdeflate.hash b/package/libdeflate/libdeflate.hash
index 46afa96635..bb97c76c3d 100644
--- a/package/libdeflate/libdeflate.hash
+++ b/package/libdeflate/libdeflate.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ed1454166ced78913ff3809870a4005b7170a6fd30767dc478a09b96847b9c2a  libdeflate-1.20.tar.gz
-sha256  5d246dd2537307b80fed9ba5fdddf5d0fe7a8f023393a071182b9daed56b40fe  COPYING
+sha256  7f343c7bf2ba46e774d8a632bf073235e1fd27723ef0a12a90f8947b7fe851d6  libdeflate-1.22.tar.gz
+sha256  4ad69099cb4374836fd27583d9991e2838cd86b6e4666ab26b2d32582c91e73a  COPYING
diff --git a/package/libdeflate/libdeflate.mk b/package/libdeflate/libdeflate.mk
index 4597dc5a8c..823ff442fd 100644
--- a/package/libdeflate/libdeflate.mk
+++ b/package/libdeflate/libdeflate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDEFLATE_VERSION = 1.20
+LIBDEFLATE_VERSION = 1.22
 LIBDEFLATE_SITE = $(call github,ebiggers,libdeflate,v$(LIBDEFLATE_VERSION))
 LIBDEFLATE_LICENSE = MIT
 LIBDEFLATE_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
