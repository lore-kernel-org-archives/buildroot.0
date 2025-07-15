Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEBCC83F27
	for <buildroot@archiver.kernel.org>; Wed, 16 Jul 2025 18:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6688741544;
	Wed, 16 Jul 2025 18:38:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1nn09BDdbSTR; Wed, 16 Jul 2025 18:38:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DCAF40C4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DCAF40C4E;
	Wed, 16 Jul 2025 18:38:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12FB91C62
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 637AC8112F
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ydyyX31qW53s for <buildroot@buildroot.org>;
 Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1DA0810F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1DA0810F8
 for <buildroot@buildroot.org>; Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 91E1486664; Wed, 16 Jul 2025 18:38:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 23:50:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0df8b84ecb33493da2465b5fe7d648f6d46e30b6
X-Git-Newrev: a6a2d406847e4a726c1666caf302ab336a50ead6
X-Patchwork-Hint: ignore
Message-Id: <20250716183802.91E1486664@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/amazon-ecr-credential-helper: bump
 to version 0.10.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a6a2d406847e4a726c1666caf302ab336a50ead6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For release notes since 0.9.1, see:
https://github.com/awslabs/amazon-ecr-credential-helper/releases

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yann E. MORIN <yann.morin@orange.com>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash | 2 +-
 package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
index eaac8efe35..250ba6d4ff 100644
--- a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
@@ -1,3 +1,3 @@
 # Localy computed
-sha256  53765b3e441a0e785131731d0cee4c0e2b2a22b90e523e9e4ec3e461c0ec5b05  amazon-ecr-credential-helper-v0.9.1-git4-go2.tar.gz
+sha256  4114241888385d3794ca639f40bb7805f31eb295559950dd940aeeb6b74792f8  amazon-ecr-credential-helper-v0.10.1-git4-go2.tar.gz
 sha256  ce65129252f145d6dd627bc354ccc28ba07c6cd27a8d278b7dcfde3ed6976a5a  LICENSE
diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
index acfeea16fb..06bc98bc79 100644
--- a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AMAZON_ECR_CREDENTIAL_HELPER_VERSION = v0.9.1
+AMAZON_ECR_CREDENTIAL_HELPER_VERSION = v0.10.1
 AMAZON_ECR_CREDENTIAL_HELPER_SITE = https://github.com/awslabs/amazon-ecr-credential-helper
 AMAZON_ECR_CREDENTIAL_HELPER_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
