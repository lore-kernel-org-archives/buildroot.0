Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DB2CF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 14:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C442F41328;
	Sat, 12 Oct 2024 14:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CiuGQNiKXHGn; Sat, 12 Oct 2024 14:04:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC9AF417B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC9AF417B3;
	Sat, 12 Oct 2024 14:04:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BDF6A1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49F5960612
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 14:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2P_udclAY2Cp for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 14:03:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 967226062C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 967226062C
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 14:03:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 937627FEE8; Sat, 12 Oct 2024 14:03:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 15:57:23 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 34181068f42ebbf58b3f1dfae0906d5b50bef8ca
X-Git-Newrev: d298259f93ae0d3977d0c9158b5fe297ca256b1d
X-Patchwork-Hint: ignore
Message-Id: <20241012140334.937627FEE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 support/testing/tests/package/test_ddrescue.py: fix 'normally' typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=d298259f93ae0d3977d0c9158b5fe297ca256b1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 98f7a32d05ba509461cc58103c359d3b67f00ef5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_ddrescue.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_ddrescue.py b/support/testing/tests/package/test_ddrescue.py
index 2206971421..989abc8f01 100644
--- a/support/testing/tests/package/test_ddrescue.py
+++ b/support/testing/tests/package/test_ddrescue.py
@@ -76,7 +76,7 @@ class TestDdrescue(infra.basetest.BRTest):
         # Where a normal 'dd' fails, 'ddrescue' is expected to succeed
         self.assertRunOk(f"ddrescue {dm_dev} {ddrescue_img}")
 
-        # ddrescue does not normaly write any output data when there
+        # ddrescue does not normally write any output data when there
         # is I/O error on the input. The intent is to preserve any
         # data that could have been read in a previous pass. There is
         # one exception, when the output is a non-existing regular
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
