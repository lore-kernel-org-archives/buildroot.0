Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EABC8303D
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 21:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC85F83F22;
	Fri,  4 Jul 2025 21:16:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnqxRu9vfYxB; Fri,  4 Jul 2025 21:16:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF96683F23
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF96683F23;
	Fri,  4 Jul 2025 21:16:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E69427AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 21:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2778383F24
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 21:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmbklU4nrewh for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 21:16:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62E7783F21
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62E7783F21
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 21:16:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B9BE85F64; Fri,  4 Jul 2025 21:16:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 4 Jul 2025 23:14:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c10f7dfdb917cba9fcfecd5818adfbee264f4151
X-Git-Newrev: b5fc6e232f8de0220ba289e6b99c37492b56ba9f
X-Patchwork-Hint: ignore
Message-Id: <20250704211601.4B9BE85F64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opus: bump version to 1.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5fc6e232f8de0220ba289e6b99c37492b56ba9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://opus-codec.org/release/stable/2024/03/04/libopus-1_5.html
https://opus-codec.org/release/stable/2024/03/04/libopus-1_5_1.html
https://opus-codec.org/release/stable/2024/04/12/libopus-1_5_2.html

Updated license hash due to copyright year bump:
https://gitlab.xiph.org/xiph/opus/-/commit/254b5ee7b2e7c89aaddbf7a994fea0563842873f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/opus/opus.hash | 4 ++--
 package/opus/opus.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opus/opus.hash b/package/opus/opus.hash
index 7569ee08d1..ef0226281d 100644
--- a/package/opus/opus.hash
+++ b/package/opus/opus.hash
@@ -1,5 +1,5 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256  c9b32b4253be5ae63d1ff16eea06b94b5f0f2951b7a02aceef58e3a3ce49c51f  opus-1.4.tar.gz
+sha256  65c1d2f78b9f2fb20082c38cbe47c951ad5839345876e46941612ee87f9a7ce1  opus-1.5.2.tar.gz
 
 # Hash for license file
-sha256  8338ce8d922bb4416ce3dd1e5680173332435e3f0755007ac7801ccd674fe682  COPYING
+sha256  01e1167d54a096d123cf6dfbbeb19587278845c6481d2d66d545669846079551  COPYING
diff --git a/package/opus/opus.mk b/package/opus/opus.mk
index cbc07a091b..1d3133bb58 100644
--- a/package/opus/opus.mk
+++ b/package/opus/opus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPUS_VERSION = 1.4
+OPUS_VERSION = 1.5.2
 OPUS_SITE = https://downloads.xiph.org/releases/opus
 OPUS_LICENSE = BSD-3-Clause
 OPUS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
