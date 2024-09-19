Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B1ECE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 601C7433BD;
	Thu, 19 Sep 2024 09:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPFWj1AFUWPW; Thu, 19 Sep 2024 09:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10CBD41484
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10CBD41484;
	Thu, 19 Sep 2024 09:19:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2083D1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97E7C849C2
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lloUkBGlImew for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07F1F84A0E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07F1F84A0E
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0525A83C6C; Thu, 19 Sep 2024 09:16:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:05:03 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 81dbc8d0b2c593ebc938310d1da3f5278bbee7e0
X-Git-Newrev: 783c0eb7c7b582ff14a34edc95bdf5973cc4cbfd
X-Patchwork-Hint: ignore
Message-Id: <20240919091608.0525A83C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/hostapd: fix
 proprietary typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=783c0eb7c7b582ff14a34edc95bdf5973cc4cbfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ffc872d5f87a565a766ac21cd9d4b2a54c9b4f48)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hostapd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hostapd/Config.in b/package/hostapd/Config.in
index f4206ceea5..660274ddf0 100644
--- a/package/hostapd/Config.in
+++ b/package/hostapd/Config.in
@@ -54,7 +54,7 @@ config BR2_PACKAGE_HOSTAPD_ACS
 	depends on BR2_PACKAGE_HOSTAPD_DRIVER_NL80211
 	help
 	  Enable support for standard ACS (Automatic Channel Selection).
-	  Some propietary drivers use a custom algorithm which requires
+	  Some proprietary drivers use a custom algorithm which requires
 	  channel to be set to '0' (which enables ACS in the config),
 	  causing hostapd to use the standard one which doesn't work
 	  for those cases.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
