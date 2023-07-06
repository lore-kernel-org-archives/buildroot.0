Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9179EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A71440584;
	Thu,  6 Jul 2023 11:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A71440584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuCc-IAcvehP; Thu,  6 Jul 2023 11:51:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CFE34027F;
	Thu,  6 Jul 2023 11:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CFE34027F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DE5F1BF345
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7772B40472
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:51:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7772B40472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jjnojhUfnlaX for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:51:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE52C40136
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE52C40136
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE5B6868F0; Thu,  6 Jul 2023 11:51:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:43:39 +0200
Subject: [git commit branch/2023.05.x] DEVELOPERS: remove José Pekkarinen
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 7511b1793292e02e10eafbe5ac31303c9274a8b5
X-Git-Newrev: 6e248a121c5b57e6980a213ed7b311dce4194ae6
X-Patchwork-Hint: ignore
Message-Id: <20230706115153.AE5B6868F0@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============3511584260031669471=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3511584260031669471==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6e248a121c5b57e6980a213ed7b311dce4194ae6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

E-mails are bouncing:

<jose.pekkarinen@unikie.com>: host ASPMX.L.GOOGLE.com[74.125.133.26] said:
    550-5.1.1 The email account that you tried to reach does not exist. Please
    try 550-5.1.1 double-checking the recipient's email address for typos or
    550-5.1.1 unnecessary spaces. Learn more at 550 5.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 5206492d6a749191fc9395479438a35007417cc2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 78b5abbb21..29d367647a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1619,19 +1619,6 @@ N:	José Luis Salvador Rufo <salvador.joseluis@gmail.com>
 F:	package/zfs/
 F:	support/testing/tests/package/test_zfs.py
 
-N:	José Pekkarinen <jose.pekkarinen@unikie.com>
-F:	package/alfred/
-F:	package/avocado/
-F:	package/bmx7/
-F:	package/opensc/
-F:	package/python-aexpect/
-F:	package/python-alembic/
-F:	package/python-lark/
-F:	package/softhsm2/
-F:	support/testing/tests/package/sample_python_aexpect.py
-F:	support/testing/tests/package/test_avocado.py
-F:	support/testing/tests/package/test_python_aexpect.py
-
 N:	Joseph Kogut <joseph.kogut@gmail.com>
 F:	package/at-spi2-core/
 F:	package/clang/

--===============3511584260031669471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3511584260031669471==--
