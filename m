Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2760D2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C88A360617;
	Sun,  7 Dec 2025 17:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hYmBjS9bF-rU; Sun,  7 Dec 2025 17:13:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EE9E60730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765127618;
	bh=nWNVwXw66Xs89k5T+YrF4S/TXTuxkWo6VI2XTQiuoJc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VrTf1NA9IhwQ9NQIQlP62iQYFlfqKNM/FHmCJBtdHMw0gV1szBzYUaHK9tZla0sBQ
	 1rq2dtftdKnuSdNHVnpBmUtClUb6CWFnly+GSaJg/KLyI5lTXpCDqWPo6qiqTiixzr
	 5w5jAP7WxwaIMQF6ajQEnftzoxOn5BmFOBhSOurqA0OtpU/98m9yxoVRrz26D2eJUE
	 +8xEwQ7PK4oXG7lEw7B8KATXGpw8v/CbhO3WUk5T/b7f7K9RZ+x3hVlArKxZk3IQvT
	 fLam4ryseEFQgUBvcYZ2Yt3SCuTs9KPsR9N/Lq8aOQbJswaQak4eg7VQjc/N83iv7E
	 l/6DyuhOWCkJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EE9E60730;
	Sun,  7 Dec 2025 17:13:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76CCE2CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6379240537
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zwLO0Xft2cKV for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB4324019A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB4324019A
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A341B867F9; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 18:09:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15bb41a461d798484387ecd824225a3577d29a55
X-Git-Newrev: 4d61edf6b1b5b23f285f30f67a2d67695b153909
X-Patchwork-Hint: ignore
Message-Id: <20251207171336.A341B867F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Prabhu Sannachi,
 bouncing e-mail
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d61edf6b1b5b23f285f30f67a2d67695b153909
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Prabhu's e-mail address at Collins is bouncing, so let's drop this stale
entry:

<prabhu.sannachi@collins.com>: host
    mxb-00105402.gslb.gpphosted.com[67.231.147.145] said: 550 5.1.1 User
    Unknown (in reply to RCPT TO command)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5e1fa6401f..5c9eb94f56 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2769,9 +2769,6 @@ F:	package/libdvbpsi/
 F:	package/mraa/
 F:	package/synergy/
 
-N:	Prabhu Sannachi <prabhu.sannachi@collins.com>
-F:	package/redis-plus-plus/
-
 N:	Qais Yousef <qais.yousef@arm.com>
 F:	package/bpftrace/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
