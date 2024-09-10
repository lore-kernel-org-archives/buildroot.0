Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A49C5EDE9BF
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EA7D611B5;
	Tue, 10 Sep 2024 20:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdL1hkKxzMB0; Tue, 10 Sep 2024 20:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57F15611CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57F15611CA;
	Tue, 10 Sep 2024 20:53:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 397A41BF95A
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70DDE40B80
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNdEorUJKuKe for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1267540B94
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1267540B94
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BADD86F60; Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:50:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5aa9b105b96dda4d0db6fc11f4c8abe09a63ed33
X-Git-Newrev: 6d6d7bfe2333afdd4f34c2d54f27e34fc3c6b9ba
X-Patchwork-Hint: ignore
Message-Id: <20240910205132.0BADD86F60@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gobject-introspection: fix
 altogether typo in patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=6d6d7bfe2333afdd4f34c2d54f27e34fc3c6b9ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gobject-introspection/0001-disable-tests.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gobject-introspection/0001-disable-tests.patch b/package/gobject-introspection/0001-disable-tests.patch
index 8de216c039..a39f51617b 100644
--- a/package/gobject-introspection/0001-disable-tests.patch
+++ b/package/gobject-introspection/0001-disable-tests.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] disable tests
 
 If introspection data on the host is not built, meson throws the error:
 "Unknown variable "typelibs". Because tests are not required, removing
-the subdir tests alltogether fixes this issue.
+the subdir tests altogether fixes this issue.
 
 Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
