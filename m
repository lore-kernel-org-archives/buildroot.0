Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC41DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 12:57:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 986C161056
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 12:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 986C161056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6741A83FB3;
	Wed,  6 Oct 2021 12:57:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMRtdqmdJFl5; Wed,  6 Oct 2021 12:57:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B836A83187;
	Wed,  6 Oct 2021 12:57:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5E61BF42C
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 12:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 296604041A
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 12:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0SIKkTn8dTHF for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 12:54:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C8164016B
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 12:54:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4F36491AA4; Wed,  6 Oct 2021 12:52:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 14:28:32 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 92d0a70863e72b97d22169ae4ed7fbbdbd31b03b
X-Git-Newrev: 6568871b6ca40b6a23c7870d6974e1362018d85e
X-Patchwork-Hint: ignore
Message-Id: <20211006125207.4F36491AA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/python-cbor2:
 bump to version 5.4.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=6568871b6ca40b6a23c7870d6974e1362018d85e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b1e1b56e6fad837c59828247c62e23529440381d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-cbor2/python-cbor2.hash | 4 ++--
 package/python-cbor2/python-cbor2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cbor2/python-cbor2.hash b/package/python-cbor2/python-cbor2.hash
index cacaf7b76c..879463c2ce 100644
--- a/package/python-cbor2/python-cbor2.hash
+++ b/package/python-cbor2/python-cbor2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cbor2/json
-md5  0b4ac06208304fd8251e50d55a7692ca  cbor2-5.4.0.tar.gz
-sha256  a7926f7244b08c413f1a4fa71a81aa256771c75bdf1a4fd77308547a2d63dd48  cbor2-5.4.0.tar.gz
+md5  87b3ad8a9dd8875fa46c6ec06e3fb0ba  cbor2-5.4.1.tar.gz
+sha256  a8bf432f6cb595f50aeb8fed2a4aa3b3f7caa7f135fb57e4378eaa39242feac9  cbor2-5.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a6afd126d8f545a15166a22f25fadff4b9fb4978bbdd17e97d97d950b66d2fef  LICENSE.txt
diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 325f20faf7..af42d0344a 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CBOR2_VERSION = 5.4.0
+PYTHON_CBOR2_VERSION = 5.4.1
 PYTHON_CBOR2_SOURCE = cbor2-$(PYTHON_CBOR2_VERSION).tar.gz
-PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/dd/cf/154810bb8698a583fd30faec5a34d84d8a01cc700e34c1e41b90616d7d63
+PYTHON_CBOR2_SITE = https://files.pythonhosted.org/packages/9e/25/9dd432c051010faea6a702cb85d0b53dc9d5414513866b6a73b3ac954092
 PYTHON_CBOR2_SETUP_TYPE = setuptools
 PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
