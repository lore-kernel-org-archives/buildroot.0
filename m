Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52313C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 20:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00959400F6;
	Tue,  8 Mar 2022 20:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KLqrnjzHKlE7; Tue,  8 Mar 2022 20:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02F7F40108;
	Tue,  8 Mar 2022 20:16:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7539C1BF9B2
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 20:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6337A4035E
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 20:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JblNYqyPmFvX for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 20:16:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3A5940339
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 20:16:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C5A708380C; Tue,  8 Mar 2022 20:07:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 8 Mar 2022 21:14:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 232868ffd3ef76f060711adf5ea1e5001e21ef9d
X-Git-Newrev: 888d4aa36768b4d6932d39d25935cf6636a2af83
X-Patchwork-Hint: ignore
Message-Id: <20220308200742.C5A708380C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: bump to version 2.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=888d4aa36768b4d6932d39d25935cf6636a2af83
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/FreeRDP/FreeRDP/releases/tag/2.6.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 780061bdbb..28e733aa2f 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.6.0.tar.gz.sha256
-sha256  a4ba0a75e30ed25fffc4cd4e89d0eb92e66894caeb6c78dc5e23b6b7c04f60fe  freerdp-2.6.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.6.1.tar.gz.sha256
+sha256  e4b3b93d102bc03164f592d26d7a06d6de648bf78b1e3dcbd8d62941431c1f28  freerdp-2.6.1.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index c8978db6ce..a1791b27f0 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.6.0
+FREERDP_VERSION = 2.6.1
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
