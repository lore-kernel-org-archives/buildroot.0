Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289EFD24454
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 21:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCAAE4155E;
	Thu, 10 Oct 2024 21:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTEpVS_B2_s4; Thu, 10 Oct 2024 21:32:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95E7E4142D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95E7E4142D;
	Thu, 10 Oct 2024 21:32:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 03C611BF98E
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9ACEF411A8
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 21:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWFK40_Zrbct for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 21:30:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10897400F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10897400F9
 for <buildroot@buildroot.org>; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01E0584553; Thu, 10 Oct 2024 21:30:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Oct 2024 23:17:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db07db5e29be0c1b146e85be8f756bf810cbc9f9
X-Git-Newrev: 21f58c0e1c8987dfa039d096862d88aa57c200c6
X-Patchwork-Hint: ignore
Message-Id: <20241010213043.01E0584553@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pypika-tortoise: bump to
 version 0.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=21f58c0e1c8987dfa039d096862d88aa57c200c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
 package/python-pypika-tortoise/python-pypika-tortoise.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
index 629762f4f7..5c78509af2 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.hash
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
-md5  98c9677516f06f61f211f834d51949a6  pypika-tortoise-0.1.6.tar.gz
-sha256  d802868f479a708e3263724c7b5719a26ad79399b2a70cea065f4a4cadbebf36  pypika-tortoise-0.1.6.tar.gz
+md5  69e74ea7ee7236de921c662a3b0940bc  pypika_tortoise-0.2.1.tar.gz
+sha256  979bbb9d60fe9f6e4129a25c44ee008aab4a4e97b296350be9983dcaa2766354  pypika_tortoise-0.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
index 84aa19cfbb..751c7ad6da 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPIKA_TORTOISE_VERSION = 0.1.6
-PYTHON_PYPIKA_TORTOISE_SOURCE = pypika-tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
-PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/86/55/1bfd4150f664d2e07b36c8f442178cc1f717bb9ae6cae20f21e851c208c6
+PYTHON_PYPIKA_TORTOISE_VERSION = 0.2.1
+PYTHON_PYPIKA_TORTOISE_SOURCE = pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
+PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/30/af/b4a6035611cf6f3990879385cf6d077013c1bdf7ea294d6ceebfa14c8d08
 PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = pep517
 PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
 PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
