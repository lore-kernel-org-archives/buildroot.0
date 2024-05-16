Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E60C25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 12:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37C1E60E55;
	Thu, 16 May 2024 12:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoeJgqxYdD8C; Thu, 16 May 2024 12:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D97A560E7B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D97A560E7B;
	Thu, 16 May 2024 12:25:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 156051BF97C
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 12:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7FEA6063E
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 12:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eSC9z7HrhuAr for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 12:25:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF4A160E51
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF4A160E51
 for <buildroot@buildroot.org>; Thu, 16 May 2024 12:25:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A762A87414; Thu, 16 May 2024 12:25:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 16 May 2024 14:22:40 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4415daf635e56f55993eafdd196864ebab5b6d3c
X-Git-Newrev: 27e7c199cf14804e038c5b550e050c76ec27ac9b
X-Patchwork-Hint: ignore
Message-Id: <20240516122509.A762A87414@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] DEVELOPERS: add myself
 for Armadeus boards
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
Content-Type: multipart/mixed; boundary="===============3118354140085229307=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3118354140085229307==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=27e7c199cf14804e038c5b550e050c76ec27ac9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 74c0cf2152415ab99c93d4d03acd7bfec39fd511)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8f58b47fe0..88c266293b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2761,6 +2761,8 @@ F:	support/testing/tests/package/sample_nu.nu
 F:	support/testing/tests/package/test_nu.py
 
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
+F:	board/armadeus/
+F:	configs/armadeus*
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
 F:	package/python-flask-login/

--===============3118354140085229307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3118354140085229307==--
