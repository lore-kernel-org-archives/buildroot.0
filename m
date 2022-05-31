Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87521C433F5
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D94C41BBF;
	Tue, 31 May 2022 08:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KGI62Z8MH8qK; Tue, 31 May 2022 08:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12FAB419FD;
	Tue, 31 May 2022 08:43:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17F621BF313
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D735D41887
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:43:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kZyL2Kro78Dr for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:43:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA61C41988
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:43:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D106186872; Tue, 31 May 2022 08:31:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:26:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 541381a1340dd6935021ebf8053bc93109932df8
X-Git-Newrev: b680798eaa882c78cdeb3e703e1e7a8b76df69e6
X-Patchwork-Hint: ignore
Message-Id: <20220531083127.D106186872@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/erlang-p1-stringprep:
 bump version to 1.0.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=b680798eaa882c78cdeb3e703e1e7a8b76df69e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-stringprep/erlang-p1-stringprep.hash | 2 +-
 package/erlang-p1-stringprep/erlang-p1-stringprep.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
index e23cc4f38b..eec611829a 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  47f9f8ee901f47b7f62c5140ea09f113efe7fedd5e8ffb92d50f51c5e11fb67f  erlang-p1-stringprep-1.0.23.tar.gz
+sha256  cdc2ffa6ba2171f55b78e69cfce5dab6099cbb6bc6955d88c5c53b0cf24d13af  erlang-p1-stringprep-1.0.27.tar.gz
 sha256  f44415631770cb818de6d92f3961fdfe6e407a5154f84b87cc06ac27323e919c  LICENSE.ALL
 sha256  42aef2a1337ef1f45ae2832aa5aa268c79b2560fb1f3ebab519629372cb24ffe  LICENSE.TCL
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
index 580f4a9aa9..233be52c58 100644
--- a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
+++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_STRINGPREP_VERSION = 1.0.23
+ERLANG_P1_STRINGPREP_VERSION = 1.0.27
 ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
 ERLANG_P1_STRINGPREP_LICENSE = TCL (tools/*.tcl), Apache-2.0 (rest)
 ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.ALL LICENSE.TCL LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
