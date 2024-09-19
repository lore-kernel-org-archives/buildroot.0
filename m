Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F29CE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7773942F80;
	Thu, 19 Sep 2024 09:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txtvVReMRGL9; Thu, 19 Sep 2024 09:17:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EF0C43251
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EF0C43251;
	Thu, 19 Sep 2024 09:17:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 158981BF97E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB1F8615D8
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RCcXnO4nRn0 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEF9A615E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEF9A615E1
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC87583C6C; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:43 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 29a1e2663584aebfb683a9117ffa617187779304
X-Git-Newrev: 588c331e423e7206d54abdd0efbcdeca87386736
X-Patchwork-Hint: ignore
Message-Id: <20240919091606.DC87583C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/c-icap-modules:
 fix Additional typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=588c331e423e7206d54abdd0efbcdeca87386736
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e277ef8affc38ecae5b70943d13fb3a8b78def4a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/c-icap-modules/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/c-icap-modules/Config.in b/package/c-icap-modules/Config.in
index 616456b4dc..7114131f04 100644
--- a/package/c-icap-modules/Config.in
+++ b/package/c-icap-modules/Config.in
@@ -2,6 +2,6 @@ config BR2_PACKAGE_C_ICAP_MODULES
 	bool "c-icap-modules"
 	depends on BR2_PACKAGE_C_ICAP
 	help
-	  Additionals modules for c-icap server.
+	  Additional modules for c-icap server.
 
 	  http://c-icap.sourceforge.net/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
