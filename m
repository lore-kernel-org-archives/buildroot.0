Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444BEC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC0D940B12;
	Mon,  5 Feb 2024 11:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC0D940B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycJldsB48G-J; Mon,  5 Feb 2024 11:07:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C73AF41732;
	Mon,  5 Feb 2024 11:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C73AF41732
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 345D61BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D85581E8F
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D85581E8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gwGfIRB1nRIy for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74B6882160
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74B6882160
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 631F986B70; Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:05:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ebe576da4e79dc5c71502385f9c080cee024f08
X-Git-Newrev: a114e72a4716d3a19480317894d5ac46e318a5f6
X-Patchwork-Hint: ignore
Message-Id: <20240205110640.631F986B70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-reedsolo: bump to version
 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a114e72a4716d3a19480317894d5ac46e318a5f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License changed to Unlicense/MIT-0:
https://github.com/tomerfiliba-org/reedsolomon/commit/7b97461684701cf19451db1fd348d831dc526dc2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-reedsolo/python-reedsolo.hash | 6 +++---
 package/python-reedsolo/python-reedsolo.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-reedsolo/python-reedsolo.hash b/package/python-reedsolo/python-reedsolo.hash
index fdafc89f49..c1729f0aeb 100644
--- a/package/python-reedsolo/python-reedsolo.hash
+++ b/package/python-reedsolo/python-reedsolo.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/reedsolo/json
-md5  b67a04027a1825c63a63b6793ec660a3  reedsolo-1.6.0.tar.gz
-sha256  4e290d3b0a7207ac7aac186790766c752b5fcdf5e0b04dfd260349579052bbac  reedsolo-1.6.0.tar.gz
+md5  5bbd7741f915ad67b6d425f93ab9d103  reedsolo-1.7.0.tar.gz
+sha256  c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732  reedsolo-1.7.0.tar.gz
 # Locally computed sha256 checksums
-sha256  0babd7b573efc3dcf5bb3c28b583150726f775d3dd8d54d6cd062834735b3d73  LICENSE
+sha256  2da9536c23b72bac15603bb1f8dbf269dc68ecfbc35a75f8d0aa9cb209ba0934  LICENSE
diff --git a/package/python-reedsolo/python-reedsolo.mk b/package/python-reedsolo/python-reedsolo.mk
index 2a7fd42a05..66e85fb40a 100644
--- a/package/python-reedsolo/python-reedsolo.mk
+++ b/package/python-reedsolo/python-reedsolo.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_REEDSOLO_VERSION = 1.6.0
+PYTHON_REEDSOLO_VERSION = 1.7.0
 PYTHON_REEDSOLO_SOURCE = reedsolo-$(PYTHON_REEDSOLO_VERSION).tar.gz
-PYTHON_REEDSOLO_SITE = https://files.pythonhosted.org/packages/9b/10/28d1492cc82a103bc06f18cb9a9dbb3a9168ab2e4068801fa0aa0c76b231
+PYTHON_REEDSOLO_SITE = https://files.pythonhosted.org/packages/f7/61/a67338cbecf370d464e71b10e9a31355f909d6937c3a8d6b17dd5d5beb5e
 PYTHON_REEDSOLO_SETUP_TYPE = setuptools
-PYTHON_REEDSOLO_LICENSE = Public Domain
+PYTHON_REEDSOLO_LICENSE = MIT-0, Unlicense
 PYTHON_REEDSOLO_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
