Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8B0C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 21:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFE3A41B6E;
	Sun,  5 Nov 2023 21:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BFE3A41B6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1BEEVWLZvqfR; Sun,  5 Nov 2023 21:11:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D83754194B;
	Sun,  5 Nov 2023 21:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D83754194B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FE141BF869
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED01381F54
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 21:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED01381F54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Ik3AxgVvTkO for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 21:11:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DF3281F40
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 21:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DF3281F40
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0F14868A8; Sun,  5 Nov 2023 21:11:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Nov 2023 22:01:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0547add320d5a3da5ec8d70dfd03b8d3aafb995a
X-Git-Newrev: cc8c3c9317f7caf90c0fe126a967422b4baa1851
X-Patchwork-Hint: ignore
Message-Id: <20231105211104.F0F14868A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiojobs: bump to version
 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc8c3c9317f7caf90c0fe126a967422b4baa1851
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-aiojobs/python-aiojobs.hash | 4 ++--
 package/python-aiojobs/python-aiojobs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiojobs/python-aiojobs.hash b/package/python-aiojobs/python-aiojobs.hash
index 511953713b..8920e3aecd 100644
--- a/package/python-aiojobs/python-aiojobs.hash
+++ b/package/python-aiojobs/python-aiojobs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiojobs/json
-md5  18a5b38cc13b2d59a91fdfec64588b4c  aiojobs-1.1.0.tar.gz
-sha256  f0c43dfc4de359052a67df309b593732c32028deef1bb787c7a363da29accde3  aiojobs-1.1.0.tar.gz
+md5  529a4367f9bc63a482a2962ba54bfd51  aiojobs-1.2.0.tar.gz
+sha256  a4bcfb6a2d21ad08dea904e9f73040b37657d0c33cc8d77e683e47de5fcf0b12  aiojobs-1.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  1803dc89455114eefad3b827543343edc2452432fdac29b5edc66c8b66d4cbf3  LICENSE
diff --git a/package/python-aiojobs/python-aiojobs.mk b/package/python-aiojobs/python-aiojobs.mk
index 075d807d8b..be0acd3fbc 100644
--- a/package/python-aiojobs/python-aiojobs.mk
+++ b/package/python-aiojobs/python-aiojobs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOJOBS_VERSION = 1.1.0
+PYTHON_AIOJOBS_VERSION = 1.2.0
 PYTHON_AIOJOBS_SOURCE = aiojobs-$(PYTHON_AIOJOBS_VERSION).tar.gz
-PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/99/75/b6d3678d804fffda81ebbac6214c35a4417d5ddbd70ffe7958ad951e64d2
+PYTHON_AIOJOBS_SITE = https://files.pythonhosted.org/packages/c4/e0/4685393810a267c09edef41ddafd0dd28108d95e1b91019b1843fc6e5b83
 PYTHON_AIOJOBS_SETUP_TYPE = setuptools
 PYTHON_AIOJOBS_LICENSE = Apache-2.0
 PYTHON_AIOJOBS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
