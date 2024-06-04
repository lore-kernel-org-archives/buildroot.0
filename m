Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D9BC25B78
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 14:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A75081F72;
	Tue,  4 Jun 2024 14:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gR1foorWxR7Q; Tue,  4 Jun 2024 14:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27EEF81F44
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27EEF81F44;
	Tue,  4 Jun 2024 14:40:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 810EB1BF869
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 14:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36FAE81EB6
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 14:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5uV9ayhLMBN for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 14:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E4B181EA9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E4B181EA9
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 14:40:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1441687AD4; Tue,  4 Jun 2024 14:40:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Jun 2024 16:33:35 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 2fcec25f6a82e3be4d0cfa947daca2174c89d01a
X-Git-Newrev: 6750207e0254509f12ee9494c4b6676384708548
X-Patchwork-Hint: ignore
Message-Id: <20240604144020.1441687AD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/am33x-cm3: switch
 upstream
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

commit: https://git.buildroot.net/buildroot/commit/?id=6750207e0254509f12ee9494c4b6676384708548
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The upstream host, arago-project.org, has vanished, bringing down the
git repository with it.

Switch to another, github-hosted repository, that has the commit we're
interested in.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit b1977d933b4381e5b8b4f7d0a99ecadd17827b2e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/am33x-cm3/am33x-cm3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/am33x-cm3/am33x-cm3.mk b/package/am33x-cm3/am33x-cm3.mk
index 629a83238c..d5ace7bb0e 100644
--- a/package/am33x-cm3/am33x-cm3.mk
+++ b/package/am33x-cm3/am33x-cm3.mk
@@ -6,7 +6,7 @@
 
 # This should correpsond to v05.00.00.02
 AM33X_CM3_VERSION = 11107db2f1e9e58ee75d4fe9cc38423c9a6e4365
-AM33X_CM3_SITE = http://arago-project.org/git/projects/am33x-cm3.git
+AM33X_CM3_SITE = https://github.com/RobertCNelson/am33x-cm3
 AM33X_CM3_SITE_METHOD = git
 AM33X_CM3_LICENSE = TI Publicly Available Software License
 AM33X_CM3_LICENSE_FILES = License.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
