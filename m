Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32940CF58C6
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 18:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23E5F61163;
	Wed, 19 Nov 2025 18:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8K4qFgJxLEiL; Wed, 19 Nov 2025 18:25:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14C6261161
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14C6261161;
	Wed, 19 Nov 2025 18:25:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA5812A9
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 18:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90F6E81B14
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 18:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1hCL8UaMTLs for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 18:25:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9606C81AF6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9606C81AF6
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 18:25:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DF16851A6; Wed, 19 Nov 2025 18:25:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 19 Nov 2025 19:16:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ff1bd328a0c835ee802567d3e30af882ea8bc58
X-Git-Newrev: 8e5e8ea2cf3158feb03525802d03ea0940811cc0
X-Patchwork-Hint: ignore
Message-Id: <20251119182526.6DF16851A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rauc: bump to 1.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e5e8ea2cf3158feb03525802d03ea0940811cc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/rauc/rauc/releases/tag/v1.15

The COPYING license hash file is updated, due to upstream update:
https://github.com/rauc/rauc/commit/fe86f277258dfe96d0f9ac9bfa930733598d7160

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
Tested-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Julien: add link to upstream commit updating the license]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 6795bc9485..c0eee0d8d8 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  f48c85573d82bf9378e907f6eba0cbe4f2021839a1e9fe3f8431f61dd54ef42c  rauc-1.14.tar.xz
-sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
+sha256  4ae0b5246c668acb544ce0230a3bada81c78e8afd4755e5afa2218cbd686fd70  rauc-1.15.tar.xz
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index d20b0121df..10d4a2db95 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.14
+RAUC_VERSION = 1.15
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
