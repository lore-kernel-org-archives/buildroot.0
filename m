Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE3AC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6037A42867;
	Fri, 10 Nov 2023 21:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6037A42867
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnTCYID7UPiX; Fri, 10 Nov 2023 21:06:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5872E4287E;
	Fri, 10 Nov 2023 21:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5872E4287E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A60C1BF41B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 539E181EEF
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 539E181EEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V33Bi8admCTd for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC69881CE3
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC69881CE3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA6F486FCF; Fri, 10 Nov 2023 21:05:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 22:01:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 013061755d928e96399c0e4e964a03dc623a8425
X-Git-Newrev: aaa315b6a7171f0239676964d524bd19b18219dc
X-Patchwork-Hint: ignore
Message-Id: <20231110210507.DA6F486FCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-filelock: bump to version
 3.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=aaa315b6a7171f0239676964d524bd19b18219dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-filelock/python-filelock.hash | 4 ++--
 package/python-filelock/python-filelock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-filelock/python-filelock.hash b/package/python-filelock/python-filelock.hash
index 4ef7afed00..3013cb6789 100644
--- a/package/python-filelock/python-filelock.hash
+++ b/package/python-filelock/python-filelock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/filelock/json
-md5  40eeb4a2963e1b07b8eab12b5db08418  filelock-3.9.0.tar.gz
-sha256  7b319f24340b51f55a2bf7a12ac0755a9b03e718311dac567a0f4f7fabd2f5de  filelock-3.9.0.tar.gz
+md5  368d00d1946b89c910d4bf1da68b5a66  filelock-3.13.1.tar.gz
+sha256  521f5f56c50f8426f5e03ad3b281b490a87ef15bc6c526f168290f0c7148d44e  filelock-3.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  88d9b4eb60579c191ec391ca04c16130572d7eedc4a86daa58bf28c6e14c9bcd  LICENSE
diff --git a/package/python-filelock/python-filelock.mk b/package/python-filelock/python-filelock.mk
index 02759935ad..a32517b1ad 100644
--- a/package/python-filelock/python-filelock.mk
+++ b/package/python-filelock/python-filelock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FILELOCK_VERSION = 3.9.0
+PYTHON_FILELOCK_VERSION = 3.13.1
 PYTHON_FILELOCK_SOURCE = filelock-$(PYTHON_FILELOCK_VERSION).tar.gz
-PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/0b/dc/eac02350f06c6ed78a655ceb04047df01b02c6b7ea3fc02d4df24ca87d24
+PYTHON_FILELOCK_SITE = https://files.pythonhosted.org/packages/70/70/41905c80dcfe71b22fb06827b8eae65781783d4a14194bce79d16a013263
 PYTHON_FILELOCK_SETUP_TYPE = pep517
 PYTHON_FILELOCK_LICENSE = Public Domain
 PYTHON_FILELOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
