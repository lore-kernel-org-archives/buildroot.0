Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20546C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 13:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2C9A40A4D;
	Mon, 18 Mar 2024 13:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7tmT2P2nH9_A; Mon, 18 Mar 2024 13:31:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B314940A50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B314940A50;
	Mon, 18 Mar 2024 13:31:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F1F91BF363
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C0134052D
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KOZkwuO4pS9X for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 13:31:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CFCA403C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CFCA403C8
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 13:31:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 162EA82A70; Mon, 18 Mar 2024 13:31:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 14:28:34 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 83c305da5b7b866dcbebcd8c2e0f0b797f99c713
X-Git-Newrev: 526b91ba8a18e830b31b3b02eba1b0b41112c088
X-Patchwork-Hint: ignore
Message-Id: <20240318133140.162EA82A70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/freetype: use
 correct license format for dual licensed package
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

commit: https://git.buildroot.net/buildroot/commit/?id=526b91ba8a18e830b31b3b02eba1b0b41112c088
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit def3b9d9a8f17398f280950b35eae0cf22d67bd8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/freetype.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 36ef3cb527..759ce6db5d 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -9,7 +9,7 @@ FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPTS = CCexe="$(HOSTCC)"
-FREETYPE_LICENSE = Dual FTL/GPL-2.0+
+FREETYPE_LICENSE = FTL or GPL-2.0+
 FREETYPE_LICENSE_FILES = LICENSE.TXT docs/FTL.TXT docs/GPLv2.TXT
 FREETYPE_CPE_ID_VENDOR = freetype
 FREETYPE_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
