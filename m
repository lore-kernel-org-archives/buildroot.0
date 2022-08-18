Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6707AC00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C1A82F99;
	Thu, 18 Aug 2022 06:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C1A82F99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bwcE7hfMEXqT; Thu, 18 Aug 2022 06:23:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E9D18197D;
	Thu, 18 Aug 2022 06:23:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E9D18197D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4D3E71BF3FC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 237D460808
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:22:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 237D460808
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 52Lx43p10bns for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:22:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AECD61141
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AECD61141
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DAD26878F7; Thu, 18 Aug 2022 06:07:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 07:57:27 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1e0ee35a9dba9f5f8b91e751b17950a540063546
X-Git-Newrev: c70106eaec9754530a4d3a8e27bc1b7171893919
X-Patchwork-Hint: ignore
Message-Id: <20220818060740.DAD26878F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] DEVELOPERS: update
 entries for Ricardo Martincoski
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

commit: https://git.buildroot.net/buildroot/commit/?id=c70106eaec9754530a4d3a8e27bc1b7171893919
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit bfa8494f4b1962e34b5febe13fa394914d03398d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2cf9d14013..938782b1fd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2407,21 +2407,16 @@ N:	Renaud Aubin <root@renaud.io>
 F:	package/libhttpparser/
 
 N:	Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
+F:	.flake8
 F:	package/atop/
 F:	package/thermald/
-
-N:	Ricardo Martincoski <ricardo.martincoski@gmail.com>
 F:	support/testing/infra/
 F:	support/testing/run-tests
-F:	support/testing/tests/core/test_file_capabilities.py
-F:	support/testing/tests/download/
-F:	support/testing/tests/package/*_python*.py
 F:	support/testing/tests/package/test_atop.py
-F:	support/testing/tests/package/test_syslog_ng.py
-F:	support/testing/tests/package/test_tmux.py
 F:	support/testing/tests/utils/test_check_package.py
 F:	utils/check-package
 F:	utils/checkpackagelib/
+F:	utils/docker-run
 
 N:	Richard Braun <rbraun@sceen.net>
 F:	package/curlftpfs/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
