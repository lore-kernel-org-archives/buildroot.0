Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D95EE01E8
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F208B60902;
	Tue, 10 Sep 2024 20:52:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xIbwQxp9Av0l; Tue, 10 Sep 2024 20:52:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EF5060A7E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EF5060A7E;
	Tue, 10 Sep 2024 20:52:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 359C91BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DCC140B35
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hn51hIdQtW1S for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D76F408D8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D76F408D8
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A63386F61; Tue, 10 Sep 2024 20:51:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 777c081abef77511da585c53b9de4e44b913af46
X-Git-Newrev: 6ee748089347966eea5aced1e42fc25d9cbfc2aa
X-Patchwork-Hint: ignore
Message-Id: <20240910205130.8A63386F61@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/migrating.adoc: fix occurrence
 typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ee748089347966eea5aced1e42fc25d9cbfc2aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Occurrence is with double-c-double-r.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
