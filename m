Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC5CCE8D61
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 236B4418DD;
	Thu, 19 Sep 2024 09:17:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fuS6KFqNjO5D; Thu, 19 Sep 2024 09:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D48B41911
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D48B41911;
	Thu, 19 Sep 2024 09:17:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2361B1BF982
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E90884775
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyfx9U4LIrsq for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 764EE849C3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 764EE849C3
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61BD383C6C; Thu, 19 Sep 2024 09:16:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:07 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 32e493c90cc80dca5c4e3a2bb777eff4eaf16b58
X-Git-Newrev: f863152aaa41f08fc3873e352646e412dea91214
X-Patchwork-Hint: ignore
Message-Id: <20240919091606.61BD383C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 docs/manual/customize-outside-br.adoc: fix 'or' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=f863152aaa41f08fc3873e352646e412dea91214
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

It is OR, not OT.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 777c081abef77511da585c53b9de4e44b913af46)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/customize-outside-br.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/customize-outside-br.adoc b/docs/manual/customize-outside-br.adoc
index 5e653f1603..78065489d4 100644
--- a/docs/manual/customize-outside-br.adoc
+++ b/docs/manual/customize-outside-br.adoc
@@ -191,7 +191,7 @@ tree.
 
 For some packages, Buildroot provides a choice between two (or more)
 implementations of API-compatible such packages. For example, there is
-a choice to choose either libjpeg ot jpeg-turbo; there is one between
+a choice to choose either libjpeg or jpeg-turbo; there is one between
 openssl or libressl; there is one to select one of the known,
 pre-configured toolchains...
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
