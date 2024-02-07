Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225E8C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEB3A81AA7;
	Wed,  7 Feb 2024 16:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2FmjnF_9C8gs; Wed,  7 Feb 2024 16:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E23D881E3C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E23D881E3C;
	Wed,  7 Feb 2024 16:43:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3990B1BF954
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3287C81E3C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZKEi83DyymrR for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B53881AA7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B53881AA7
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:43:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5925B8767B; Wed,  7 Feb 2024 16:43:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:39:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1269073e7b4a2a7f92ebfe88581eaf9e09616a5
X-Git-Newrev: 4bb00267175bc0d0cc5de0c14b03a9dd5d1cc627
X-Patchwork-Hint: ignore
Message-Id: <20240207164326.5925B8767B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-simplejson: bump to version
 3.19.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4bb00267175bc0d0cc5de0c14b03a9dd5d1cc627
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-simplejson/python-simplejson.hash | 4 ++--
 package/python-simplejson/python-simplejson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-simplejson/python-simplejson.hash b/package/python-simplejson/python-simplejson.hash
index a8b946b2c4..9f96f99bf4 100644
--- a/package/python-simplejson/python-simplejson.hash
+++ b/package/python-simplejson/python-simplejson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/simplejson/json
-md5  ecd07fca7a7fa0bcc9acdf9d82e41eb1  simplejson-3.18.1.tar.gz
-sha256  746086e3ef6d74b53599df31b491d88a355abf2e31c837137dd90f8c4561cafa  simplejson-3.18.1.tar.gz
+md5  3b334627d870a3c849e1322d18a7bfe7  simplejson-3.19.2.tar.gz
+sha256  9eb442a2442ce417801c912df68e1f6ccfcd41577ae7274953ab3ad24ef7d82c  simplejson-3.19.2.tar.gz
 # Locally computed sha256 checksums
 sha256  fcaa1e313a99304322e2e0836ea4ee7d839ce9a480438f3922a853edfdde129f  LICENSE.txt
diff --git a/package/python-simplejson/python-simplejson.mk b/package/python-simplejson/python-simplejson.mk
index 5782626387..d5ba3948b7 100644
--- a/package/python-simplejson/python-simplejson.mk
+++ b/package/python-simplejson/python-simplejson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SIMPLEJSON_VERSION = 3.18.1
+PYTHON_SIMPLEJSON_VERSION = 3.19.2
 PYTHON_SIMPLEJSON_SOURCE = simplejson-$(PYTHON_SIMPLEJSON_VERSION).tar.gz
-PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/0f/a0/79d2bec499cb53678bc20d41f9706ca02777f0876efa9b29a69fb3d55dfd
+PYTHON_SIMPLEJSON_SITE = https://files.pythonhosted.org/packages/79/79/3ccb95bb4154952532f280f7a41979fbfb0fbbaee4d609810ecb01650afa
 PYTHON_SIMPLEJSON_LICENSE = Academic Free License (AFL), MIT
 PYTHON_SIMPLEJSON_LICENSE_FILES = LICENSE.txt
 PYTHON_SIMPLEJSON_CPE_ID_VENDOR = simplejson_project
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
