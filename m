Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DFEC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D6B142861;
	Fri, 10 Nov 2023 21:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D6B142861
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Taiw40cmnr8a; Fri, 10 Nov 2023 21:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C2AB4218B;
	Fri, 10 Nov 2023 21:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C2AB4218B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2A231BF997
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D86BF81EEF
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D86BF81EEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r7F0VEfjfPsF for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E02DD81EFD
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E02DD81EFD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD18586FCE; Fri, 10 Nov 2023 21:05:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 22:01:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10e7866f396a5f32739d269d2bf110bb1e6d71f8
X-Git-Newrev: 013061755d928e96399c0e4e964a03dc623a8425
X-Patchwork-Hint: ignore
Message-Id: <20231110210507.CD18586FCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hatchling: bump to version
 1.18.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=013061755d928e96399c0e4e964a03dc623a8425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new host-python-trove-classifiers build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index 154c1fdcac..ebb412d197 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  5a6e2fd0c877feea7e71b9d72bbdbed9  hatchling-1.12.2.tar.gz
-sha256  8a6d719d96653a0f3901072b12710c9c3cc934f9061b443775c6789b45333495  hatchling-1.12.2.tar.gz
+md5  43f7203cacb6c3c178b93149b8a8151d  hatchling-1.18.0.tar.gz
+sha256  50e99c3110ce0afc3f7bdbadff1c71c17758e476731c27607940cfa6686489ca  hatchling-1.18.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index 61aa1a6c23..f13e6d3e28 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.12.2
+PYTHON_HATCHLING_VERSION = 1.18.0
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/f5/ea/3ed5a7ecdd8a8f7e84cffd3b5ec24279a09ce2694c218ff922c35c6f1a77
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/e3/57/87da2c5adc173950ebe9f1acce4d5f2cd0a960783992fd4879a899a0b637
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
@@ -14,6 +14,7 @@ HOST_PYTHON_HATCHLING_DEPENDENCIES = \
 	host-python-editables \
 	host-python-packaging \
 	host-python-pathspec \
-	host-python-pluggy
+	host-python-pluggy \
+	host-python-trove-classifiers
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
