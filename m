Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73902EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EE8D60A99;
	Sun, 18 Jun 2023 13:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EE8D60A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4ycTMgOfkpw; Sun, 18 Jun 2023 13:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41CA9611D0;
	Sun, 18 Jun 2023 13:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41CA9611D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CD331BF86B
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8D39414BF
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8D39414BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxoP0Pp__v02 for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:15:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE16B4149F
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:15:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE16B4149F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B923383D98; Sun, 18 Jun 2023 13:15:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 15:13:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78c9982d71a5a31e6b635d9f97acbce3ca447beb
X-Git-Newrev: 4e15d69160dfa975022de4c9f05a1a99be852322
X-Patchwork-Hint: ignore
Message-Id: <20230618131519.B923383D98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic: bump to version
 1.10.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e15d69160dfa975022de4c9f05a1a99be852322
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index e73a3099a8..88b17f4575 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  2e036b5f993b93dd83f6a7009252ae78  pydantic-1.10.4.tar.gz
-sha256  b9a3859f24eb4e097502a3be1fb4b2abb79b6103dd9e2e0edb70613a4459a648  pydantic-1.10.4.tar.gz
+md5  f0e286c32f40ec45aba9603742739cd6  pydantic-1.10.8.tar.gz
+sha256  1410275520dfa70effadf4c21811d755e7ef9bb1f1d077a21958153a92c8d9ca  pydantic-1.10.8.tar.gz
 # Locally computed sha256 checksums
 sha256  9e3946690ac88b6b73e8f001a0586af13568be8852fd514e4393f39761764387  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index a1a4dc9b16..b800426d22 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 1.10.4
+PYTHON_PYDANTIC_VERSION = 1.10.8
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/53/17/34e54e352f6a3d304044e52d5ddd5cd621a62ec8fb7af08cc73af65dd3e1
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/23/65/2aa13873e9e0084ecaec00fbe6c6096b65e1ab99ba66bdbf7e4e7c4cc915
 PYTHON_PYDANTIC_SETUP_TYPE = setuptools
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
