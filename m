Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9DFC27C55
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 13:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C985B831B4;
	Sat,  8 Jun 2024 13:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwa7G8Y8dA1f; Sat,  8 Jun 2024 13:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FEE384360
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FEE384360;
	Sat,  8 Jun 2024 13:01:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D21681BF47E
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:01:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB409426F5
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:01:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6P-q_HZGw4qB for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 13:01:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5752426E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5752426E2
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:01:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF87187DD0; Sat,  8 Jun 2024 13:01:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 15:01:04 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7b3a49aa4394988a526d3a96db771821c88194da
X-Git-Newrev: 96ed028f030e757650cdcf410076853f97a31ded
X-Patchwork-Hint: ignore
Message-Id: <20240608130122.AF87187DD0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libedit: set
 LIBEDIT_CPE_ID_VALID
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

commit: https://git.buildroot.net/buildroot/commit/?id=96ed028f030e757650cdcf410076853f97a31ded
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

cpe:2.3:a:libedit_project:libedit is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/42ACF08B-DD62-48D3-8568-32DAFD116956

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 300cb3dc16efeb592bddcb8be07310c21c2c0d7a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libedit/libedit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libedit/libedit.mk b/package/libedit/libedit.mk
index 576a163173..d662329172 100644
--- a/package/libedit/libedit.mk
+++ b/package/libedit/libedit.mk
@@ -10,6 +10,7 @@ LIBEDIT_INSTALL_STAGING = YES
 LIBEDIT_DEPENDENCIES = ncurses
 LIBEDIT_LICENSE = BSD-3-Clause
 LIBEDIT_LICENSE_FILES = COPYING
+LIBEDIT_CPE_ID_VALID = YES
 
 # We're patching configure.ac
 LIBEDIT_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
