Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B030C433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD40661B85;
	Sat, 12 Feb 2022 13:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uu2i_eATYE0l; Sat, 12 Feb 2022 13:49:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04B6A60A75;
	Sat, 12 Feb 2022 13:49:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 95DC11BF954
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FA0740391
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5LkB5KjdPPxm for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:48:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2EE4403C2
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:48:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id AA5F482B32; Sat, 12 Feb 2022 13:41:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 14:48:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0e8957839cc82433b4a9eb4d0c3f11d07f7c2b48
X-Git-Newrev: e1081382fcdd09fcd9421d6cbdfd5b1a05e9454b
X-Patchwork-Hint: ignore
Message-Id: <20220212134124.AA5F482B32@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-regex: remove outdated
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1081382fcdd09fcd9421d6cbdfd5b1a05e9454b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python3-regex no longer exists, so there's no need to keep in sync with
it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-regex/python-regex.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index a90fd579ac..b93607e40f 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-regex/python3-regex.mk
 PYTHON_REGEX_VERSION = 2021.4.4
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
 PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/38/3f/4c42a98c9ad7d08c16e7d23b2194a0e4f3b2914662da8bc88986e4e6de1f
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
