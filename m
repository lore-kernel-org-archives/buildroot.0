Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B4FC433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 07:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 703D140291;
	Mon,  7 Feb 2022 07:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vXoa5gZlPtJu; Mon,  7 Feb 2022 07:53:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF68D40268;
	Mon,  7 Feb 2022 07:53:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03BA01BF309
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8B3A605E0
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 07:53:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f4Sx70fYjkej for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 07:53:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D8A9600C5
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 07:53:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4D4D982815; Mon,  7 Feb 2022 07:46:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 7 Feb 2022 08:52:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 72308ab9a32de6e8b4b23e42f115ed5ee87e5f33
X-Git-Newrev: 11f8b9fb45aee2d83fffd8d57f5c4ccfc1b1f613
X-Patchwork-Hint: ignore
Message-Id: <20220207074629.4D4D982815@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: fix test_lua_cffi.py
 flake8 error
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

commit: https://git.buildroot.net/buildroot/commit/?id=11f8b9fb45aee2d83fffd8d57f5c4ccfc1b1f613
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

support/testing/tests/package/test_lua_cffi.py:14:1: W391 blank line at end of file

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/tests/package/test_lua_cffi.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/support/testing/tests/package/test_lua_cffi.py b/support/testing/tests/package/test_lua_cffi.py
index 7f56eef566..32547a4ae1 100644
--- a/support/testing/tests/package/test_lua_cffi.py
+++ b/support/testing/tests/package/test_lua_cffi.py
@@ -11,4 +11,3 @@ class TestLuaLuaCffi(TestLuaBase):
     def test_run(self):
         self.login()
         self.module_test("cffi")
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
