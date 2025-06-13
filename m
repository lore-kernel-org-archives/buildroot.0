Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110B5C71136
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 21:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6488D60F16;
	Fri, 13 Jun 2025 21:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v6KLLaVKwWuu; Fri, 13 Jun 2025 21:36:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1716F60ED8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1716F60ED8;
	Fri, 13 Jun 2025 21:36:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BEA9C1BD
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B05EB405BB
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qI1EatusKG_e for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 21:36:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 156C44007E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 156C44007E
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:36:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11B5C82B9C; Fri, 13 Jun 2025 21:36:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Jun 2025 23:33:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36b0bf1f29c392b8afb8479d31c8ec8bbfc08a15
X-Git-Newrev: d1dff142a1f0b68d7a2fe2a121cdb86cde8a4639
X-Patchwork-Hint: ignore
Message-Id: <20250613213646.11B5C82B9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-credential-acr-env: add
 LICENSE hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1dff142a1f0b68d7a2fe2a121cdb86cde8a4639
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash has for the license file been missing since the package was
introduced in commit e679cd4974a9 (package/docker-credential-acr-env:
new package)

Add it now.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-credential-acr-env/docker-credential-acr-env.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-credential-acr-env/docker-credential-acr-env.hash b/package/docker-credential-acr-env/docker-credential-acr-env.hash
index eb1fdebbf8..d0fba05b9a 100644
--- a/package/docker-credential-acr-env/docker-credential-acr-env.hash
+++ b/package/docker-credential-acr-env/docker-credential-acr-env.hash
@@ -1,2 +1,3 @@
 # Localy computed
 sha256  deff9d133fdd87b6cbe454e82e72eb7b124d1aea330c17236e804071a446b4ae  docker-credential-acr-env-0.7.0-git4-go2.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
