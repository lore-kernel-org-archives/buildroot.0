Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FFDEB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA4EE60A87;
	Thu, 20 Jul 2023 21:12:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA4EE60A87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RTLxaFLqOjkd; Thu, 20 Jul 2023 21:12:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E612B612D2;
	Thu, 20 Jul 2023 21:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E612B612D2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 209571BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4102E6128E
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4102E6128E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hW2-S0lwY5_E for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:10:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1747361298
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1747361298
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15A5E8742E; Thu, 20 Jul 2023 21:10:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 23:07:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ec0498a49c2fd34d6407479a6f589538a5872ceb
X-Git-Newrev: 6b87f6e017265a412800695bb18e99f0ddbc4928
X-Patchwork-Hint: ignore
Message-Id: <20230720211020.15A5E8742E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang-p1-yaml: bump version to
 1.0.36
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b87f6e017265a412800695bb18e99f0ddbc4928
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/processone/fast_yaml/blob/master/CHANGELOG.md
[1.0.36 just updated a github workflow file]

Removed paths added by upstream
https://github.com/processone/fast_yaml/commit/de7687901d1c89b9b03dcfb5a44d1af5edb2d95c
which break cross-builds.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-yaml/erlang-p1-yaml.hash | 2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.hash b/package/erlang-p1-yaml/erlang-p1-yaml.hash
index 89123dfd83..0138f82047 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.hash
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6d5c823dd895b736b98325d88893a63c054964d7bde9a8e150fc4df5f4165065  erlang-p1-yaml-1.0.32.tar.gz
+sha256  6794470ef35fb3985c4e9aa0ed8d3a0b44e7a5c7bf4c5a1efbeca42060db6806  erlang-p1-yaml-1.0.36.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
index 6acb6fe059..17f4910ee1 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.mk
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.mk
@@ -4,10 +4,17 @@
 #
 ################################################################################
 
-ERLANG_P1_YAML_VERSION = 1.0.32
+ERLANG_P1_YAML_VERSION = 1.0.36
 ERLANG_P1_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_P1_YAML_VERSION))
 ERLANG_P1_YAML_LICENSE = Apache-2.0
 ERLANG_P1_YAML_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_YAML_DEPENDENCIES = libyaml erlang-p1-utils
 
+define ERLANG_P1_YAML_REMOVE_PATHS
+	$(SED) "s/ -I\/usr\/local\/include//" $(@D)/rebar.config
+	$(SED) "s/ -L\/usr\/local\/lib//" $(@D)/rebar.config
+endef
+
+ERLANG_P1_YAML_POST_PATCH_HOOKS = ERLANG_P1_YAML_REMOVE_PATHS
+
 $(eval $(rebar-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
