Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9AE8CE8D61
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5B5B412AF;
	Thu, 19 Sep 2024 09:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJNnoUaWJKca; Thu, 19 Sep 2024 09:15:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D572412A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D572412A7;
	Thu, 19 Sep 2024 09:15:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 242871BF97E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E40E427F4
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsx2d00GUx92 for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B12CC427F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B12CC427F9
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9E04583C67; Thu, 19 Sep 2024 09:14:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:09 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 0f20caa178251015022741cb3b161b33856a9248
X-Git-Newrev: 7fab58374d0349769d01ab174bf00e01cf11115d
X-Patchwork-Hint: ignore
Message-Id: <20240919091451.9E04583C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x]
 docs/manual/migrating.adoc: fix occurrence typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=7fab58374d0349769d01ab174bf00e01cf11115d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Occurrence is with double-c-double-r.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6ee748089347966eea5aced1e42fc25d9cbfc2aa)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/migrating.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index ed2be1c6c9..d99c779799 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -62,7 +62,7 @@ $ echo 'name: NAME_OF_YOUR_TREE' >external.desc
 Be careful when choosing a name: It has to be unique and be made
 with only ASCII characters from the set +[A-Za-z0-9_]+.
 
- * Then, change every occurence of +BR2_EXTERNAL+ in your br2-external
+ * Then, change every occurrence of +BR2_EXTERNAL+ in your br2-external
    tree with the new variable:
 +
 ----
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
