Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6DEC7114A
	for <buildroot@archiver.kernel.org>; Fri, 13 Jun 2025 21:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83A458443E;
	Fri, 13 Jun 2025 21:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cve-u8euQxBm; Fri, 13 Jun 2025 21:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A3228443C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A3228443C;
	Fri, 13 Jun 2025 21:36:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2196F151
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 083EC4007E
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:36:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LnMv4Nu_fMdX for <buildroot@buildroot.org>;
 Fri, 13 Jun 2025 21:36:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5526E40167
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5526E40167
 for <buildroot@buildroot.org>; Fri, 13 Jun 2025 21:36:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 456E3838A3; Fri, 13 Jun 2025 21:36:46 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Jun 2025 23:33:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1dff142a1f0b68d7a2fe2a121cdb86cde8a4639
X-Git-Newrev: 9cfaccee78fe116f75c39cf7ac068e282bf4f243
X-Patchwork-Hint: ignore
Message-Id: <20250613213646.456E3838A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-credential-gcr: add LICENSE
 hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cfaccee78fe116f75c39cf7ac068e282bf4f243
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hash has for the license file been missing since the package was
introduced in commit 992d43b37356 (package/docker-credential-gcr: new
package).

Add it now.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-credential-gcr/docker-credential-gcr.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/docker-credential-gcr/docker-credential-gcr.hash b/package/docker-credential-gcr/docker-credential-gcr.hash
index 2796b5746c..b2ad975851 100644
--- a/package/docker-credential-gcr/docker-credential-gcr.hash
+++ b/package/docker-credential-gcr/docker-credential-gcr.hash
@@ -1,2 +1,3 @@
 # Locally computed
 sha256  126fdbf7351d2c7aaee6c525d9660738519eae53eeef77920b105fd4d1bc5dbd  docker-credential-gcr-v2.1.26-git4-go2.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
