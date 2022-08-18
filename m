Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BB3C00140
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 06:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7DA541B89;
	Thu, 18 Aug 2022 06:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7DA541B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xOxf_JFmTGEA; Thu, 18 Aug 2022 06:17:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE66A41B59;
	Thu, 18 Aug 2022 06:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE66A41B59
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC6B21BF3FC
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C75F141B61
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 06:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C75F141B61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id llm83nTC6ccx for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 06:17:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D74DA41B4C
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 06:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D74DA41B4C
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 55A3687736; Thu, 18 Aug 2022 06:02:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Aug 2022 07:57:32 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 7353d57b2cb570ada170b5a723f92db0c9f66c1a
X-Git-Newrev: 8840f12aa1adbdc5f0e9558b122a92a5381c51a7
X-Patchwork-Hint: ignore
Message-Id: <20220818060241.55A3687736@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] DEVELOPERS: update
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

commit: https://git.buildroot.net/buildroot/commit/?id=8840f12aa1adbdc5f0e9558b122a92a5381c51a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit bfa8494f4b1962e34b5febe13fa394914d03398d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 19da0547f1..792c74ee4d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2432,21 +2432,16 @@ N:	Renaud Aubin <root@renaud.io>
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
