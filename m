Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3755DD1BDF1
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 033AB4030B;
	Mon,  4 Nov 2024 20:42:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDGDpgS7z5hR; Mon,  4 Nov 2024 20:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD5E14031B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD5E14031B;
	Mon,  4 Nov 2024 20:42:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BD1CAB8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DC1A402A9
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_KRCwHlb-0T for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 175334052B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 175334052B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1347684CC9; Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 21:39:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f02bc034d7e2e393af3598142b24abdc02fdc790
X-Git-Newrev: 56430ba0a5a07cfa1386909eb682432f61b98e2e
X-Patchwork-Hint: ignore
Message-Id: <20241104204205.1347684CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pdm-backend: bump to
 version 2.4.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=56430ba0a5a07cfa1386909eb682432f61b98e2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pdm-backend/python-pdm-backend.hash | 4 ++--
 package/python-pdm-backend/python-pdm-backend.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pdm-backend/python-pdm-backend.hash b/package/python-pdm-backend/python-pdm-backend.hash
index e6868dfaee..9e33849329 100644
--- a/package/python-pdm-backend/python-pdm-backend.hash
+++ b/package/python-pdm-backend/python-pdm-backend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pdm-backend/json
-md5  6a36245db609345cd0f5f0443d00e19b  pdm_backend-2.4.1.tar.gz
-sha256  d6404e94a612459c5213cc63df035711244173c57441b8312a2a6f4a8c110934  pdm_backend-2.4.1.tar.gz
+md5  3aad60c8b253336b09129551677912ad  pdm_backend-2.4.3.tar.gz
+sha256  dbd9047a7ac10d11a5227e97163b617ad5d665050476ff63867d971758200728  pdm_backend-2.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256  1da058ed0440fea5df1765b19a1418800439b18fd6f1c13c7d429cb81e9c6d47  LICENSE
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
index 075bd59782..0565de5b8c 100644
--- a/package/python-pdm-backend/python-pdm-backend.mk
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PDM_BACKEND_VERSION = 2.4.1
+PYTHON_PDM_BACKEND_VERSION = 2.4.3
 PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
-PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/ab/5f/a77102e4a50d0b80ed4371425a3279c57b0a09e1658f9f7b4f1fbc44db05
+PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/d9/bf/d75d568521cef171ae9138d9ab55c169a98ee803853ca87b7096e4636d5b
 PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
 PYTHON_PDM_BACKEND_LICENSE = MIT
 PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
