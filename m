Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBD9C47422
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 08:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FF9B84FA5;
	Fri, 26 Jan 2024 08:49:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FF9B84FA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aRzjUEvp-lH5; Fri, 26 Jan 2024 08:49:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C981E84D49;
	Fri, 26 Jan 2024 08:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C981E84D49
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C4E21BF990
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:48:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 452574367C
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 08:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 452574367C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zD4xvzl7qQPV for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 346E9402B1
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 346E9402B1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F17086530; Fri, 26 Jan 2024 08:48:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 26 Jan 2024 09:45:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6116963df34ed8c64393b0ce1cfa117db7936bab
X-Git-Newrev: 8ceab1f2cd105f683b80e485422c8e10d2048b01
X-Patchwork-Hint: ignore
Message-Id: <20240126084846.1F17086530@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kvazaar: bump to version 2.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=8ceab1f2cd105f683b80e485422c8e10d2048b01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of LICENSE (new line added with
https://github.com/ultravideo/kvazaar/commit/7856583ee05f627bbab153bedb68d586ccb3750d)

https://github.com/ultravideo/kvazaar/releases/tag/v2.2.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kvazaar/kvazaar.hash | 8 ++++----
 package/kvazaar/kvazaar.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kvazaar/kvazaar.hash b/package/kvazaar/kvazaar.hash
index 20b8e5918e..4956fc7091 100644
--- a/package/kvazaar/kvazaar.hash
+++ b/package/kvazaar/kvazaar.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  a76998462924ab8409cf8de4947ba5a5023daa33207676e9c4eefc2bbd46c834  kvazaar-2.1.0.tar.xz
-sha256  4caf7852236f62bfd77aac10a7b9a42372b00aa461ad8912780cd865a39062ff  LICENSE
-sha256  16f569c87d5ec20b7474b55ee0a8877b8f8b4dc13f9567ebe0b8fe8afdeb34d2  LICENSE.greatest
-sha256  f84c0f33873a015f399d8171cf321af2f09ef915ae7ad5a9edaa7d0286cf9d5e  LICENSE.x264asm
+sha256  f8fb72184f10b2fac295452bd0d5936d4449ed849754d5d1f3e7035998983573  kvazaar-2.2.0.tar.xz
+sha256  3c1dc3d7f8a3d08c14f4fbe9942f45764d8a21a3296e8d83446f33fd65f21c38  LICENSE
+sha256  16f569c87d5ec20b7474b55ee0a8877b8f8b4dc13f9567ebe0b8fe8afdeb34d2  LICENSE.EXT.greatest
+sha256  f84c0f33873a015f399d8171cf321af2f09ef915ae7ad5a9edaa7d0286cf9d5e  LICENSE.EXT.x264asm
diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
index 17e2ea8caf..6bcc6066a4 100644
--- a/package/kvazaar/kvazaar.mk
+++ b/package/kvazaar/kvazaar.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-KVAZAAR_VERSION = 2.1.0
+KVAZAAR_VERSION = 2.2.0
 KVAZAAR_SOURCE = kvazaar-$(KVAZAAR_VERSION).tar.xz
 KVAZAAR_SITE = https://github.com/ultravideo/kvazaar/releases/download/v$(KVAZAAR_VERSION)
 KVAZAAR_LICENSE = BSD-3-Clause, ISC (greatest, x264asm)
-KVAZAAR_LICENSE_FILES = LICENSE LICENSE.greatest LICENSE.x264asm
+KVAZAAR_LICENSE_FILES = LICENSE LICENSE.EXT.greatest LICENSE.EXT.x264asm
 KVAZAAR_INSTALL_STAGING = YES
 KVAZAAR_DEPENDENCIES = host-pkgconf
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
