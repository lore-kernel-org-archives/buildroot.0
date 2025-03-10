Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A17C282DE
	for <buildroot@archiver.kernel.org>; Mon, 10 Mar 2025 22:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB226605C7;
	Mon, 10 Mar 2025 22:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ABRSLV4Qu2MO; Mon, 10 Mar 2025 22:54:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD164608AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD164608AB;
	Mon, 10 Mar 2025 22:54:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 606A3AF7
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BC01409F1
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PpXS3AJUs6ly for <buildroot@buildroot.org>;
 Mon, 10 Mar 2025 22:54:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0439640024
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0439640024
 for <buildroot@buildroot.org>; Mon, 10 Mar 2025 22:54:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE02187E89; Mon, 10 Mar 2025 22:54:49 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 10 Mar 2025 23:32:22 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bc933199e0a850afe54ae5372d68aa9b76137822
X-Git-Newrev: fb8300f4b7dad2cdc54d6b733347afab9b1d6cd6
X-Patchwork-Hint: ignore
Message-Id: <20250310225449.DE02187E89@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lapack: bump to
 version 3.12.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb8300f4b7dad2cdc54d6b733347afab9b1d6cd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Released in January 2025

- Updated LICENSE sha for changed year

https://www.netlib.org/lapack/lapack-3.12.1.html

Signed-off-by: Benjamin Kamath <kamath.ben@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lapack/lapack.hash | 4 ++--
 package/lapack/lapack.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lapack/lapack.hash b/package/lapack/lapack.hash
index 4d4d2c0596..243f6998ef 100644
--- a/package/lapack/lapack.hash
+++ b/package/lapack/lapack.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  cd005cd021f144d7d5f7f33c943942db9f03a28d110d6a3b80d718a295f7f714  lapack-3.10.1.tar.gz
-sha256  44f7c08ab11e40b21d8bf8220712929ba8d0204645d2174869acf915562d0969  LICENSE
+sha256  2ca6407a001a474d4d4d35f3a61550156050c48016d949f0da0529c0aa052422  lapack-3.12.1.tar.gz
+sha256  978539245c405775bf347b1256c36df4daf8b69a64b099e94b1d53742201621e  LICENSE
diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 3c1ab1fc67..e3b914a94f 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LAPACK_VERSION = 3.10.1
+LAPACK_VERSION = 3.12.1
 LAPACK_LICENSE = BSD-3-Clause
 LAPACK_LICENSE_FILES = LICENSE
 LAPACK_SITE = $(call github,Reference-LAPACK,lapack,v$(LAPACK_VERSION))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
