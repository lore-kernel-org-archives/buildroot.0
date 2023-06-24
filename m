Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0ACEB64DA
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 13:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6A5D60AF6;
	Sat, 24 Jun 2023 13:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6A5D60AF6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tz3BeVUfUJBr; Sat, 24 Jun 2023 13:17:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E90B460AD4;
	Sat, 24 Jun 2023 13:17:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E90B460AD4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 604131BF31F
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 13:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46F144014D
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 13:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46F144014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4clUrpWN237 for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 13:17:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5568F4011B
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 13:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5568F4011B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 417F283B49; Sat, 24 Jun 2023 13:17:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 24 Jun 2023 15:17:34 +0200
Subject: [git commit] DEVELOPERS: remove José Pekkarinen
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c8ab13b960edcd290ea5ca7a7e739cb993fb863
X-Git-Newrev: 5206492d6a749191fc9395479438a35007417cc2
X-Patchwork-Hint: ignore
Message-Id: <20230624131752.417F283B49@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============6238773693370716431=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6238773693370716431==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=5206492d6a749191fc9395479438a35007417cc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

E-mails are bouncing:

<jose.pekkarinen@unikie.com>: host ASPMX.L.GOOGLE.com[74.125.133.26] said:
    550-5.1.1 The email account that you tried to reach does not exist. Please
    try 550-5.1.1 double-checking the recipient's email address for typos or
    550-5.1.1 unnecessary spaces. Learn more at 550 5.1.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 694dfe0bdd..794c2ebdfe 100644
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

--===============6238773693370716431==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6238773693370716431==--
