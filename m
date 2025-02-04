Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A03C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3195342D22;
	Fri, 28 Feb 2025 17:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Z3tVrjybZxU; Fri, 28 Feb 2025 17:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C94B42E42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C94B42E42;
	Fri, 28 Feb 2025 17:11:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12AE01DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26BC84240C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4WdfgodI6Qn for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BF5742D01
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BF5742D01
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65EBD7FCE7; Fri, 28 Feb 2025 16:30:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 15:07:01 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e2484f8bda26f72053e5deb5c09f4e157938eed1
X-Git-Newrev: d892350f644e67340091498bd2ab677f19608d85
X-Patchwork-Hint: ignore
Message-Id: <20250228163030.65EBD7FCE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/eza: bump to version
 0.20.19
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d892350f644e67340091498bd2ab677f19608d85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://github.com/eza-community/eza/releases/tag/v0.20.19

Now licensed under the EUPL-1.2 license, so adjust _LICENSE to match:
https://github.com/eza-community/eza/releases/tag/v0.20.0

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
[Peter: add note about license change]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/eza/eza.hash | 4 ++--
 package/eza/eza.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/eza/eza.hash b/package/eza/eza.hash
index 408099e231..0cd422ccf0 100644
--- a/package/eza/eza.hash
+++ b/package/eza/eza.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  65a0dc76c1976d7af72a628196022de71c787092da5c6d961a3fcee21f5d1d6f  eza-0.18.24-cargo2.tar.gz
-sha256  2762990c7fbba9d550802a2593c1d857dcd52596bb0f9f192a97e9a7ac5f4f9e  LICENCE
+sha256  685b22eec7ec8c24137b4af5f97ceea7d262e31fee324d5b4ed66fce24c23476  eza-0.20.19-cargo2.tar.gz
+sha256  57fb42fbcd0b037ce528ed8f72f1ec095d67bc6825ecf1448ff39be1fe68a4b4  LICENSE.txt
diff --git a/package/eza/eza.mk b/package/eza/eza.mk
index 4d23116504..cd19c4b4d6 100644
--- a/package/eza/eza.mk
+++ b/package/eza/eza.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-EZA_VERSION = 0.18.24
+EZA_VERSION = 0.20.19
 EZA_SITE = $(call github,eza-community,eza,v$(EZA_VERSION))
-EZA_LICENSE = MIT
-EZA_LICENSE_FILES = LICENCE
+EZA_LICENSE = EUPL-1.2
+EZA_LICENSE_FILES = LICENSE.txt
 
 $(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
