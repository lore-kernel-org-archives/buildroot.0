Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9F2CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 19:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 843C1418B9;
	Sun, 24 Sep 2023 19:06:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 843C1418B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yS3LZaXMRnUo; Sun, 24 Sep 2023 19:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 589B2417E4;
	Sun, 24 Sep 2023 19:06:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 589B2417E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BB681BF947
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0582581A23
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0582581A23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Urw_de6mNIcV for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 19:05:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40B2D819D2
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 19:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40B2D819D2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 30E4E875A8; Sun, 24 Sep 2023 19:05:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 20:56:16 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 24bf5a1c0589a6313aa55002c67429ee42e2d568
X-Git-Newrev: 3c4fa086ae36b7ec655dd327f12734eaa5520bb1
X-Patchwork-Hint: ignore
Message-Id: <20230924190551.30E4E875A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/hwloc: bump to
 version 2.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=3c4fa086ae36b7ec655dd327f12734eaa5520bb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

For change log, see:
- https://github.com/open-mpi/hwloc/blob/hwloc-2.9.0/NEWS#L20

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0c7ba302bd5d1d46d5f4e2a73a5ba235c08d9b22)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hwloc/hwloc.hash | 8 ++++----
 package/hwloc/hwloc.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
index b146472195..963a1fd930 100644
--- a/package/hwloc/hwloc.hash
+++ b/package/hwloc/hwloc.hash
@@ -1,6 +1,6 @@
-# From https://www.open-mpi.org/software/hwloc/v2.8/
-md5  1d40ecdded67bbe4bafc8f8e8479376c  hwloc-2.8.0.tar.bz2
-sha1  314faaeda9f1982da97fca93b83307bc34d5b414  hwloc-2.8.0.tar.bz2
-sha256  348a72fcd48c32a823ee1da149ae992203e7ad033549e64aed6ea6eeb01f42c1  hwloc-2.8.0.tar.bz2
+# From https://www.open-mpi.org/software/hwloc/v2.9/
+md5  49869a8e19754299db512572abc5eb2b  hwloc-2.9.0.tar.bz2
+sha1  ee178b64234fdbf70f576b79963459ab80880583  hwloc-2.9.0.tar.bz2
+sha256  2070e963596a2421b9af8eca43bdec113ee1107aaf7ccb475d4d3767a8856887  hwloc-2.9.0.tar.bz2
 # Locally computed
 sha256  d79a936a42f3c6cb7c8375a023d43f4435f4664d3a5a2ea6b4623cff83c7fc06  COPYING
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index 3f73b3ecc8..c97e46999c 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWLOC_VERSION_MAJOR = 2.8
+HWLOC_VERSION_MAJOR = 2.9
 HWLOC_VERSION = $(HWLOC_VERSION_MAJOR).0
 HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
 HWLOC_SITE = https://download.open-mpi.org/release/hwloc/v$(HWLOC_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
