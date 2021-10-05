Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D85C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:40:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0048361372
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 19:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0048361372
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CAEB1607A3;
	Tue,  5 Oct 2021 19:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FImgqUyW9E2P; Tue,  5 Oct 2021 19:40:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3378E6068B;
	Tue,  5 Oct 2021 19:40:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BF0E41BF983
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71123607A3
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 19:37:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CZgKSGKdPW29 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DD5B60BF1
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 19:37:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DE9A691216; Tue,  5 Oct 2021 19:34:50 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 5 Oct 2021 21:31:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8298e285dd65dfa2a57739191471ee98d6c22a09
X-Git-Newrev: d112444d288811b92ad0ccb35b5381d960c74fd0
X-Patchwork-Hint: ignore
Message-Id: <20211005193450.DE9A691216@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cached-property: bump to
 version 1.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d112444d288811b92ad0ccb35b5381d960c74fd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-cached-property/python-cached-property.hash | 6 +++---
 package/python-cached-property/python-cached-property.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cached-property/python-cached-property.hash b/package/python-cached-property/python-cached-property.hash
index cfe34ca1df..835e9e0200 100644
--- a/package/python-cached-property/python-cached-property.hash
+++ b/package/python-cached-property/python-cached-property.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cached-property/json
-md5	4b6f3cd429da5f487f4ebf3242bb991f  cached-property-1.5.1.tar.gz
-sha256	9217a59f14a5682da7c4b8829deadbfc194ac22e9908ccf7c8820234e80a1504  cached-property-1.5.1.tar.gz
+md5  3451c63f8733ea0756ca1dd2b0c04bb8  cached-property-1.5.2.tar.gz
+sha256  9fa5755838eecbb2d234c3aa390bd80fbd3ac6b6869109bfc1b499f7bd89a130  cached-property-1.5.2.tar.gz
 # Locally computed sha256 checksums
-sha256	ba4756c8039b25b66e3c456cc5bf635aa528cf459b97ee1499d06684ccd89b9a  LICENSE
+sha256  ba4756c8039b25b66e3c456cc5bf635aa528cf459b97ee1499d06684ccd89b9a  LICENSE
diff --git a/package/python-cached-property/python-cached-property.mk b/package/python-cached-property/python-cached-property.mk
index f83a1f18f4..9e1b3f8aff 100644
--- a/package/python-cached-property/python-cached-property.mk
+++ b/package/python-cached-property/python-cached-property.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHED_PROPERTY_VERSION = 1.5.1
+PYTHON_CACHED_PROPERTY_VERSION = 1.5.2
 PYTHON_CACHED_PROPERTY_SOURCE = cached-property-$(PYTHON_CACHED_PROPERTY_VERSION).tar.gz
-PYTHON_CACHED_PROPERTY_SITE = https://files.pythonhosted.org/packages/57/8e/0698e10350a57d46b3bcfe8eff1d4181642fd1724073336079cb13c5cf7f
+PYTHON_CACHED_PROPERTY_SITE = https://files.pythonhosted.org/packages/61/2c/d21c1c23c2895c091fa7a91a54b6872098fea913526932d21902088a7c41
 PYTHON_CACHED_PROPERTY_SETUP_TYPE = setuptools
 PYTHON_CACHED_PROPERTY_LICENSE = BSD-3-Clause
 PYTHON_CACHED_PROPERTY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
