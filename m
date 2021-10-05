Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C697C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:38:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED6CB61269
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED6CB61269
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C498A404A1;
	Tue,  5 Oct 2021 19:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PPTXgUjuTd6F; Tue,  5 Oct 2021 19:38:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DA54404DC;
	Tue,  5 Oct 2021 19:38:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 53F981BF334
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F0134023C
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U2F3ecZferpv for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5497A407BE
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 16F439122E; Tue,  5 Oct 2021 19:34:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:31:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 026a0baeb89a017a766eae5ffd34c0297df96338
X-Git-Newrev: e42f9bc5754fd34ecb7027ad8483f5f259a5a04c
X-Patchwork-Hint: ignore
Message-Id: <20211005193451.16F439122E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dpkt: bump to version
 1.9.7.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=e42f9bc5754fd34ecb7027ad8483f5f259a5a04c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-dpkt/python-dpkt.hash | 6 +++---
 package/python-dpkt/python-dpkt.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-dpkt/python-dpkt.hash b/package/python-dpkt/python-dpkt.hash
index b8b53fd04b..e5e986628c 100644
--- a/package/python-dpkt/python-dpkt.hash
+++ b/package/python-dpkt/python-dpkt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dpkt/json
-md5	b204a5434fe29749de539150e00e762e  dpkt-1.9.2.tar.gz
-sha256	52a92ecd5ca04d5bd852bb11cb2eac4bbe38b42a7c472e0d950eeb9f82a81e54  dpkt-1.9.2.tar.gz
+md5  ac3ace1c5ee12a74f12a863ac9082b59  dpkt-1.9.7.2.tar.gz
+sha256  80f977667ebbad2b5c4f7b7f45ee8bea6622fb71723f68a9a8fe6274520c853b  dpkt-1.9.7.2.tar.gz
 # Locally computed sha256 checksums
-sha256	4c5ffde575425591cbd51410219a6b98bbbb717e0c5784187e356653da8e5095  LICENSE
+sha256  4c5ffde575425591cbd51410219a6b98bbbb717e0c5784187e356653da8e5095  LICENSE
diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
index aade014f68..87945d67c6 100644
--- a/package/python-dpkt/python-dpkt.mk
+++ b/package/python-dpkt/python-dpkt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DPKT_VERSION = 1.9.2
+PYTHON_DPKT_VERSION = 1.9.7.2
 PYTHON_DPKT_SOURCE = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
-PYTHON_DPKT_SITE = https://files.pythonhosted.org/packages/1c/25/0aebea939ea70d31a7ff8884e5ca577eddb9cfeac626398fe782d4e2f6a2
+PYTHON_DPKT_SITE = https://files.pythonhosted.org/packages/95/51/923b370880eff9b62fe4fe965a916da709022a02669c670731da69088e93
 PYTHON_DPKT_SETUP_TYPE = setuptools
 PYTHON_DPKT_LICENSE = BSD-3-Clause
 PYTHON_DPKT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
