Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F2CCF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA3668197D;
	Sun, 22 Sep 2024 10:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnLXcMHFZT8e; Sun, 22 Sep 2024 10:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4330481443
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4330481443;
	Sun, 22 Sep 2024 10:35:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59D8E1BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F15840318
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MtS4vLkNBhU7 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 571FF40252
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 571FF40252
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5272380FD8; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:30:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd02650a580b25192a587bf6b467f81be8de6330
X-Git-Newrev: a540c340c4ef54da67de479489201bf75e5317c2
X-Patchwork-Hint: ignore
Message-Id: <20240922103441.5272380FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tqdm: bump to version 4.66.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=a540c340c4ef54da67de479489201bf75e5317c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash changed due to year update:
https://github.com/tqdm/tqdm/commit/7323d5bcc9b032d525f9d6468a9713f5be9c4174

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-tqdm/python-tqdm.hash | 8 ++++----
 package/python-tqdm/python-tqdm.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
index 4be54de7de..ee59af438f 100644
--- a/package/python-tqdm/python-tqdm.hash
+++ b/package/python-tqdm/python-tqdm.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/project/tqdm
-md5  5822af464d77ea156ad1167c23e1bdac  tqdm-4.64.1.tar.gz
-sha256  5f4f682a004951c1b450bc753c710e9280c5746ce6ffedee253ddbcbf54cf1e4  tqdm-4.64.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/tqdm/json
+md5  32e8dc7da1490d96d944f61a1d0ecd4a  tqdm-4.66.5.tar.gz
+sha256  e1020aef2e5096702d8a025ac7d16b1577279c9d63f8375b63083e9a5f0fcbad  tqdm-4.66.5.tar.gz
 # Locally computed sha256 checksums
-sha256  a0fc1785a8f2a200a3124d703d49550601b7741ccffc861713c2ddaa07a537dd  LICENCE
+sha256  dc33252e829015e3b150086fb9b3a40f6ad6fb32c2f4610ce812fa677d35986a  LICENCE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index a6296bd0f5..c91aaf2875 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TQDM_VERSION = 4.64.1
+PYTHON_TQDM_VERSION = 4.66.5
 PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
-PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/c1/c2/d8a40e5363fb01806870e444fc1d066282743292ff32a9da54af51ce36a2
+PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/58/83/6ba9844a41128c62e810fddddd72473201f3eacde02046066142a2d96cc5
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
