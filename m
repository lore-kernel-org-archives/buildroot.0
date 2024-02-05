Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9C6C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4955441750;
	Mon,  5 Feb 2024 11:17:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4955441750
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fwCUOi0o7J86; Mon,  5 Feb 2024 11:17:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36D2A4174F;
	Mon,  5 Feb 2024 11:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36D2A4174F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 510F11BF954
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28D2860F9F
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28D2860F9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9AageTIRjfgu for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:17:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3372B60F1B
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3372B60F1B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F14586BBB; Mon,  5 Feb 2024 11:17:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:17:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8928608c19048ac140cfc5e5f0e84d50d5d590d5
X-Git-Newrev: 9eb7860257442d7ab98ec7a417a7fb8d99fe797a
X-Patchwork-Hint: ignore
Message-Id: <20240205111738.1F14586BBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-stack-data: bump to version
 0.6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9eb7860257442d7ab98ec7a417a7fb8d99fe797a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-stack-data/python-stack-data.hash | 4 ++--
 package/python-stack-data/python-stack-data.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-stack-data/python-stack-data.hash b/package/python-stack-data/python-stack-data.hash
index 6decd3ca8e..b155a77c81 100644
--- a/package/python-stack-data/python-stack-data.hash
+++ b/package/python-stack-data/python-stack-data.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/stack_data/json
-md5  bf86c3c81a0158e1e7f3979da5a0033b  stack_data-0.6.2.tar.gz
-sha256  32d2dd0376772d01b6cb9fc996f3c8b57a357089dec328ed4b6553d037eaf815  stack_data-0.6.2.tar.gz
+md5  d04f7cda6589138e90691aec1edbf0d5  stack_data-0.6.3.tar.gz
+sha256  836a778de4fec4dcd1dcd89ed8abff8a221f58308462e1c4aa2a3cf30148f0b9  stack_data-0.6.3.tar.gz
 # Locally computed sha256 checksums
 sha256  a476a2cb0ef4c41450340a577a28b91ac4c7f669136b2ee148047fabd5fc4181  LICENSE.txt
diff --git a/package/python-stack-data/python-stack-data.mk b/package/python-stack-data/python-stack-data.mk
index 1a85938311..7c38d2c4eb 100644
--- a/package/python-stack-data/python-stack-data.mk
+++ b/package/python-stack-data/python-stack-data.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STACK_DATA_VERSION = 0.6.2
+PYTHON_STACK_DATA_VERSION = 0.6.3
 PYTHON_STACK_DATA_SOURCE = stack_data-$(PYTHON_STACK_DATA_VERSION).tar.gz
-PYTHON_STACK_DATA_SITE = https://files.pythonhosted.org/packages/db/18/aa7f2b111aeba2cd83503254d9133a912d7f61f459a0c8561858f0d72a56
+PYTHON_STACK_DATA_SITE = https://files.pythonhosted.org/packages/28/e3/55dcc2cfbc3ca9c29519eb6884dd1415ecb53b0e934862d3559ddcb7e20b
 PYTHON_STACK_DATA_SETUP_TYPE = pep517
 PYTHON_STACK_DATA_LICENSE = MIT
 PYTHON_STACK_DATA_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
