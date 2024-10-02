Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA512CF8541
	for <buildroot@archiver.kernel.org>; Wed,  2 Oct 2024 21:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9486841416;
	Wed,  2 Oct 2024 21:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sw-x9WNvbWT7; Wed,  2 Oct 2024 21:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A1E641C1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A1E641C1F;
	Wed,  2 Oct 2024 21:02:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 259201BF30E
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CA9941167
 for <buildroot@lists.busybox.net>; Wed,  2 Oct 2024 21:02:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qnraU4eUfUBY for <buildroot@lists.busybox.net>;
 Wed,  2 Oct 2024 21:02:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9729C411D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9729C411D0
 for <buildroot@buildroot.org>; Wed,  2 Oct 2024 21:02:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93C7284A19; Wed,  2 Oct 2024 21:02:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Oct 2024 23:01:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e1fb593026b837ef94867aa62fb6930b8b9dfe7
X-Git-Newrev: 1a6e223b0e697bc8e55c5ef0477e6d74c9fc5531
X-Patchwork-Hint: ignore
Message-Id: <20241002210218.93C7284A19@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-slob: bump to version
 c21d695707db7d2fe4ec7ec27a018bb7b0fcc209
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a6e223b0e697bc8e55c5ef0477e6d74c9fc5531
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-slob/python-slob.hash | 2 +-
 package/python-slob/python-slob.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-slob/python-slob.hash b/package/python-slob/python-slob.hash
index 5bce1f1326..4eb6a52180 100644
--- a/package/python-slob/python-slob.hash
+++ b/package/python-slob/python-slob.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  18eb4f45d09d49b1f776cac52ea70ab951566c60cd30bbec39e88f10908fd8ff  python-slob-31ad0e769360a5b10a4893f686587bb8e48c3895.tar.gz
+sha256  adb265b94a76257e64ee9d71437afa4226e4e87a13d5b964ecfc4236c5f28ae6  python-slob-c21d695707db7d2fe4ec7ec27a018bb7b0fcc209.tar.gz
 sha256  db09bc6733ab28dc59bfbcd01819feb9d05241cbef3ca3f5f58ec739b341d56f  LICENSE
diff --git a/package/python-slob/python-slob.mk b/package/python-slob/python-slob.mk
index 4a0d1a7e1c..552cbc6e66 100644
--- a/package/python-slob/python-slob.mk
+++ b/package/python-slob/python-slob.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_SLOB_VERSION = 31ad0e769360a5b10a4893f686587bb8e48c3895
+PYTHON_SLOB_VERSION = c21d695707db7d2fe4ec7ec27a018bb7b0fcc209
 PYTHON_SLOB_SITE = $(call github,itkach,slob,$(PYTHON_SLOB_VERSION))
 PYTHON_SLOB_LICENSE = GPL-3.0
 PYTHON_SLOB_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
