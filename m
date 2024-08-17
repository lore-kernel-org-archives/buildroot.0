Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58A3E6FE47
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82E4784488;
	Fri,  6 Sep 2024 20:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id qsaMOWq9aIOc; Fri,  6 Sep 2024 20:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5949844B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5949844B5;
	Fri,  6 Sep 2024 20:00:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 198B11BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C84F540822
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QpOmsoL_SkZE for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A51904086C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A51904086C
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A2C7A86EE4; Fri,  6 Sep 2024 19:58:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 Aug 2024 11:40:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdb38723ad832dd1c28b028a0f48a938f6d20c7a
X-Git-Newrev: d8335bee355309408f95714ebdb10dd0656cb441
X-Patchwork-Hint: ignore
Message-Id: <20240906195854.A2C7A86EE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to 0.112.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8335bee355309408f95714ebdb10dd0656cb441
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
* https://github.com/fastapi/fastapi/releases/tag/0.111.1
* https://github.com/fastapi/fastapi/releases/tag/0.112.0
* https://github.com/fastapi/fastapi/releases/tag/0.112.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 2be006a97d..203af3e915 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  32df7b178fb59e180d34729be33d5024  fastapi-0.111.0.tar.gz
-sha256  b9db9dd147c91cb8b769f7183535773d8741dd46f9dc6676cd82eab510228cd7  fastapi-0.111.0.tar.gz
+md5  f42ce6731bca9412b36b0537672cf568  fastapi-0.112.1.tar.gz
+sha256  b2537146f8c23389a7faa8b03d0bd38d4986e6983874557d95eed2acc46448ef  fastapi-0.112.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 262b166907..5fd91c691b 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.111.0
+PYTHON_FASTAPI_VERSION = 0.112.1
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/0e/1f/f4a99e92c583780787e04b05aa9d8a8db9ec76d091d81545948a006f5b44
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/2c/09/71a961740a1121d7cc90c99036cc3fbb507bf0c69860d08d4388f842196b
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
