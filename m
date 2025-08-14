Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F481CA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8F4260757;
	Thu, 14 Aug 2025 20:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRYxcUHZQtMq; Thu, 14 Aug 2025 20:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18D9B60751
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18D9B60751;
	Thu, 14 Aug 2025 20:06:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DD7193E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0418780D0F
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hLdDwOX64Oz for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3433680C8A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3433680C8A
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 268428758C; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:29:32 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: de11e142c39e9a4b8815f2561844b88a5d53e5e1
X-Git-Newrev: 34d5425d17f13cc73511c8bbc02bf7fdf9ab83f4
X-Patchwork-Hint: ignore
Message-Id: <20250814200604.268428758C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/flatcc: add CPE
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

commit: https://git.buildroot.net/buildroot/commit/?id=34d5425d17f13cc73511c8bbc02bf7fdf9ab83f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The cpe:2.3:a:flatcc_project:flatcc:*:*:*:*:*:*:*:*
valid for this package.

See https://nvd.nist.gov/products/cpe/detail/AA7FC7B6-537C-4735-B615-689D3A91C994

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a008f3e7cb3b77ff487f7028eed4d6bb386b17ff)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/flatcc/flatcc.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/flatcc/flatcc.mk b/package/flatcc/flatcc.mk
index 06be1a1338..b2d1efe00d 100644
--- a/package/flatcc/flatcc.mk
+++ b/package/flatcc/flatcc.mk
@@ -13,6 +13,8 @@ FLATCC_DEPENDENCIES = host-flatcc
 FLATCC_CONF_OPTS = -DFLATCC_ALLOW_WERROR=OFF
 HOST_FLATCC_CONF_OPTS = -DFLATCC_ALLOW_WERROR=OFF
 
+FLATCC_CPE_ID_VALID = YES
+
 # Disable build of tests and samples
 FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
 HOST_FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
