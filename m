Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C50FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2800D40545;
	Mon, 25 Jul 2022 22:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2800D40545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBt0b-keaPz7; Mon, 25 Jul 2022 22:29:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5366940AAC;
	Mon, 25 Jul 2022 22:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5366940AAC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 216F51BF9AF
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD10D610C1
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:29:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD10D610C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3xOhEseBIECf for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:29:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC56C60E2E
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:29:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC56C60E2E
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 832E085E6B; Mon, 25 Jul 2022 22:15:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 23:49:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea36681572255ec906167308c07adc42ed2ac9f9
X-Git-Newrev: bfa8494f4b1962e34b5febe13fa394914d03398d
X-Patchwork-Hint: ignore
Message-Id: <20220725221520.832E085E6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: update entries for Ricardo
 Martincoski
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfa8494f4b1962e34b5febe13fa394914d03398d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 98227e9ba2..19f383aef6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2473,21 +2473,16 @@ N:	Renaud Aubin <root@renaud.io>
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
