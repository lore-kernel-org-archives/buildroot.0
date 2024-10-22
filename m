Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405EFCDD0D7
	for <buildroot@archiver.kernel.org>; Tue, 22 Oct 2024 19:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D01E760835;
	Tue, 22 Oct 2024 19:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U7ZSxP00EXTH; Tue, 22 Oct 2024 19:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6612960818
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6612960818;
	Tue, 22 Oct 2024 19:17:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E2402072
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6384280D30
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:16:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYBPVwiI38Wm for <buildroot@buildroot.org>;
 Tue, 22 Oct 2024 19:16:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 387ED80D52
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 387ED80D52
 for <buildroot@buildroot.org>; Tue, 22 Oct 2024 19:16:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 35D6D81249; Tue, 22 Oct 2024 19:16:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Oct 2024 21:11:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b1c20a8167be3323ff33ecd4b3f6bcf93a9ad63
X-Git-Newrev: d4a1c5d35ca2cea7f9e212c2b9ed0064585fb282
X-Patchwork-Hint: ignore
Message-Id: <20241022191654.35D6D81249@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xmltodict: bump to version
 0.14.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=d4a1c5d35ca2cea7f9e212c2b9ed0064585fb282
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-xmltodict/python-xmltodict.hash | 4 ++--
 package/python-xmltodict/python-xmltodict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xmltodict/python-xmltodict.hash b/package/python-xmltodict/python-xmltodict.hash
index 48fb5265f6..712f94a08b 100644
--- a/package/python-xmltodict/python-xmltodict.hash
+++ b/package/python-xmltodict/python-xmltodict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xmltodict/json
-md5  1ece0a5bbd494bac414058405606475e  xmltodict-0.13.0.tar.gz
-sha256  341595a488e3e01a85a9d8911d8912fd922ede5fecc4dce437eb4b6c8d037e56  xmltodict-0.13.0.tar.gz
+md5  9b98d656bb655aa7c7561a2ab811c83f  xmltodict-0.14.1.tar.gz
+sha256  338c8431e4fc554517651972d62f06958718f6262b04316917008e8fd677a6b0  xmltodict-0.14.1.tar.gz
 # Locally computed sha256 checksums
 sha256  d66d5eb8f83a0ba21d3dd04318b8817588e8764daabea852d1035e3f07ffda55  LICENSE
diff --git a/package/python-xmltodict/python-xmltodict.mk b/package/python-xmltodict/python-xmltodict.mk
index 9201bc1507..b151f28823 100644
--- a/package/python-xmltodict/python-xmltodict.mk
+++ b/package/python-xmltodict/python-xmltodict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XMLTODICT_VERSION = 0.13.0
+PYTHON_XMLTODICT_VERSION = 0.14.1
 PYTHON_XMLTODICT_SOURCE = xmltodict-$(PYTHON_XMLTODICT_VERSION).tar.gz
-PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/39/0d/40df5be1e684bbaecdb9d1e0e40d5d482465de6b00cbb92b84ee5d243c7f
+PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/98/f7/d29b8cdc9d8d075673be0f800013c1161e2fd4234546a140855a1bcc9eb4
 PYTHON_XMLTODICT_SETUP_TYPE = setuptools
 PYTHON_XMLTODICT_LICENSE = MIT
 PYTHON_XMLTODICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
