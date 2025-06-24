Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F45C7EE30
	for <buildroot@archiver.kernel.org>; Thu, 26 Jun 2025 19:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F404607D5;
	Thu, 26 Jun 2025 19:49:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZvfRYwddQY4t; Thu, 26 Jun 2025 19:49:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B21761210
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B21761210;
	Thu, 26 Jun 2025 19:49:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87E3E10A
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8589A843D9
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzRt5CIunPWD for <buildroot@buildroot.org>;
 Thu, 26 Jun 2025 19:49:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FECF84316
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9FECF84316
 for <buildroot@buildroot.org>; Thu, 26 Jun 2025 19:49:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9BDCF8467C; Thu, 26 Jun 2025 19:49:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 24 Jun 2025 20:37:28 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: baa4ed68ea2835b243defcdf49cf4d5c25cf9104
X-Git-Newrev: 7b7c8f3346f3da4a0218cddf57dad6668a9346a7
X-Patchwork-Hint: ignore
Message-Id: <20250626194921.9BDCF8467C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x]
 package/docker-credential-gcr: add LICENSE hash
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7b7c8f3346f3da4a0218cddf57dad6668a9346a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The hash has for the license file been missing since the package was
introduced in commit 992d43b37356 (package/docker-credential-gcr: new
package).

Add it now.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9cfaccee78fe116f75c39cf7ac068e282bf4f243)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
