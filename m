Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD883C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 17:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FCCF605B3;
	Sun,  5 May 2024 17:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0ODi0eeps6L; Sun,  5 May 2024 17:28:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7669A60746
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7669A60746;
	Sun,  5 May 2024 17:28:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 31F051BF3F2
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 17:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FC09605B3
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 17:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cx8jD3pCbimn for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 17:28:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EBB5600C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EBB5600C7
 for <buildroot@buildroot.org>; Sun,  5 May 2024 17:28:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 10FE0866C0; Sun,  5 May 2024 17:28:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 May 2024 19:27:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bb0c57ca273d9a2348e468bcdedad696b24ee8d
X-Git-Newrev: bf8e4c2052b4b1fc07aa89b8134a1385855aaa45
X-Patchwork-Hint: ignore
Message-Id: <20240505172834.10FE0866C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qemu: renumber patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf8e4c2052b4b1fc07aa89b8134a1385855aaa45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3fa1ae00681ca ("package/qemu: add option to enable tracing")
added a patch with a wrong number.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
