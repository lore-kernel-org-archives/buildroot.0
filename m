Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E75C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0230D4014D;
	Sat,  4 Nov 2023 17:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0230D4014D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yYsskoLRmfdK; Sat,  4 Nov 2023 17:59:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC12740159;
	Sat,  4 Nov 2023 17:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC12740159
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F67F1BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4ECD541C4E
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ECD541C4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i9dwi9Y0z3fi for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:59:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32F3A41C46
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:59:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32F3A41C46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1472E866C2; Sat,  4 Nov 2023 17:59:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 18:56:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f6024153032d4f7a3406f43aaebe6c2c6be5cf6
X-Git-Newrev: a001ca657b4434989900a2a2a55faae45b786a6a
X-Patchwork-Hint: ignore
Message-Id: <20231104175927.1472E866C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-wsaccel: bump version to
 0.6.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=a001ca657b4434989900a2a2a55faae45b786a6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-wsaccel/python-wsaccel.hash | 4 ++--
 package/python-wsaccel/python-wsaccel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wsaccel/python-wsaccel.hash b/package/python-wsaccel/python-wsaccel.hash
index b388c3cc7c..9991f8f454 100644
--- a/package/python-wsaccel/python-wsaccel.hash
+++ b/package/python-wsaccel/python-wsaccel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wsaccel/json
-md5  73bdc70035813ded14f9a4b81e82622a  wsaccel-0.6.4.tar.gz
-sha256  cbf66a88bcaf6c6ad16d50ea29215891526b6e993c4bc7ed44b044ee6fe3ad3d  wsaccel-0.6.4.tar.gz
+md5  b05eecfac9cb19326bfc3b538de495ac  wsaccel-0.6.6.tar.gz
+sha256  18efec0a7182587ba97102b4cd8df7b4f665f45d7ca36f19783f5f081ea114ea  wsaccel-0.6.6.tar.gz
 # Locally computed sha256 checksums
 sha256  b6982974cb838b985b54b663d1780d280735086249c2e28015f25dd455df25da  LICENSE
diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
index ce41d431ff..1f63aa5c40 100644
--- a/package/python-wsaccel/python-wsaccel.mk
+++ b/package/python-wsaccel/python-wsaccel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WSACCEL_VERSION = 0.6.4
+PYTHON_WSACCEL_VERSION = 0.6.6
 PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
-PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/77/0b/a44df15382a76b6768184630d483b8363d65b9f70d1aacf76153d496bbb9
+PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/94/28/41c0e711b538f6031a247ab4ec5352267f12ed416e3a638b8d55fc33f609
 PYTHON_WSACCEL_LICENSE = Apache-2.0
 PYTHON_WSACCEL_LICENSE_FILES = LICENSE
 PYTHON_WSACCEL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
