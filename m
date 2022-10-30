Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7974C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 562D44034A;
	Sun, 30 Oct 2022 14:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 562D44034A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pMjiz2a0eDb8; Sun, 30 Oct 2022 14:07:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E85A5401F9;
	Sun, 30 Oct 2022 14:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E85A5401F9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 872421BF487
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8EAB04018E
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EAB04018E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6RyoDxQMdiQl for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74EFD40302
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74EFD40302
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63B1487510; Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 15:03:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 987c27510f7949807e93ceb573b4d2ee00abb35c
X-Git-Newrev: de4a180b80905ee74a064d0fbc74d8de4fea7464
X-Patchwork-Hint: ignore
Message-Id: <20221030140545.63B1487510@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-attrs: bump to version
 22.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=de4a180b80905ee74a064d0fbc74d8de4fea7464
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to ownership clarification:
https://github.com/python-attrs/attrs/commit/899497f165b3c8291b66c9c3a01b64881b69cf39

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-attrs/python-attrs.hash | 6 +++---
 package/python-attrs/python-attrs.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-attrs/python-attrs.hash b/package/python-attrs/python-attrs.hash
index 823a9459bd..d5548c0ed3 100644
--- a/package/python-attrs/python-attrs.hash
+++ b/package/python-attrs/python-attrs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/attrs/json
-md5  5a9b5e9ceebc380a13fb93235b11bbda  attrs-21.4.0.tar.gz
-sha256  626ba8234211db98e869df76230a137c4c40a12d72445c45d5f5b716f076e2fd  attrs-21.4.0.tar.gz
+md5  0487081b7ead8753fc46cf7c6d1e28e3  attrs-22.1.0.tar.gz
+sha256  29adc2665447e5191d0e7c568fde78b21f9672d344281d0c6e1ab085429b22b6  attrs-22.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  bf659a28b49240602f56bbdf490cbe2ec509b15b98f99d7b19a52c740e327863  LICENSE
+sha256  882115c95dfc2af1eeb6714f8ec6d5cbcabf667caff8729f42420da63f714e9f  LICENSE
diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 4877d62285..33651ee80a 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ATTRS_VERSION = 21.4.0
+PYTHON_ATTRS_VERSION = 22.1.0
 PYTHON_ATTRS_SOURCE = attrs-$(PYTHON_ATTRS_VERSION).tar.gz
-PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/d7/77/ebb15fc26d0f815839ecd897b919ed6d85c050feeb83e100e020df9153d2
+PYTHON_ATTRS_SITE = https://files.pythonhosted.org/packages/1a/cb/c4ffeb41e7137b23755a45e1bfec9cbb76ecf51874c6f1d113984ecaa32c
 PYTHON_ATTRS_SETUP_TYPE = setuptools
 PYTHON_ATTRS_LICENSE = MIT
 PYTHON_ATTRS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
