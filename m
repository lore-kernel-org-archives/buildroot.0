Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CC0C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 12:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF78F429AA;
	Sun, 12 Dec 2021 12:25:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LNZeWfF33fU4; Sun, 12 Dec 2021 12:25:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 109DA429AB;
	Sun, 12 Dec 2021 12:25:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 08B551BF373
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7A15429A0
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OZisdUsAeoUd for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 12:22:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A272C4216D
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 12:22:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DFAB282B70; Sun, 12 Dec 2021 12:17:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 13:21:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79791023ee4e257b0cedccae4fab940530759243
X-Git-Newrev: ee1a2826dcf7ff75f90b0bf9f7aa53d19ce19cf6
X-Patchwork-Hint: ignore
Message-Id: <20211212121714.DFAB282B70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinycbor: bump to version 0.6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee1a2826dcf7ff75f90b0bf9f7aa53d19ce19cf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/intel/tinycbor/releases/tag/v0.6.0
https://github.com/intel/tinycbor/compare/v0.5.4...v0.6.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/tinycbor/tinycbor.hash | 2 +-
 package/tinycbor/tinycbor.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index 29f0cfabf0..0e616d1e9f 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e63668a71fd6d7abf1727dc31682ec7f107599a3c024a445c3e5da6af9328983  tinycbor-0.5.4.tar.gz
+sha256  512e2c9fce74f60ef9ed3af59161e905f9e19f30a52e433fc55f39f4c70d27e4  tinycbor-0.6.0.tar.gz
 sha256  3c6ba0b5bfa7830505301ffb336a17b0748e0d61c4d34216e9dc98f10e40395e  LICENSE
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 476da67363..bf6e8e4c1e 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = 0.5.4
+TINYCBOR_VERSION = 0.6.0
 TINYCBOR_SITE = $(call github,intel,tinycbor,v$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
