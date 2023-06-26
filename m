Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE02DEB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 17:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A961402C3;
	Mon, 26 Jun 2023 17:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A961402C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3a656mY07NLt; Mon, 26 Jun 2023 17:06:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0B75416A5;
	Mon, 26 Jun 2023 17:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0B75416A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 13DC31BF951
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB418415BC
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 17:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB418415BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3pewO11K_3M7 for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 17:04:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7A73415B8
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 17:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7A73415B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C389384AE3; Mon, 26 Jun 2023 17:04:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 19:02:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5c85830a6b694fd91dc9d6477c3fb94351e99b6b
X-Git-Newrev: 59c4515e92c17c807587f27fff5ce175c39d8cf2
X-Patchwork-Hint: ignore
Message-Id: <20230626170444.C389384AE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/opensbi: Config.in: Cosmetic style fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=59c4515e92c17c807587f27fff5ce175c39d8cf2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use space intead of tab before 'if'.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/opensbi/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
index 5e6b8d158e..99c4989479 100644
--- a/boot/opensbi/Config.in
+++ b/boot/opensbi/Config.in
@@ -57,10 +57,10 @@ endif
 
 config BR2_TARGET_OPENSBI_VERSION
 	string
-	default "1.2"	if BR2_TARGET_OPENSBI_LATEST_VERSION
+	default "1.2" if BR2_TARGET_OPENSBI_LATEST_VERSION
 	default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPENSBI_CUSTOM_VERSION
-	default "custom"	if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
+	default "custom" if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
 	default BR2_TARGET_OPENSBI_CUSTOM_REPO_VERSION \
 		if BR2_TARGET_OPENSBI_CUSTOM_GIT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
