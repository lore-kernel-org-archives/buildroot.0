Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892C9C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 21:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4352B41F15;
	Fri, 17 Dec 2021 21:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-bai8pJ7Iyj; Fri, 17 Dec 2021 21:47:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E1B141EA5;
	Fri, 17 Dec 2021 21:47:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D253D1BF358
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1AF684C85
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 20ZLctTZ16Q6 for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37D0284C80
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 21:47:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2F53E80288; Fri, 17 Dec 2021 21:41:45 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 22:46:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 131fc393464b575a0bf79332427123a9fd4ccfa0
X-Git-Newrev: b2cb5d2e6197b68a47f21cd3805400c6e4571d59
X-Patchwork-Hint: ignore
Message-Id: <20211217214145.2F53E80288@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: fixup alphabetic ordering of
 files for Nicolas Carrier
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

commit: https://git.buildroot.net/buildroot/commit/?id=b2cb5d2e6197b68a47f21cd3805400c6e4571d59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 03315a5444..d7639ae812 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2034,13 +2034,13 @@ F:	package/python-augeas/
 F:	package/python-flask-expects-json/
 F:	package/python-git/
 F:	package/python-unittest-xml-reporting/
-F:	support/testing/tests/package/test_lua_augeas.py
 F:	support/testing/tests/package/sample_bmap_tools.sh
 F:	support/testing/tests/package/sample_python_augeas.py
 F:	support/testing/tests/package/sample_python_flask_expects_json.py
 F:	support/testing/tests/package/sample_python_git.py
 F:	support/testing/tests/package/sample_python_unittest_xml_reporting.py
 F:	support/testing/tests/package/test_bmap_tools.py
+F:	support/testing/tests/package/test_lua_augeas.py
 F:	support/testing/tests/package/test_php_apcu.py
 F:	support/testing/tests/package/test_php_pecl_dbus.py
 F:	support/testing/tests/package/test_php_lua.py
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
