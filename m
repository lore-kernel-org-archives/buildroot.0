Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD707C624D4
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 21:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFA4C80841;
	Tue,  1 Sep 2026 21:42:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pI4VCUN6b6gW; Tue,  1 Sep 2026 21:42:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788298942;
	bh=0vbjo4UJDKa7w3+cZpXT8mKQgUpvyIqkmQTxxzazcFs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Iyu427LQxAF7fDL4M4KXZCT0MCQiLqcT8SvTUgHHgKssPvjnZ0dR9d9/mm0yWJXbW
	 /Oa6fXoH1dKg8R57p5ovAKCBhg/O/7McDkPxxi00cufOYxJV0IVFVkcaoGgeSIz9qM
	 00mzxRrd+/fA+ypfgjzi+umSw7d6YBabA5A+6fNtPpNHckS+NBYhATxKW3+Te0A7I1
	 scYz+rAh7X76BMe0a8PYaA8gQYxY7mRYq7iHR5uaPazM5NzxIr4SwF/mv/zchrQChU
	 KOhZQiBGH1n1Tr7mCU/zfPgCDqtGaDCgZ/5I4hD5t6TZArrkU53EPIJrjf7IL7Q80a
	 cYvBRDkpqOuMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3049C807A6;
	Tue,  1 Sep 2026 21:42:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DB91127
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FA07607B8
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCNJYobnJayz for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 21:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7604360649
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 21:42:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43C4093503; Tue,  1 Sep 2026 21:41:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 1 Sep 2026 23:41:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32b4f3f942a26476da9533cb11afdeb5a27861ba
X-Git-Newrev: 08cc0938b53cd7e8c6a746bf6592747bad1cfa5f
X-Patchwork-Hint: ignore
Message-Id: <20260901214121.43C4093503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/newt: update _SITE
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
Content-Type: multipart/mixed; boundary="===============4605599280373788853=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4605599280373788853==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/08cc0938b53cd7e8c6a746bf6592747bad1cfa5f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Old URL returns 404, update _SITE to https://releases.pagure.org/newt

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/newt/newt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/newt/newt.mk b/package/newt/newt.mk
index 0d78fca345..e74f87d01c 100644
--- a/package/newt/newt.mk
+++ b/package/newt/newt.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NEWT_VERSION = 0.52.25
-NEWT_SITE = https://pagure.io/releases/newt
+NEWT_SITE = https://releases.pagure.org/newt
 NEWT_INSTALL_STAGING = YES
 NEWT_DEPENDENCIES = popt slang $(TARGET_NLS_DEPENDENCIES)
 # Force to use libintl, otherwise it finds gettext functions in the C

--===============4605599280373788853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4605599280373788853==--
