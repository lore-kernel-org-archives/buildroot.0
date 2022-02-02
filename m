Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45859C433EF
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 10:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6155404AF;
	Wed,  2 Feb 2022 10:24:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RQKumel9zhAr; Wed,  2 Feb 2022 10:24:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC9E640447;
	Wed,  2 Feb 2022 10:24:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34B421BF588
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8D4B818C2
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 10:21:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id elatsy9nRbLN for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 10:21:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A75881771
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 10:21:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 75CE1822ED; Wed,  2 Feb 2022 10:14:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 2 Feb 2022 11:10:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 519a50decd7ee051ca5b900bed8abc7d99105d02
X-Git-Newrev: b706d6a21c2d54213a05e9787036e04075a9c012
X-Patchwork-Hint: ignore
Message-Id: <20220202101446.75CE1822ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aioconsole: bump to version
 0.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b706d6a21c2d54213a05e9787036e04075a9c012
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aioconsole/python-aioconsole.hash | 4 ++--
 package/python-aioconsole/python-aioconsole.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aioconsole/python-aioconsole.hash b/package/python-aioconsole/python-aioconsole.hash
index 26a3778756..39ce16f8b2 100644
--- a/package/python-aioconsole/python-aioconsole.hash
+++ b/package/python-aioconsole/python-aioconsole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioconsole/json
-md5  f8b67330e631cfc45a9b2560a6e0fa98  aioconsole-0.3.3.tar.gz
-sha256  47df42d9f8cc3995bbe032dd5f01d32cc5b06639e9078bb9b4e3c55b237f5e32  aioconsole-0.3.3.tar.gz
+md5  56a1e6542ea3627bdbc67f24abcaa341  aioconsole-0.4.0.tar.gz
+sha256  a30ad5276b85dd20a48d235111d0bd26c6bedf7b56d605ffc10ae27124b4b0b4  aioconsole-0.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fe3eea6c599e23a00c08c5f5cb2320c30adc8f8687db5fcec9b79a662c53ff6b  LICENSE
diff --git a/package/python-aioconsole/python-aioconsole.mk b/package/python-aioconsole/python-aioconsole.mk
index f06d91a550..44857054d4 100644
--- a/package/python-aioconsole/python-aioconsole.mk
+++ b/package/python-aioconsole/python-aioconsole.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOCONSOLE_VERSION = 0.3.3
+PYTHON_AIOCONSOLE_VERSION = 0.4.0
 PYTHON_AIOCONSOLE_SOURCE = aioconsole-$(PYTHON_AIOCONSOLE_VERSION).tar.gz
-PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/dd/f6/bbc451ba96c1e1da6aa253f254b181ceb03272b475b27b481b57865d7d7f
+PYTHON_AIOCONSOLE_SITE = https://files.pythonhosted.org/packages/f2/7a/7628ec23f140ffca532c7f630e179503727b755849b5eab15576bbf7d3df
 PYTHON_AIOCONSOLE_SETUP_TYPE = setuptools
 PYTHON_AIOCONSOLE_LICENSE = GPL-3.0
 PYTHON_AIOCONSOLE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
