Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114EDC25B78
	for <buildroot@archiver.kernel.org>; Sun, 26 May 2024 20:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEBD160760;
	Sun, 26 May 2024 20:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hnVLSdHW9n9; Sun, 26 May 2024 20:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAD7F607C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAD7F607C5;
	Sun, 26 May 2024 20:47:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12A6E1D143F
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 20:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AD06607D9
 for <buildroot@lists.busybox.net>; Sun, 26 May 2024 20:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZrUdNt4mTso for <buildroot@lists.busybox.net>;
 Sun, 26 May 2024 20:46:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D80DB607C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D80DB607C5
 for <buildroot@buildroot.org>; Sun, 26 May 2024 20:46:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C69A87FF87; Sun, 26 May 2024 20:46:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 26 May 2024 21:47:11 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 55a7000a7d369e14d935b966ab986cb040c662d8
X-Git-Newrev: aa11275c9d3b278112d2f011f826bfacd7d7139b
X-Patchwork-Hint: ignore
Message-Id: <20240526204658.C69A87FF87@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/qemu: renumber
 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa11275c9d3b278112d2f011f826bfacd7d7139b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 3fa1ae00681ca ("package/qemu: add option to enable tracing")
added a patch with a wrong number.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit bf8e4c2052b4b1fc07aa89b8134a1385855aaa45)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tch => 0003-tracing-install-trace-events-file-only-if-necessary.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch b/package/qemu/0003-tracing-install-trace-events-file-only-if-necessary.patch
similarity index 100%
rename from package/qemu/0004-tracing-install-trace-events-file-only-if-necessary.patch
rename to package/qemu/0003-tracing-install-trace-events-file-only-if-necessary.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
