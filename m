Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D5BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 31 May 2022 08:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EB3F40C92;
	Tue, 31 May 2022 08:45:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4upfmVi3GPpp; Tue, 31 May 2022 08:45:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 967E240C8F;
	Tue, 31 May 2022 08:45:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CE2E1BF313
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A8C141887
 for <buildroot@lists.busybox.net>; Tue, 31 May 2022 08:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KFwZmcDCpNID for <buildroot@lists.busybox.net>;
 Tue, 31 May 2022 08:43:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A31F41A00
 for <buildroot@buildroot.org>; Tue, 31 May 2022 08:43:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 102DD86864; Tue, 31 May 2022 08:31:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 31 May 2022 10:26:19 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 93500eaa3f72c39507f0f4d3d20e9eaa6ed341be
X-Git-Newrev: 0c1968df1100ab575f8aba35bdd7fabc3d57e000
X-Patchwork-Hint: ignore
Message-Id: <20220531083128.102DD86864@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/erlang-p1-oauth2: bump
 version to 0.6.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=0c1968df1100ab575f8aba35bdd7fabc3d57e000
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-oauth2/erlang-p1-oauth2.hash | 2 +-
 package/erlang-p1-oauth2/erlang-p1-oauth2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
index a6d00aa96e..7a0304e86a 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c5cf0d2a9f5874c289cc6044945f4771a79007bda812e5269dea3a4c92fc8811  erlang-p1-oauth2-0.6.7.tar.gz
+sha256  625e6d96a212cc2cf8a63c36ee698072791d85acbaae18e5820ba144cdaca869  erlang-p1-oauth2-0.6.10.tar.gz
 sha256  0ecddd0a5e35b7fcdab451f54c5bb688fac8365cdf6b0da0ac64b7895a0770f3  LICENSE
diff --git a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
index d7dd45b252..50ac9fbda5 100644
--- a/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
+++ b/package/erlang-p1-oauth2/erlang-p1-oauth2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_OAUTH2_VERSION = 0.6.7
+ERLANG_P1_OAUTH2_VERSION = 0.6.10
 ERLANG_P1_OAUTH2_SITE = $(call github,processone,p1_oauth2,$(ERLANG_P1_OAUTH2_VERSION))
 ERLANG_P1_OAUTH2_LICENSE = MIT
 ERLANG_P1_OAUTH2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
