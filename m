Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A6CCF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E2AB6417B4;
	Sat, 12 Oct 2024 14:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DD-1pFK4UocJ; Sat, 12 Oct 2024 14:04:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 486B3417BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 486B3417BD;
	Sat, 12 Oct 2024 14:04:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0566A1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C432A404B5
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJgw7ESK6ndU for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1AA14059B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1AA14059B
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:03:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDFAA8192F; Sat, 12 Oct 2024 14:03:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:57:26 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 066e72d2dde8c89981964a8254ad6025471a4816
X-Git-Newrev: ece45f77a651cd06f05362061e39826829a12e8f
X-Patchwork-Hint: ignore
Message-Id: <20241012140334.BDFAA8192F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 support/testing/tests/package/test_weston/overlay/etc/weston.ini: fix
 'independent' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=ece45f77a651cd06f05362061e39826829a12e8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0ab62e5d257bd36ca8fe5f570d18f6619fa11fbe)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_weston/overlay/etc/weston.ini | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_weston/overlay/etc/weston.ini b/support/testing/tests/package/test_weston/overlay/etc/weston.ini
index 534b5c1f4a..1d710ca727 100644
--- a/support/testing/tests/package/test_weston/overlay/etc/weston.ini
+++ b/support/testing/tests/package/test_weston/overlay/etc/weston.ini
@@ -1,5 +1,5 @@
 # The shell "clock-format" is set to "none", in order to have stable
-#  display output, independant from the time. The display output can
+#  display output, independent from the time. The display output can
 # then be reliably checked with VKMS CRC.
 # "startup-animation" and "close-animation" are set to "none" for
 # faster transitions (fade animations with a software GLES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
