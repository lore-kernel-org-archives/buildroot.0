Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED88DEE01E8
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD72060A6E;
	Tue, 10 Sep 2024 20:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFJYKoEt0lKi; Tue, 10 Sep 2024 20:52:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6B0560B09
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6B0560B09;
	Tue, 10 Sep 2024 20:52:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93B371BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03F97404F6
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07fbZ-F-JUkE for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 221E740A60
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 221E740A60
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BF5386F5D; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e277ef8affc38ecae5b70943d13fb3a8b78def4a
X-Git-Newrev: 8e6d5e49fe49192777f90116fbc8d0a125165eaa
X-Patchwork-Hint: ignore
Message-Id: <20240910205131.1BF5386F5D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chocolate-doom: fix multiple typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e6d5e49fe49192777f90116fbc8d0a125165eaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../chocolate-doom/0001-Remove-redundant-demoextend-definition.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch b/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch
index bbfbdbb2d6..06bf54c583 100644
--- a/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch
+++ b/package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch
@@ -4,7 +4,7 @@ Date: Sun, 15 Mar 2020 16:55:33 -0500
 Subject: [PATCH] Remove redundant demoextend definition
 
 GCC 10 enables -fno-common by default, which causes the linker to fail when
-there are multple definitions of a global variable.
+there are multiple definitions of a global variable.
 
 See https://gcc.gnu.org/gcc-10/porting_to.html
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
