Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D25ECE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A368084C77;
	Fri,  6 Sep 2024 20:08:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YzIChu5qBOgG; Fri,  6 Sep 2024 20:08:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 733AE84C74
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 733AE84C74;
	Fri,  6 Sep 2024 20:08:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E46731BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16AB2408C5
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxB27mlZPR1U for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:59:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60CD640BC3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60CD640BC3
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D02883F98; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 4 Sep 2024 00:28:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b560082ba31d67ca1b0e463ec9918c3c4392ba9
X-Git-Newrev: 31bcb608f520cdf0e940c10f71de4353f3a54acb
X-Patchwork-Hint: ignore
Message-Id: <20240906195900.5D02883F98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-fast-yaml: bump version to
 1.0.37
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

commit: https://git.buildroot.net/buildroot/commit/?id=31bcb608f520cdf0e940c10f71de4353f3a54acb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/erlang-fast-yaml/erlang-fast-yaml.hash | 2 +-
 package/erlang-fast-yaml/erlang-fast-yaml.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-fast-yaml/erlang-fast-yaml.hash b/package/erlang-fast-yaml/erlang-fast-yaml.hash
index da2ccf13c9..863781725d 100644
--- a/package/erlang-fast-yaml/erlang-fast-yaml.hash
+++ b/package/erlang-fast-yaml/erlang-fast-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6794470ef35fb3985c4e9aa0ed8d3a0b44e7a5c7bf4c5a1efbeca42060db6806  erlang-fast-yaml-1.0.36.tar.gz
+sha256  a8d632d97282cfdf54a0172df59d8641f37de690dd886d0b2e4ef0d4ff876077  erlang-fast-yaml-1.0.37.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-fast-yaml/erlang-fast-yaml.mk b/package/erlang-fast-yaml/erlang-fast-yaml.mk
index 861706b547..675dba0839 100644
--- a/package/erlang-fast-yaml/erlang-fast-yaml.mk
+++ b/package/erlang-fast-yaml/erlang-fast-yaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_FAST_YAML_VERSION = 1.0.36
+ERLANG_FAST_YAML_VERSION = 1.0.37
 ERLANG_FAST_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_FAST_YAML_VERSION))
 ERLANG_FAST_YAML_LICENSE = Apache-2.0
 ERLANG_FAST_YAML_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
