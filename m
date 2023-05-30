Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2F6C7EE31
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 19:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2D3F418EE;
	Tue, 30 May 2023 19:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2D3F418EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ZA9GtZXsogJ; Tue, 30 May 2023 19:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C4C541875;
	Tue, 30 May 2023 19:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C4C541875
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79B581BF35F
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35D3340904
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 19:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35D3340904
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sNDxYPp49sNJ for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 19:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DCA540962
 for <buildroot@buildroot.org>; Tue, 30 May 2023 19:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DCA540962
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5AD2086AC4; Tue, 30 May 2023 19:54:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 21:52:47 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 3653187497c19a8535b5dac045f64e20fae639cf
X-Git-Newrev: 21ae60c35f067ddaac03c70e2fa3fe279d695190
X-Patchwork-Hint: ignore
Message-Id: <20230530195443.5AD2086AC4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/runc: bump
 version to 1.1.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=21ae60c35f067ddaac03c70e2fa3fe279d695190
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

This is the last planned release of the 1.1.x series.

https://github.com/opencontainers/runc/releases/tag/v1.1.7

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c24012ad86d753f376e01fbaf1ea72cb5975365f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index eee2e34cbf..1a68b74ccb 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  76cbf30637cbb828794d72d32fb3fd6ff3139cd9743b8b44790fd110f43d96b2  runc-1.1.5.tar.gz
+sha256  f1885d6dfa188f8112328ac2355e5d67346174a2e2e795ec514a972bcbfcc2fa  runc-1.1.7.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 9c6b5f9b37..805ff23964 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.1.5
+RUNC_VERSION = 1.1.7
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
