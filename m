Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E91CAC592
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 18:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 209D4410CA;
	Tue, 16 Sep 2025 18:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ro6WXSPtDFv9; Tue, 16 Sep 2025 18:43:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A96840C0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A96840C0E;
	Tue, 16 Sep 2025 18:43:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 341A2199
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 18:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25C7241643
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 18:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0HwnPf0hWAd for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 18:43:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 658EA40AE8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 658EA40AE8
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 18:43:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53F5F847A5; Tue, 16 Sep 2025 18:43:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 20:38:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef26611cc37574cc7209200847339808b4d98f38
X-Git-Newrev: d6c05d06d06313f4ae0ffafd416e34dbf60e3182
X-Patchwork-Hint: ignore
Message-Id: <20250916184302.53F5F847A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cjson: update deprecated CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6c05d06d06313f4ae0ffafd416e34dbf60e3182
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CPE 'cpe:2.3:a:cjson_project:cjson:0.0.0:*:*:*:*:*:*:*' has been
deprecated in favour of 'cpe:2.3:a:davegamble:cjson:0.0.0:*:*:*:*:*:*:*''

See https://nvd.nist.gov/products/cpe/detail/70BC45DA-D915-4A1D-96AF-84A6CECEE148

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cjson/cjson.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index 35304ec618..b87ce97ca2 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -9,7 +9,7 @@ CJSON_SITE = $(call github,DaveGamble,cjson,v$(CJSON_VERSION))
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE = MIT
 CJSON_LICENSE_FILES = LICENSE
-CJSON_CPE_ID_VALID = YES
+CJSON_CPE_ID_VENDOR = davegamble
 # Set ENABLE_CUSTOM_COMPILER_FLAGS to OFF in particular to disable
 # -fstack-protector-strong which depends on BR2_TOOLCHAIN_HAS_SSP
 CJSON_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
