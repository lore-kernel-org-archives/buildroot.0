Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5496FE77180
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19538845F1;
	Thu, 12 Dec 2024 21:32:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Emc0zujiDHOp; Thu, 12 Dec 2024 21:32:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 280A4845EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 280A4845EC;
	Thu, 12 Dec 2024 21:32:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F55D75
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1A394354A
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUSXJGzmpyjS for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FECD43561
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8FECD43561
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:32:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D01E86E73; Thu, 12 Dec 2024 21:32:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 22:29:31 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: 7420216a0aec6926b7330e3629c0ed3a3c8167db
X-Git-Newrev: 21904321f5eb7bd228f9b8ee23cf1eed2706eac3
X-Patchwork-Hint: ignore
Message-Id: <20241212213225.8D01E86E73@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/transmission: fix
 'environment' and 'RECOMMENDED' typos
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

commit: https://git.buildroot.net/buildroot/commit/?id=21904321f5eb7bd228f9b8ee23cf1eed2706eac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9a46343df311961a8efb2a5e75c179eaa40b9a59)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/S92transmission | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/S92transmission b/package/transmission/S92transmission
index 85ff40ec16..1c24c16d98 100644
--- a/package/transmission/S92transmission
+++ b/package/transmission/S92transmission
@@ -16,11 +16,11 @@
 # http://trac.transmissionbt.com/wiki/ConfigFiles
 # For a guide on how set the preferences, visit:
 # http://trac.transmissionbt.com/wiki/EditConfigFiles
-# For the available environement variables, visit:
+# For the available environment variables, visit:
 # http://trac.transmissionbt.com/wiki/EnvironmentVariables
 #
 # The name of the user that should run Transmission.
-# It's RECOMENDED to run Transmission in it's own user,
+# It's RECOMMENDED to run Transmission in it's own user,
 # by default, this is set to 'transmission'.
 # For the sake of security you shouldn't set a password
 # on this user
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
