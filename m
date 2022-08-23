Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF91C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 19:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61E3B40980;
	Tue, 23 Aug 2022 19:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61E3B40980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bay7kX6ZspKI; Tue, 23 Aug 2022 19:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4201B40090;
	Tue, 23 Aug 2022 19:43:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4201B40090
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37CCB1BF39D
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13A2E401FB
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 19:43:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13A2E401FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8SZWMetVIFPv for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 19:43:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59FC04093F
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 19:43:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59FC04093F
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1F1E487B50; Tue, 23 Aug 2022 19:28:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 21:42:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2f954aacb9ee401ed4bdbf924cbf55b5816b5477
X-Git-Newrev: 5bb747f0b783a0d3f1712350ca3277263045b299
X-Patchwork-Hint: ignore
Message-Id: <20220823192818.1F1E487B50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gensio: bump to
 version 2.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bb747f0b783a0d3f1712350ca3277263045b299
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gensio/gensio.hash | 6 +++---
 package/gensio/gensio.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gensio/gensio.hash b/package/gensio/gensio.hash
index 930a2fff81..a0db4bc516 100644
--- a/package/gensio/gensio.hash
+++ b/package/gensio/gensio.hash
@@ -1,7 +1,7 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  45cd3a4d9058816e50351b0700a035ad  gensio-2.2.9.tar.gz
-sha1  4bb34517931f5be4dc5982f6e7a567cf6fdc41b8  gensio-2.2.9.tar.gz
+md5  60f90f62180922e2c7550877c4bb950c  gensio-2.5.2.tar.gz
+sha1  b6c2ec39b51a56f5d28e88a59122f4c65ff844fa  gensio-2.5.2.tar.gz
 # Locally computed:
-sha256  3609f66e61c98cce181ec1b37508b727b636d7cfffdb6edd4c254d2f6097a000  gensio-2.2.9.tar.gz
+sha256  f7bc3d2ba9da73489dd3227a21ddd2f44a18c443185ce2b1a08ec564da06e6d1  gensio-2.5.2.tar.gz
 sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
 sha256  dcac7d447dd81ab96d28dce00a07a6486e623f7ded94e2a2a8e83312405cdf89  COPYING.LIB
diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index b27158c61f..f1cc00bf32 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GENSIO_VERSION = 2.2.9
+GENSIO_VERSION = 2.5.2
 GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
