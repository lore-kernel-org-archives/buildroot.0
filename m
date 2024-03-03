Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83179C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 20:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52156407E8;
	Sun,  3 Mar 2024 20:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5_qRsJRVuHTp; Sun,  3 Mar 2024 20:35:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 035DB407BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 035DB407BC;
	Sun,  3 Mar 2024 20:35:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0101E1BF94D
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 20:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDE1140B07
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 20:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nrn9Q1iZG0Mg for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 20:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5F1F40AFE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5F1F40AFE
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 20:35:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F24488021; Sun,  3 Mar 2024 20:35:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 21:31:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 57008d384bc1f2e42d6add6cd73203e11a75d6c9
X-Git-Newrev: e8545ee43923242c74a5ebbb7ef1b8857ae90550
X-Patchwork-Hint: ignore
Message-Id: <20240303203530.8F24488021@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-uvicorn: bump
 to 0.27.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8545ee43923242c74a5ebbb7ef1b8857ae90550
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changelog:
https://github.com/encode/uvicorn/blob/master/CHANGELOG.md#0271---2024-02-10

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-uvicorn/python-uvicorn.hash | 4 ++--
 package/python-uvicorn/python-uvicorn.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uvicorn/python-uvicorn.hash b/package/python-uvicorn/python-uvicorn.hash
index c7feaf3bfe..773995ab9d 100644
--- a/package/python-uvicorn/python-uvicorn.hash
+++ b/package/python-uvicorn/python-uvicorn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uvicorn/json
-md5  a98f96c2578d9e6d454e271d0eae3ba3  uvicorn-0.27.0.post1.tar.gz
-sha256  54898fcd80c13ff1cd28bf77b04ec9dbd8ff60c5259b499b4b12bb0917f22907  uvicorn-0.27.0.post1.tar.gz
+md5  98f40515e34fb49e9d2842b6a147acec  uvicorn-0.27.1.tar.gz
+sha256  3d9a267296243532db80c83a959a3400502165ade2c1338dea4e67915fd4745a  uvicorn-0.27.1.tar.gz
 # Locally computed sha256 checksums
 sha256  efe1acf3e62fb99c288b0ec73e5a773b7268ef4320fe757ea994214e4b63c371  LICENSE.md
diff --git a/package/python-uvicorn/python-uvicorn.mk b/package/python-uvicorn/python-uvicorn.mk
index 502cc06ad8..899b9660f6 100644
--- a/package/python-uvicorn/python-uvicorn.mk
+++ b/package/python-uvicorn/python-uvicorn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UVICORN_VERSION = 0.27.0.post1
+PYTHON_UVICORN_VERSION = 0.27.1
 PYTHON_UVICORN_SOURCE = uvicorn-$(PYTHON_UVICORN_VERSION).tar.gz
-PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/38/56/7bc5cf1d693d0c8e5d9dd66c29808691c17260b31346e4ddfbee26ba9bc2
+PYTHON_UVICORN_SITE = https://files.pythonhosted.org/packages/09/d8/8aa69c76585035ca81851d99c3b00fd6be050aefd478a5376ff9fc5feb69
 PYTHON_UVICORN_SETUP_TYPE = pep517
 PYTHON_UVICORN_LICENSE = BSD-3-Clause
 PYTHON_UVICORN_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
