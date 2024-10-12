Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6928CF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6963F419DD;
	Sat, 12 Oct 2024 14:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fkgdis_dWwS; Sat, 12 Oct 2024 14:05:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C994415B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C994415B5;
	Sat, 12 Oct 2024 14:05:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2611BF5DF
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4881C40860
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyFpA-oy8A_1 for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ED684086C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ED684086C
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:03:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 681AF7FF6D; Sat, 12 Oct 2024 14:03:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:57:20 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 7ecfb67c996d154ced1f2bd7d5d4f3900e15e293
X-Git-Newrev: 933c693f5a3106e9c8783fa58d753475ae9ea6ee
X-Patchwork-Hint: ignore
Message-Id: <20241012140334.681AF7FF6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 support/testing/tests/package/test_acpica.py: fix typos in comments
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

commit: https://git.buildroot.net/buildroot/commit/?id=933c693f5a3106e9c8783fa58d753475ae9ea6ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 670f6a4bf5a457eaa95340a68a976fb94b89306f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_acpica.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/tests/package/test_acpica.py b/support/testing/tests/package/test_acpica.py
index f7dd64d7f0..adfb93d504 100644
--- a/support/testing/tests/package/test_acpica.py
+++ b/support/testing/tests/package/test_acpica.py
@@ -43,12 +43,12 @@ class TestAcpica(infra.basetest.BRTest):
         cmd += " | grep -F '\"Hello Buildroot!\"'"
         self.assertRunOk(cmd)
 
-        # INT1 is exepcted to be 12345678
+        # INT1 is expected to be 12345678
         cmd = "acpiexec -b 'evaluate INT1' dsdt.aml"
         cmd += " | grep -F 12345678"
         self.assertRunOk(cmd)
 
-        # Evalute the TEST method which prints its argument
+        # Evaluate the TEST method which prints its argument
         cmd = "acpiexec -b 'evaluate TST2 \"Hello World\"' dsdt.aml"
         cmd += " | grep -F 'Arg0=Hello World'"
         self.assertRunOk(cmd)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
