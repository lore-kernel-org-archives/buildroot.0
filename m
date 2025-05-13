Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 875C5C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35D5284398;
	Mon, 19 May 2025 10:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qih7Kv2M1xij; Mon, 19 May 2025 10:59:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4272D83A52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4272D83A52;
	Mon, 19 May 2025 10:59:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 421AFE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE2D2410E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_7_yAd1FsiJ for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 464B041518
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 464B041518
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 448F88348A; Mon, 19 May 2025 10:40:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 May 2025 18:56:24 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a8cfe9986c9de8f575dc94e242c0ccc26e03b19d
X-Git-Newrev: 7cb93a3804f9dd62ce18a069b911c3ce9f087acc
X-Patchwork-Hint: ignore
Message-Id: <20250519104002.448F88348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/connman: update
 homepage url
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7cb93a3804f9dd62ce18a069b911c3ce9f087acc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The old connman homepage url [1] now redirects to an Intel open source
software portal which no longer contains the connman project.

The project is now hosted at [2]. For reference, the upstream
commit [3] removed references to [1].

This commit updates the Config.in homepage url to [2].

[1] https://01.org/connman
[2] https://git.kernel.org/pub/scm/network/connman/connman.git
[3] https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=7d35eba0b93580c7dae5763b517ea5571dc4a273

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/connman/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index af3e1f69f6..b01cbb344c 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_CONNMAN
 	  for managing internet connections within embedded devices
 	  running the Linux operating system.
 
-	  https://01.org/connman
+	  https://git.kernel.org/pub/scm/network/connman/connman.git
 
 if BR2_PACKAGE_CONNMAN
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
