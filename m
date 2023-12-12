Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B37FC4332F
	for <buildroot@archiver.kernel.org>; Tue, 12 Dec 2023 22:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2CC541B9B;
	Tue, 12 Dec 2023 22:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2CC541B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a88umlrb-7HF; Tue, 12 Dec 2023 22:13:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F67341B92;
	Tue, 12 Dec 2023 22:13:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F67341B92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44E821BF2A2
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 22:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B9E382CF9
 for <buildroot@lists.busybox.net>; Tue, 12 Dec 2023 22:13:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B9E382CF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ic681EXFNQLE for <buildroot@lists.busybox.net>;
 Tue, 12 Dec 2023 22:13:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 534AD82B81
 for <buildroot@buildroot.org>; Tue, 12 Dec 2023 22:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 534AD82B81
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 39E0787B1B; Tue, 12 Dec 2023 22:13:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Dec 2023 22:54:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b79fb3c224a5a8e687b0bc91dd221efcf7137ea8
X-Git-Newrev: d8e1aca0de4186b8578d128c333c100b89da194a
X-Patchwork-Hint: ignore
Message-Id: <20231212221336.39E0787B1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open62541: bump to version 1.3.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8e1aca0de4186b8578d128c333c100b89da194a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/open62541/open62541.hash | 2 +-
 package/open62541/open62541.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 3508cbb146..2946b991a4 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  41e82d81d2fc9449028dab31fd460df1da29130bcb7388222842e778cf34625c  open62541-v1.3.8-br1.tar.gz
+sha256  8ca1f20dba4fc103893d74d29e41c336ab67a1725512b03eaaf6060658525b43  open62541-v1.3.9-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 16ef51ed31..17abd4a379 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.8
+OPEN62541_VERSION = v1.3.9
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
