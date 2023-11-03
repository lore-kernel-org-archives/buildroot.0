Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21321C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 09:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA29F707E8;
	Fri,  3 Nov 2023 09:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA29F707E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wVPTSdeuIdrX; Fri,  3 Nov 2023 09:32:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B817707FC;
	Fri,  3 Nov 2023 09:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B817707FC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AA1B1BF99A
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1E2D435B2
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:31:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1E2D435B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JOjc9H1bsdp5 for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 09:31:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18FAB416F8
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 09:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18FAB416F8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 000498655A; Fri,  3 Nov 2023 09:31:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Nov 2023 10:25:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83dc4d9a3990a89ffa6c83e5992f8628e7acfdde
X-Git-Newrev: fcc4ea595a07f47c86f4d52084dc1317473d2f40
X-Patchwork-Hint: ignore
Message-Id: <20231103093144.000498655A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/civetweb: bump to version 1.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=fcc4ea595a07f47c86f4d52084dc1317473d2f40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update hash of LICENSE.md (Additional components Copyright (C) Lua.org,
PUC-Rio, with MIT license added with
https://github.com/civetweb/civetweb/commit/82ba5a04c9a1ca980d8dfe00c18e086017e8ab25)

https://github.com/civetweb/civetweb/releases/tag/v1.16

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/civetweb/civetweb.hash | 4 ++--
 package/civetweb/civetweb.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/civetweb/civetweb.hash b/package/civetweb/civetweb.hash
index bdf6d77427..0daa6efee2 100644
--- a/package/civetweb/civetweb.hash
+++ b/package/civetweb/civetweb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  90a533422944ab327a4fbb9969f0845d0dba05354f9cacce3a5005fa59f593b9  civetweb-1.15.tar.gz
-sha256  24d3d2aee56ae3cddcdf3392c1250877818108314233cf15f2bc9eb3ac298934  LICENSE.md
+sha256  f0e471c1bf4e7804a6cfb41ea9d13e7d623b2bcc7bc1e2a4dd54951a24d60285  civetweb-1.16.tar.gz
+sha256  bc24af9ffb777f4842f8556ac752efd5ea212c55d2eccfae58cc2c2a24ea1f03  LICENSE.md
diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
index a299de85e9..633ae21c00 100644
--- a/package/civetweb/civetweb.mk
+++ b/package/civetweb/civetweb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIVETWEB_VERSION = 1.15
+CIVETWEB_VERSION = 1.16
 CIVETWEB_SITE = $(call github,civetweb,civetweb,v$(CIVETWEB_VERSION))
 CIVETWEB_LICENSE = MIT
 CIVETWEB_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
