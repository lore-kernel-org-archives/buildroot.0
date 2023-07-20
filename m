Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B6CEB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A2D36129A;
	Thu, 20 Jul 2023 21:13:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A2D36129A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JGXz9ye-MIvr; Thu, 20 Jul 2023 21:13:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF243612DD;
	Thu, 20 Jul 2023 21:13:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF243612DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6801BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9F1641DDD
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9F1641DDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tuAJJHRWKAmj for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:10:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6F6C41E26
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6F6C41E26
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4A84874AA; Thu, 20 Jul 2023 21:10:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 23:07:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 785591557f710d4e179592c8ede0748f21df9790
X-Git-Newrev: ce7a5c6f90c52b974cf452773a586804e3180136
X-Patchwork-Hint: ignore
Message-Id: <20230720211019.D4A84874AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-p1-stringprep: bump version
 to 1.0.29
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ce7a5c6f90c52b974cf452773a586804e3180136
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/processone/stringprep/blob/master/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-stringprep/erlang-p1-stringprep.hash | 2 +-
 package/erlang-p1-stringprep/erlang-p1-stringprep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
index eec611829a..50a48af0a4 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  cdc2ffa6ba2171f55b78e69cfce5dab6099cbb6bc6955d88c5c53b0cf24d13af  erlang-p1-stringprep-1.0.27.tar.gz
+sha256  b07daf2148829d513caf2931d463550e70252a78ef99696dcf444d61d93bf940  erlang-p1-stringprep-1.0.29.tar.gz
 sha256  f44415631770cb818de6d92f3961fdfe6e407a5154f84b87cc06ac27323e919c  LICENSE.ALL
 sha256  42aef2a1337ef1f45ae2832aa5aa268c79b2560fb1f3ebab519629372cb24ffe  LICENSE.TCL
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
index 233be52c58..09e339f57a 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STRINGPREP_VERSION = 1.0.27
+ERLANG_P1_STRINGPREP_VERSION = 1.0.29
 ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
 ERLANG_P1_STRINGPREP_LICENSE = TCL (tools/*.tcl), Apache-2.0 (rest)
 ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.ALL LICENSE.TCL LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
