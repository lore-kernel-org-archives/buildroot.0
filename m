Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF10C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FC0C83F5D;
	Fri, 11 Jul 2025 10:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vosd3OpEa6K7; Fri, 11 Jul 2025 10:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EF2183EAB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EF2183EAB;
	Fri, 11 Jul 2025 10:21:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 184B01E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE0CF40E10
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q7Okjlmi9u8w for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA65540C9E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA65540C9E
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E870086377; Fri, 11 Jul 2025 10:21:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Jul 2025 11:36:15 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 07cde1ad1efe24d826ca99166534b3f0212cb5f7
X-Git-Newrev: a169f37f18f39d2c721356e86fd1331cd0386298
X-Patchwork-Hint: ignore
Message-Id: <20250711102103.E870086377@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/jose: add CPE
 identifier
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a169f37f18f39d2c721356e86fd1331cd0386298
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

cpe:2.3:a:latchset:jose:14:*:*:*:*:*:*:* is a valid CPE ID.

See:
https://nvd.nist.gov/products/cpe/detail/7E6A7E16-E8B0-47BA-B7C7-0D4102933031

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 23e6d91c69dc275c8fa5b3a172460976931fe1c1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jose/jose.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jose/jose.mk b/package/jose/jose.mk
index 9fd9d1dcaa..88050be5ed 100644
--- a/package/jose/jose.mk
+++ b/package/jose/jose.mk
@@ -12,5 +12,6 @@ JOSE_LICENSE_FILES = COPYING
 JOSE_INSTALL_STAGING = YES
 JOSE_DEPENDENCIES = host-pkgconf zlib jansson openssl
 JOSE_CONF_OPTS = -Ddocs=disabled
+JOSE_CPE_ID_VENDOR = latchset
 
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
