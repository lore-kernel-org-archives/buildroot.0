Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9B2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 17:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86FF142410;
	Sat, 23 Jul 2022 17:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86FF142410
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3x0FpkF_N9Z; Sat, 23 Jul 2022 16:59:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2717E417BC;
	Sat, 23 Jul 2022 16:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2717E417BC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 077961BF957
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAF3E4055E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAF3E4055E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B9qxXuiq8WkZ for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:57:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0148C40A59
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0148C40A59
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id C8D84847F3; Sat, 23 Jul 2022 16:44:12 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 18:57:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e49122a58d8c6cbf61fb9c1fc16be7a3fa712d09
X-Git-Newrev: 7f3debbc370a48fc2f408701088162041bcf1f7c
X-Patchwork-Hint: ignore
Message-Id: <20220723164412.C8D84847F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xmltodict: bump to version
 0.13.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f3debbc370a48fc2f408701088162041bcf1f7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update indentation in hash file (two spaces)

https://github.com/martinblech/xmltodict/blob/v0.13.0/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-xmltodict/python-xmltodict.hash | 6 +++---
 package/python-xmltodict/python-xmltodict.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xmltodict/python-xmltodict.hash b/package/python-xmltodict/python-xmltodict.hash
index 16422d78c9..48fb5265f6 100644
--- a/package/python-xmltodict/python-xmltodict.hash
+++ b/package/python-xmltodict/python-xmltodict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xmltodict/json
-md5	ddb2bd078cef4f7e3021a578034ad941  xmltodict-0.12.0.tar.gz
-sha256	50d8c638ed7ecb88d90561beedbf720c9b4e851a9fa6c47ebd64e99d166d8a21  xmltodict-0.12.0.tar.gz
+md5  1ece0a5bbd494bac414058405606475e  xmltodict-0.13.0.tar.gz
+sha256  341595a488e3e01a85a9d8911d8912fd922ede5fecc4dce437eb4b6c8d037e56  xmltodict-0.13.0.tar.gz
 # Locally computed sha256 checksums
-sha256	d66d5eb8f83a0ba21d3dd04318b8817588e8764daabea852d1035e3f07ffda55  LICENSE
+sha256  d66d5eb8f83a0ba21d3dd04318b8817588e8764daabea852d1035e3f07ffda55  LICENSE
diff --git a/package/python-xmltodict/python-xmltodict.mk b/package/python-xmltodict/python-xmltodict.mk
index 05be4b3c6c..9201bc1507 100644
--- a/package/python-xmltodict/python-xmltodict.mk
+++ b/package/python-xmltodict/python-xmltodict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XMLTODICT_VERSION = 0.12.0
+PYTHON_XMLTODICT_VERSION = 0.13.0
 PYTHON_XMLTODICT_SOURCE = xmltodict-$(PYTHON_XMLTODICT_VERSION).tar.gz
-PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/58/40/0d783e14112e064127063fbf5d1fe1351723e5dfe9d6daad346a305f6c49
+PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/39/0d/40df5be1e684bbaecdb9d1e0e40d5d482465de6b00cbb92b84ee5d243c7f
 PYTHON_XMLTODICT_SETUP_TYPE = setuptools
 PYTHON_XMLTODICT_LICENSE = MIT
 PYTHON_XMLTODICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
