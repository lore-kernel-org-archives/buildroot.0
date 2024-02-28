Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E79C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80FC240232;
	Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WsKQHucLGf9S; Wed, 28 Feb 2024 21:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 365014026F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 365014026F;
	Wed, 28 Feb 2024 21:25:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 79D181BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 66DCC41759
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O2TWFg3uHsKb for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FA9841610
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FA9841610
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E17187CA0; Wed, 28 Feb 2024 21:25:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 21:53:39 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: b4dee60f609cbfa5e7e44dcf0a3a8b291ca9f1fb
X-Git-Newrev: e2cc7eb278208a39bd4086e7e6d7b89f3f540d37
X-Patchwork-Hint: ignore
Message-Id: <20240228212548.8E17187CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/joe: add
 JOE_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=e2cc7eb278208a39bd4086e7e6d7b89f3f540d37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cpe:2.3:a:joseph_allen:joe is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/5F530947-2060-4842-92B9-5BC61D9C5430

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2953cd264489229adaef5f0a1f307900dcc3e425)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/joe/joe.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/joe/joe.mk b/package/joe/joe.mk
index f0cac402e1..9346ec1fd3 100644
--- a/package/joe/joe.mk
+++ b/package/joe/joe.mk
@@ -8,6 +8,7 @@ JOE_VERSION = 4.6
 JOE_SITE = http://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-$(JOE_VERSION)
 JOE_LICENSE = GPL-2.0+
 JOE_LICENSE_FILES = COPYING
+JOE_CPE_ID_VENDOR = joseph_allen
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 JOE_DEPENDENCIES += ncurses
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
