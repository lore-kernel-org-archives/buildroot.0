Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7051AC2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:52:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C57B770678;
	Mon, 19 May 2025 10:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9CwExYPI1Pc; Mon, 19 May 2025 10:52:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDAFE70699
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDAFE70699;
	Mon, 19 May 2025 10:52:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12849193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:42:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B02440DBB
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jlsk9Mhd-N_T for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBE4F411CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBE4F411CB
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E660084BBD; Mon, 19 May 2025 10:39:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 16:11:49 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f5e7cefe778dc65b6e36a4b2af94018ed9005d0c
X-Git-Newrev: c298c0971b154c4489cad2c511df1b89ecb6e663
X-Patchwork-Hint: ignore
Message-Id: <20250519103951.E660084BBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ca-certificates: bump
 to 20241223
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c298c0971b154c4489cad2c511df1b89ecb6e663
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ca-certificates/ca-certificates.hash | 2 +-
 package/ca-certificates/ca-certificates.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index 8a5b48dd79..363f43e13a 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,4 +1,4 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha256  83de934afa186e279d1ed08ea0d73f5cf43a6fbfb5f00874b6db3711c64576f3  ca-certificates_20230311.tar.xz
+sha256  dd8286d0a9dd35c756fea5f1df3fed1510fb891f376903891b003cd9b1ad7e03  ca-certificates_20241223.tar.xz
 # Locally computed
 sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index fe115209a7..c354eb037e 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20230311
+CA_CERTIFICATES_VERSION = 20241223
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20230317T205011Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20241223T143500Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
