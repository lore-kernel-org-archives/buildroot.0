Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08BACF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 15:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8902160B86;
	Sat, 12 Oct 2024 15:03:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgmOl_DlYmGC; Sat, 12 Oct 2024 15:03:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 696E660B75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 696E660B75;
	Sat, 12 Oct 2024 15:03:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 297111BF8A8
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9034C81FB2
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 15:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkWNNsgq7Poy for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 15:02:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C443481E86
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C443481E86
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 15:02:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF4DB85E1E; Sat, 12 Oct 2024 15:02:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Oct 2024 17:00:09 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 9f7e74ca533cb4d4b66c2a780938a639a8ae6edd
X-Git-Newrev: d797a2f2b3d5ae2b88a547b469bddfeaf048f1ce
X-Patchwork-Hint: ignore
Message-Id: <20241012150252.BF4DB85E1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/selinux-python:
 fix 'family' typo in patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=d797a2f2b3d5ae2b88a547b469bddfeaf048f1ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 70ded7c2127e80d89a150bcf1c891c90093c5978)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/selinux-python/0001-python-sepolgen-fix-ausearch-path.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/selinux-python/0001-python-sepolgen-fix-ausearch-path.patch b/package/selinux-python/0001-python-sepolgen-fix-ausearch-path.patch
index 31c5013d69..7a1cf9b386 100644
--- a/package/selinux-python/0001-python-sepolgen-fix-ausearch-path.patch
+++ b/package/selinux-python/0001-python-sepolgen-fix-ausearch-path.patch
@@ -19,7 +19,7 @@ tools are only ever going to run on a Linux host (by their virtue of
 dealing with SELinux), so the search will be reliably done by looking in
 PATH, so we can let Popen() bubble the resolving of an unqualified
 command, down to execvpe() (or the similar actual syscall of the exec*()
-familly). If ausearch is then not found, Popen() raises an exception
+family). If ausearch is then not found, Popen() raises an exception
 that is wy more informative then:
     FileNotFoundError: [Errno 2] No such file or directory: 'ausearch'
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
