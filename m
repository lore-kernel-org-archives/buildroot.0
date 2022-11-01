Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E61BC4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0817F40E47;
	Tue,  1 Nov 2022 20:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0817F40E47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u5PwlDUtyXGj; Tue,  1 Nov 2022 20:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40C3B409BE;
	Tue,  1 Nov 2022 20:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40C3B409BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 740D81BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E226409BE
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E226409BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pS0lDN6DbW12 for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:45:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99B8640913
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99B8640913
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 834A9870E1; Tue,  1 Nov 2022 20:45:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Nov 2022 21:41:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 544806bfd8052d05dee671c23c354e5f73f954f9
X-Git-Newrev: 135685977414fa840ee58bd5c72eec7a9e4b7164
X-Patchwork-Hint: ignore
Message-Id: <20221101204540.834A9870E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-gmmlib: bump version to
 22.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=135685977414fa840ee58bd5c72eec7a9e4b7164
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-gmmlib/0001-Drop-hardening-related-flags.patch | 2 +-
 package/intel-gmmlib/intel-gmmlib.hash                       | 2 +-
 package/intel-gmmlib/intel-gmmlib.mk                         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch b/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
index c429df6581..b63d82f3c8 100644
--- a/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
+++ b/package/intel-gmmlib/0001-Drop-hardening-related-flags.patch
@@ -15,7 +15,7 @@ diff --git a/Source/GmmLib/Linux.cmake b/Source/GmmLib/Linux.cmake
 index 1a09bc4..b28fc1b 100644
 --- a/Source/GmmLib/Linux.cmake
 +++ b/Source/GmmLib/Linux.cmake
-@@ -99,7 +99,6 @@ SET (GMMLIB_COMPILER_FLAGS_COMMON
+@@ -97,7 +97,6 @@ SET (GMMLIB_COMPILER_FLAGS_COMMON
      -DUSE_SSE3
      -DUSE_SSSE3
      # Other common flags
diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
index bfff5e4b82..490ff46dfc 100644
--- a/package/intel-gmmlib/intel-gmmlib.hash
+++ b/package/intel-gmmlib/intel-gmmlib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  363084a52db1557f6e7409278c8ce46a66fcafa2b4672e399c452501a60b4437  intel-gmmlib-22.2.1.tar.gz
+sha256  c1f33e1519edfc527127baeb0436b783430dfd256c643130169a3a71dc86aff9  intel-gmmlib-22.3.0.tar.gz
 sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
index e949176cf7..ee5b60ab6b 100644
--- a/package/intel-gmmlib/intel-gmmlib.mk
+++ b/package/intel-gmmlib/intel-gmmlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_GMMLIB_VERSION = 22.2.1
+INTEL_GMMLIB_VERSION = 22.3.0
 INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
 INTEL_GMMLIB_LICENSE = MIT
 INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
