Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EDBEB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:50:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19D15405C8;
	Thu,  6 Jul 2023 11:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19D15405C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QntZzYAbuvrd; Thu,  6 Jul 2023 11:50:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5AB424151B;
	Thu,  6 Jul 2023 11:50:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5AB424151B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 974551BF345
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E8AC813C2
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E8AC813C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MJEQpj5npVDl for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:50:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1F2E813A3
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1F2E813A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE344868C8; Thu,  6 Jul 2023 11:50:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:43:25 +0200
Subject: [git commit branch/2023.02.x] DEVELOPERS: remove José Pekkarinen
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 18fb407dc4fca2fc89e824fe0a5fcbb17407e5db
X-Git-Newrev: dd653e4e6af1de9c47e711637e2f22ef01daf928
X-Patchwork-Hint: ignore
Message-Id: <20230706115036.AE344868C8@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============4671643943237116157=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4671643943237116157==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=dd653e4e6af1de9c47e711637e2f22ef01daf928
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
index 55e3494f4c..338a4013ea 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1613,19 +1613,6 @@ N:	José Luis Salvador Rufo <salvador.joseluis@gmail.com>
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
 F:	package/at-spi2-atk/
 F:	package/at-spi2-core/

--===============4671643943237116157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4671643943237116157==--
