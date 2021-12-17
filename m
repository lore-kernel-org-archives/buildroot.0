Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41783C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D481040C26;
	Fri, 17 Dec 2021 21:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N7p5L6e-DTvC; Fri, 17 Dec 2021 21:48:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BED2140C3F;
	Fri, 17 Dec 2021 21:48:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9EC2F1BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1C4640C36
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AdJ8dYqrL1JB for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1FE9240C33
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 25D3B802C5; Fri, 17 Dec 2021 21:41:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:46:55 +0100
Subject: [git commit] DEVELOPERS: merge Hervé Codina entries
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ac9261edec111836952970e26cf373cc15b9e8ac
X-Git-Newrev: 131fc393464b575a0bf79332427123a9fd4ccfa0
X-Patchwork-Hint: ignore
Message-Id: <20211217214145.25D3B802C5@busybox.osuosl.org>
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
Content-Type: multipart/mixed; boundary="===============4688271351068097144=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4688271351068097144==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=131fc393464b575a0bf79332427123a9fd4ccfa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Probably due to bogus merge conflicts, Hervé Codina ended up having
two entries in the DEVELOPERS file. This commit brings back all files
watch by Hervé under the same entry.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index de960d25b0..03315a5444 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1164,14 +1164,12 @@ F:	package/modsecurity2/
 F:	package/php-apcu/
 F:	package/php-lua/
 F:	package/php-pam/
+F:	package/php-pecl-dbus/
 F:	support/testing/tests/package/test_dtbocfg.py
 F:	support/testing/tests/package/test_lua_augeas.py
 F:	support/testing/tests/package/test_php_apcu.py
 F:	support/testing/tests/package/test_php_lua.py
 F:	support/testing/tests/package/test_php_pam.py
-
-N:	Hervé Codina <herve.codina@bootlin.com>
-F:	package/php-pecl-dbus/
 F:	support/testing/tests/package/test_php_pecl_dbus.py
 
 N:	Hiroshi Kawashima <kei-k@ca2.so-net.ne.jp>

--===============4688271351068097144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4688271351068097144==--
